import argparse
import torch
from transformers import AutoModelForCausalLM, AutoProcessor
from viral.r2_candidates import get_json_from_video_r2
from viral.splash_audio_candidates import get_json_of_audio_moments
from viral.llama_text_candidates import text_to_timestamps
from viral.utils import split_video, merge_jsons
from viral.video_agg import transcribe_video, create_subtitles, video_to_text
from settings import config
import moviepy.editor as mp
import json
import os

def cut_video(video_path, candidates):
    """
    Cuts the video into smaller parts based on the start and end times of the candidates.

    Args:
        video_path (str): The path to the video file.
        candidates (str): A JSON string containing candidate segments with start and end times.

    Returns:
        List[str]: A list of file paths for the saved video segments.
    """
    video = mp.VideoFileClip(video_path)
    saved_paths = []
    candidates = json.loads(candidates)
    
    for i, candidate in enumerate(candidates):
        start_time = candidate['time_start']
        end_time = candidate['time_end']
        
        part = video.subclip(start_time, end_time)
        output_path = f"part_{i}.mp4"
        part.write_videofile(output_path, codec="libx264")
        saved_paths.append(output_path)

    return saved_paths

def process_video(base_path, fname):
    """
    Processes the given video by splitting it into parts, generating text transcriptions,
    extracting candidates from different models, and adding subtitles to the final video parts.

    Args:
        base_path (str): The base directory path where the video is located.
        fname (str): The file name of the video to process.

    Returns:
        None
    """
    video_path = os.path.join(base_path, fname)
    video_parts = split_video(fname, video_path)
    
    llama_model = AutoModelForCausalLM.from_pretrained(
        config.LLAMA_MODEL_DIRECTORY,
        torch_dtype="auto",
        device_map="auto",
        local_files_only=True
    )
    llama_processor = AutoProcessor.from_pretrained(
        config.LLAMA_MODEL_DIRECTORY,
        local_files_only=True
    )
    
    for idx, part in enumerate(video_parts):
        print(f"Видео разбито на {len(video_parts)} частей")
        texts = video_to_text(part, model_name=config.WHISPER_MODEL)
        print("Транскрибируем видео...")

        print("Получаем кандидаты из разных моделей")
        json_candidates_from_r2 = get_json_from_video_r2(part, 
                                                         config.R2_SCRIPT_PATH,
                                                         config.R2_PROMPT,
                                                         config.R2_CONFIG_PATH,
                                                         config.R2_CHECPOINT_PATH)
        print("Кандидаты из R2-Tuning получены")
        json_candidates_audio = get_json_of_audio_moments(part,
                                                         config.AUDIO_WINDOW_SIZE_IN_SECS, 
                                                         config.AUDIO_NUM_CANDIDATES, 
                                                         config.AUDIO_OUTPUT_PATH)
        print(json_candidates_audio)
        print("Кандидаты из аудио получены")
        
        json_candidates_llama = text_to_timestamps(texts, model=llama_model, processor=llama_processor)
        print("Кандидаты из LLM получены")

        candidates = merge_jsons([json_candidates_audio, json_candidates_llama, json_candidates_from_r2])
        print("Накладываем субтитры...")
        
        saved_paths = cut_video(video_path, candidates)
        for k, tmp_path in enumerate(saved_paths):
            output_path = os.path.join(base_path, f'_out_{idx}_{k}.MP4')
            segments = transcribe_video(tmp_path, whisper_model=config.WHISPER_MODEL)
            create_subtitles(tmp_path, segments, f"{output_path}")
            print(f"Видео сохранено с субтитрами: {output_path}")

if __name__ == "__main__":
    """
    Main entry point for the script. Processes video files by taking base path and filename
    from command-line arguments and performs video splitting, candidate extraction, and subtitle creation.

    Arguments:
    --base_path: The base directory where the video is located (default: './rest/pythonProject3/').
    --fname: The name of the video file to process (default: '4cb8085a4154b91c5e6288c33b70949c.mp4').
    """
    parser = argparse.ArgumentParser(description='Process a video for subtitle and candidate extraction.')
    parser.add_argument('--base_path', type=str, default='./rest/pythonProject3/', help='Base path of the video files')
    parser.add_argument('--fname', type=str, default='4cb8085a4154b91c5e6288c33b70949c.mp4', help='File name of the video to process')

    args = parser.parse_args()
    process_video(args.base_path, args.fname)
