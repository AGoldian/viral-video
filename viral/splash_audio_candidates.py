import moviepy.editor as mp
import librosa
import numpy as np

def extract_audio(video_path, audio_output_path):
    video = mp.VideoFileClip(video_path)
    video.audio.write_audiofile(audio_output_path)

def load_audio(audio_path, sr=22050):
    audio, sr = librosa.load(audio_path, sr=sr)
    return audio, sr

def calculate_heuristic_with_timestamps(audio, sr, window_size=5, hop_size=0.5):
    window_length = int(window_size * sr)
    hop_length = int(hop_size * sr)

    heuristics_with_timestamps = []
    num_windows = (len(audio) - window_length) // hop_length + 1

    for i in range(num_windows):
        start = i * hop_length
        end = start + window_length
        window = audio[start:end]

        rms = np.sqrt(np.mean(window ** 2))

        zero_crossings = np.sum(librosa.zero_crossings(window))

        heuristic = rms * (1 + zero_crossings)

        start_time = start / sr
        end_time = end / sr

        heuristics_with_timestamps.append((heuristic, start_time, end_time))

    return heuristics_with_timestamps

def sort_by_heuristic(heuristics_with_timestamps):
    return sorted(heuristics_with_timestamps, key=lambda x: x[0], reverse=True)

def remove_overlapping_intervals(sorted_heuristics):
    non_overlapping_intervals = []

    for current in sorted_heuristics:
        if not non_overlapping_intervals:
            non_overlapping_intervals.append(current)
        else:
            last_interval = non_overlapping_intervals[-1]
            _, last_start, last_end = last_interval
            _, current_start, current_end = current

            if current_start < last_end:
                continue
            else:
                non_overlapping_intervals.append(current)

    return non_overlapping_intervals

import json

def seconds_to_time_format(seconds):
    """
    Преобразует секунды в строковый формат MM:SS.
    """
    minutes = int(seconds // 60)
    seconds = int(seconds % 60)
    return f"{minutes:02}:{seconds:02}"

def generate_audio_highlights_from_intervals(final_intervals):
    """
    Преобразует список интервалов в формат JSON.
    
    Аргументы:
    final_intervals -- список кортежей в формате (heuristic, relative_heuristic, start_time, end_time, window_size)
    
    Возвращает:
    JSON строку с аудио подсветками.
    """
    highlights = []
    
    for interval in final_intervals:
        _, start_time, end_time = interval
        highlight = {
            "time_start": seconds_to_time_format(start_time),
            "time_end": seconds_to_time_format(end_time),
            "reason": "Audio Highlights"
        }
        highlights.append(highlight)
    
    return json.dumps(highlights, indent=4, ensure_ascii=False)

def create_json_of_audio_momets(video_path,WINDOW_SIZE_IN_SECS,NUM_CANDIDATES)

    extract_audio(video_path, audio_output_path)

    audio, sr = load_audio(audio_output_path)

    heuristics_with_timestamps = calculate_heuristic_with_timestamps(audio, sr, WINDOW_SIZE_IN_SECS)

    sorted_heuristics = sort_by_heuristic(heuristics_with_timestamps)

    final_intervals = remove_overlapping_intervals(sorted_heuristics)

    return generate_audio_highlights_from_intervals(final_intervals[:NUM_CANDIDATES])


NUM_CANDIDATES = 5
WINDOW_SIZE_IN_SECS = 5

audio_output_path = "extracted_audio.wav" #'это можно не трогать'

video_path = '' #задать

create_json_of_audio_momets(video_path,WINDOW_SIZE_IN_SECS,NUM_CANDIDATES)