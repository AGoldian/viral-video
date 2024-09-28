import os
import math
import subprocess
import json
import json

def merge_jsons(json_list):
    """
    Объединяет список JSON строк в один JSON объект.
    
    Аргументы:
    json_list (list): Список строк, содержащих JSON объекты.
    
    Возвращает:
    str: Объединенный JSON объект в виде строки.
    """
    combined_results = []
    
    for json_str in json_list:
        if json_str is not None:
            json_data = json.loads(json_str)
            
            if isinstance(json_data, list):  # If the JSON is a list, extend the combined list
                combined_results.extend(json_data)
            else:  # If the JSON is not a list, append it as an element in the combined list
                combined_results.append(json_data)

    return json.dumps(combined_results, ensure_ascii=False, indent=4)



# Функция для получения размера файла в мегабайтах
def get_file_size_mb(file_path):
    file_size = os.path.getsize(file_path)
    return file_size / (1024 * 1024)  # перевод в МБ


# Функция для нарезки видео на части по 150 МБ
def split_video(fname, video_path, max_size_mb=10):
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