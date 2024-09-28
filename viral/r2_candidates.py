!git clone https://github.com/yeliudev/R2-Tuning.git
!pip install -r R2-Tuning/requirements.txt
!pip install nncore==0.4.4
!python -m pip install setuptools==69.5.1

import subprocess
import re
import json
import os
import math


# Функция для преобразования секунд в формат 'MM:SS'
def seconds_to_timecode(seconds):
    minutes = int(seconds // 60)
    secs = int(seconds % 60)
    return f"{minutes:02}:{secs:02}"

# Функция для парсинга вывода и формирования json
def parse_output_and_create_json(output):
    # Регулярное выражение для поиска строк с временем и оценкой
    pattern = r"(\d+\.\d+)\s+(\d+\.\d+)\s+(\d+\.\d+)"
    
    results = []
    for match in re.finditer(pattern, output):
        start_time_sec, end_time_sec, score = map(float, match.groups())
        
        # Преобразуем время в формат 'MM:SS'
        start_time = seconds_to_timecode(start_time_sec)
        end_time = seconds_to_timecode(end_time_sec)
        
        # Формируем объект и добавляем его в список
        results.append({
            "time_start": start_time,
            "time_end": end_time,
            "reason": "R2"
        })
    
    # Преобразуем список объектов в JSON
    return json.dumps(results, ensure_ascii=False, indent=4)


# Функция для получения размера файла в мегабайтах
def get_file_size_mb(file_path):
    file_size = os.path.getsize(file_path)
    return file_size / (1024 * 1024)  # перевод в МБ

# Функция для нарезки видео на части по 150 МБ
def split_video(fname, video_path, max_size_mb=150):
    video_size_mb = get_file_size_mb(video_path)
    if video_size_mb <= max_size_mb:
        return [video_path]  # Если видео меньше 150 МБ, не нарезаем
    
    # Определяем количество частей
    num_parts = math.ceil(video_size_mb / max_size_mb)
    
    # Получаем общую длительность видео
    result = subprocess.run(
        ['ffprobe', '-v', 'error', '-show_entries', 'format=duration', '-of', 'default=noprint_wrappers=1:nokey=1', video_path],
        capture_output=True, text=True
    )
    total_duration = float(result.stdout.strip())
    
    # Продолжительность каждой части
    part_duration = total_duration / num_parts
    
    # Нарезаем видео на части
    output_videos = []
    for i in range(num_parts):
        start_time = part_duration * i
        output_path = f"{fname}_part{i+1}.mp4" #ЗАДАЙ ПУТЬ КУДА ЧАНКИ ВИДЕО КЛАДУТСЯ
        # Проверка на существование файла и перезапись
        if os.path.exists(output_path):
            os.remove(output_path)  # Удаляем существующий файл перед записью
        subprocess.run(
            ['ffmpeg', '-i', video_path, '-ss', str(start_time), '-t', str(part_duration), '-c', 'copy', output_path]
        )
        output_videos.append(output_path)
    
    return output_videos

# Функция для объединения JSON-результатов
def merge_jsons(json_list):
    combined_results = []
    for json_str in json_list:
        combined_results.extend(json.loads(json_str))
    return json.dumps(combined_results, ensure_ascii=False, indent=4)



def get_json_from_video(fname, script_path, video_path, prompt, config_path, checkpoint_path):
    # Проверяем размер видео и при необходимости нарезаем его на части
    video_parts = split_video(fname, video_path)
    
    json_results = []
    
    # Выполняем команду для каждой части видео
    for part in video_parts:
        command = [
            'python', script_path, part, prompt, 
            '--config', config_path, '--checkpoint', checkpoint_path
        ]
        
        try:
            result = subprocess.run(command, capture_output=True, text=True, check=True)
            json_results.append(parse_output_and_create_json(result.stdout))  # Собираем JSON результаты
        except subprocess.CalledProcessError as e:
            print(f"Error occurred: {e.stderr}")
                
    # Объединяем все JSON в один
    combined_json = merge_jsons(json_results)
    return combined_json

# ТАКИЕ ПУТИ ЕСЛИ РАБОТАЕШЬ ИЗ R2-Tuning
script_path = 'tools/inference.py'
prompt = 'intsresting moment of video'
config_path = 'configs/qvhighlights/r2_tuning_qvhighlights.py'
checkpoint_path = '/kaggle/input/rutub-highlights/r2_tuning_qvhighlights-ed516355.pth' # путь до модели тоже пометь

video_path = f'/kaggle/input/rutub-highlights/{fname}' #путь до видоса
output = get_json_from_video(fname, script_path, video_path, prompt, config_path, checkpoint_path)