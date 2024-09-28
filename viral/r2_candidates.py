import subprocess
import re
import json
import os
import math


def seconds_to_timecode(seconds):
    """
    Преобразует количество секунд в строку формата 'MM:SS'.
    
    Args:
        seconds (float): Время в секундах, которое нужно преобразовать.
    
    Returns:
        str: Строка с временем в формате 'MM:SS'.
    """
    minutes = int(seconds // 60)
    secs = int(seconds % 60)
    return f"{minutes:02}:{secs:02}"

def parse_output_and_create_json(output):
    """
    Парсит вывод строки, содержащей временные интервалы и оценки, 
    и преобразует эти данные в JSON-формат.

    Ожидается, что каждая строка в выводе имеет следующий формат:
    'start_time_sec end_time_sec score', где start_time_sec и end_time_sec — это время в секундах,
    а score — оценка (в данном случае, игнорируется).

    Args:
        output (str): Строка вывода, содержащая временные интервалы и оценки.
    
    Returns:
        str: Строка в формате JSON, содержащая временные интервалы и причину "R2".
    """
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
        combined_results.extend(json.loads(json_str))
    return json.dumps(combined_results, ensure_ascii=False, indent=4)


def get_json_from_video(fname, script_path, video_path, prompt, config_path, checkpoint_path):
    """
    Обрабатывает видео, разбивает его на части при необходимости, запускает скрипт для каждой части, 
    и собирает результаты в формате JSON.

    Аргументы:
    fname (str): Имя файла видео.
    script_path (str): Путь к скрипту для анализа видео.
    video_path (str): Путь до видеофайла.
    prompt (str): Текстовый запрос для анализа видео.
    config_path (str): Путь к конфигурационному файлу для модели.
    checkpoint_path (str): Путь к файлу с весами модели.

    Возвращает:
    str: JSON строка с объединенными результатами обработки видео.

    Ожидаемый формат выходного JSON:
    0a1bd95990029433d45dd0a7b15d9b50.mp4 [
    {
        "time_start": "16:34",
        "time_end": "16:39",
        "reason": "Audio Highlights"
    },
    {
        "time_start": "30:12",
        "time_end": "30:17",
        "reason": "Audio Highlights"
    },
    {
        "time_start": "42:16",
        "time_end": "42:21",
        "reason": "Audio Highlights"
    },
    {
        "time_start": "59:26",
        "time_end": "59:31",
        "reason": "Audio Highlights"
    },
    {
        "time_start": "62:43",
        "time_end": "62:48",
        "reason": "Audio Highlights"
    }
    ]
    """
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


def main(fname):
    script_path = './R2-Tuning/tools/inference.py'
    prompt = 'viral moment of video'
    config_path = './R2-Tuning/configs/qvhighlights/r2_tuning_qvhighlights.py'
    checkpoint_path = './weights/r2_tuning_qvhighlights-ed516355.pth' # путь до модели тоже пометь

    video_path = f'{fname}' #путь до видоса
    output = get_json_from_video(fname, script_path, video_path, prompt, config_path, checkpoint_path)
    
    return output

if __name__ == "__main__":
    fname = 'example_video.mp4'  # Имя файла видео, которое нужно обработать
    result = main(fname)
    print(result)
