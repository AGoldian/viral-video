import os
import math
import subprocess

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