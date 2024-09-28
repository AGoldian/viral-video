# from transformers import AutoTokenizer, AutoModelForCausalLM, AutoProcessor

# candidates
from viral.r2_candidates import get_json_from_video_r2
from viral.splash_audio_candidates import get_json_of_audio_moments

# from viral.llama_text_candidates import text_to_timestamps

# processing
from viral.utils import split_video, merge_jsons
from viral.video_agg import transcribe_video, create_subtitles, video_to_text

from settings import config
import moviepy.editor as mp
import os
import json
base_path = './rest/pythonProject3/'
fname = '4cb8085a4154b91c5e6288c33b70949c.mp4'

video_path = f'{base_path}/{fname}'



# Нарезаем видео на части
video_parts = split_video(fname, video_path)
# Возвращает пути


# llama_model = AutoModelForCausalLM.from_pretrained(
#     config.LLAMA_MODEL_DIRECTORY,
#     torch_dtype="auto",
#     device_map="auto",
#     local_files_only=True
# )

# # Load the processor from local files
# llama_processor = AutoProcessor.from_pretrained(
#     config.LLAMA_MODEL_DIRECTORY,
#     local_files_only=True
# )


def cut_video(video_path, candidates):
    # Load the video file
    video = mp.VideoFileClip(video_path)
    
    saved_paths = []

    candidates = json.loads(candidates)
    for i, candidate in enumerate(candidates):
        print(i, candidate)
        start_time = candidate['time_start']
        end_time = candidate['time_end']
        
        # Cut the video based on start and end time
        part = video.subclip(start_time, end_time)
        
        # Save the new video part
        output_path = f"part_{i}.mp4"
        part.write_videofile(output_path, codec="libx264")
        
        saved_paths.append(output_path)

    return saved_paths


for idx, part in enumerate(video_parts):
    print(f"Видео разбито на {len(video_parts)} частей")
    texts = video_to_text(part, model_name=config.WHISPER_MODEL)
    print("Транскрибируем видео...")

    print("Получаем кандидаты из разных моделей")
    json_candidates_from_r2 = None #get_json_from_video_r2(part, 
                                                    #  config.R2_SCRIPT_PATH,
                                                    #  config.R2_PROMPT,
                                                    #  config.R2_CONFIG_PATH,
                                                    #  config.R2_CHECPOINT_PATH) # default 5 candidates
    print("Кандидаты из R2-Tuning получены")
    json_candidates_audio = get_json_of_audio_moments(part,
                                                     config.AUDIO_WINDOW_SIZE_IN_SECS, 
                                                     config.AUDIO_NUM_CANDIDATES, 
                                                     config.AUDIO_OUTPUT_PATH)
    print(json_candidates_audio)
    print("Кандидаты из аудио получены")
    
    json_candidates_llama = None #text_to_timestamps(texts, model=llama_model, processor=llama_processor)
    print("Кандидаты из LLM получены")
    # select best candidates

    candidates = merge_jsons([json_candidates_audio,json_candidates_llama, json_candidates_from_r2])
    print("Транскрибируем видео...")
    segments = transcribe_video(part, whisper_model=config.WHISPER_MODEL)
    print("Накладываем субтитры...")

    print(candidates)
    saved_paths = cut_video(video_path, candidates)
    for k, tmp_path in enumerate(saved_paths):
        output_path = f'{base_path}_out_{idx}_{k}.MP4'

        create_subtitles(tmp_path, segments, f"{output_path}")
        # create_subtitles2(tmp_path, segments, f"{output_path}")
        print(f"Видео сохранено с субтитрами: {output_path}")
