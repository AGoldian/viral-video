import os
import json
import requests
from PIL import Image
import torch
from transformers import AutoTokenizer, AutoModelForCausalLM, AutoProcessor
import whisper
from datetime import timedelta
import srt


def video_to_text(video_name, is_whisper=False):
    if is_whisper == True:
        def run_transcribe(audio_file_name):
            print("Whisper is started")
            model_name = 'base'
            model = whisper.load_model(model_name)
            audio_file_language = 'russian'
            no_speech_threshold = 0.2

            result = model.transcribe(
                audio_file_name,
                language=audio_file_language,
                verbose=True,
                no_speech_threshold=no_speech_threshold,
                suppress_tokens="",
                initial_prompt="",
                condition_on_previous_text="Нет"
                )

            result_srt_list = []
            for i in result['segments']:
                result_srt_list.append(srt.Subtitle(index=i['id'], start=timedelta(seconds=i['start']), end=timedelta(seconds=i['end']), content=i['text'].strip()))

            composed_transcription = srt.compose(result_srt_list)
            return composed_transcription

        res = run_transcribe(audio_file_name=f"/tmp/video/{video_name}.mp4")

        with open(f"/tmp/texts/audio_{video_name}.txt", 'w', encoding='utf-8') as f:
            f.write(res)

    file_path = f"/tmp/texts/audio_{video_name}.txt"

    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File {file_path} not found.")

    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    print(video_name)
    print(lines)
    return lines

def text_to_timestamps(text, model, processor):
    prompt_answer = f"""
    <|startoftext|><|start_header_id|>user<|end_header_id|>
    Ты являешься экспертом по выявлению вирусного контента из транскриптов видео. Я предоставлю фрагмент разговора, и твоя задача — определить самые увлекательные отрезки длиной 10-30 секунд, которые имеют наибольший потенциал стать вирусными. Твой анализ должен основываться на следующих ключевых элементах вирусного контента:

    Пожалуйста, предоставь временные отрезки и объясни, почему они были выбраны.

    Инструкции:

    Проанализируй предоставленный транскрипт, определи наиболее вероятные вирусные моменты и объясни, почему ты выбрал именно их, основываясь на ключевых элементах вирусного контента.
    Твой ответ должен быть на русском языке.
    Транскрибация:
    "
    {text}
    "
    <|eot_id|><|start_header_id|>assistant<|end_header_id|>

    """
    inputs = processor(prompt_answer, return_tensors="pt").to(model.device)
    output = model.generate(**inputs, max_new_tokens=3000)
    output_text = processor.decode(output[0]).split('<|eot_id|><|start_header_id|>assistant<|end_header_id|>')[1]

    prompt_format =  """

    <|startoftext|><|start_header_id|>user<|end_header_id|>

    Вы — эксперт по созданию вирусных видео. Пожалуйста, объедините и выберите из списка ниже временные промежутки так, каждый продолжительностью до 10 секунд. Цель — создать более привлекательные фрагменты.
    Инструкция:
    Убедитесь, что выбранные фрагменты вместе создают увлекательное видео, способное привлечь и удержать внимание аудитории.

    Верни json в следующем формате:
    {time_start,
    time_end,
    reason - причина почему ты так считаешь.}
    Например:
[
    { 
        "time_start": "05:54",
        "time_end": "06:13",
        "reason": "Забавный момент, который добавляет легкости и помогает удерживать внимание аудитории." 
    },
    { 
        "time_start": "07:00", 
        "time_end": "07:29", 
        "reason": "Интересный и эмоциональный эпизод, привлекающий внимание зрителей." 
    },
    { 
        "time_start": "08:04", 
        "time_end": "08:30", 
        "reason": "Эмоциональная сцена, создающая яркие впечатления и вызывающая отклик у зрителей." 
    },
    { 
        "time_start": "04:29", 
        "time_end": "04:31", 
        "reason": "Короткий юмористический момент, который вызывает улыбку и усиливает связь с аудиторией." 
    },
    { 
        "time_start": "11:04", 
        "time_end": "11:11", 
        "reason": "Интересный факт, который вызывает любопытство и поддерживает интерес к видео." 
    }
]
    "
    """ + output_text + """ "<|eot_id|><|start_header_id|>assistant<|end_header_id|>"""

    # print(prompt_format)
    inputs = processor(prompt_format, return_tensors="pt").to(model.device)
    output = model.generate(**inputs, max_new_tokens=3000)
    output_result = processor.decode(output[0]).split('<|eot_id|><|start_header_id|>assistant<|end_header_id|>')[1]
    return output_result


def main(video_name: str, model_dir: str):
    print("OK")
    
    # Load the model from local files
    model = AutoModelForCausalLM.from_pretrained(
        model_dir,
        torch_dtype="auto",
        device_map="auto",
        local_files_only=True  # Ensure the model is loaded from local files
    )
    
    # Load the processor from local files
    processor = AutoProcessor.from_pretrained(
        model_dir,
        local_files_only=True  # Ensure processor is loaded from local files
    )
    
    # Extract text from the video (assuming `video_to_text` is defined elsewhere)
    text_excerpt = video_to_text(video_name, False)
    window_size = 100
    print(len(text_excerpt))
    
    candidates = []
    if len(text_excerpt) > 0:
        for i in range(10, len(text_excerpt) - window_size - 1, window_size):
            text = ''.join(text_excerpt[i:i+window_size])
            print("OK")
            
            # Convert text to timestamps (assuming `text_to_timestamps` is defined elsewhere)
            timestamps = text_to_timestamps(text, model, processor)
            
            candidates.append(timestamps)
            print(timestamps)
            print('--------------------------------------')
    
        # Write the results to a file
        with open(f"/result/{video_name}.txt", "w") as f:
            f.write(str(candidates))
            print("OK")
    
    print("end")


if __name__ == "__main__":
    video_input = "0c6e4cdaa192d1ae58b99bc9f35891b9"
    model_directory = "/tmp/llama-3.2-transformers-3b-instruct-v1"
    main(video_input, model_directory)