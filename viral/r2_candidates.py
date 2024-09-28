import subprocess
import re
import json

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


def get_json_from_video_r2(fname, script_path, prompt, config_path, checkpoint_path):
    """
    Обрабатывает видео, разбивает его на части при необходимости, запускает скрипт для каждой части, 
    и собирает результаты в формате JSON.

    Аргументы:
    fname (str): Имя файла видео.
    script_path (str): Путь к скрипту для анализа видео.
    prompt (str): Текстовый запрос для анализа видео.
    config_path (str): Путь к конфигурационному файлу для модели.
    checkpoint_path (str): Путь к файлу с весами модели.

    Возвращает:
    str: JSON строка с объединенными результатами обработки видео.

    Ожидаемый формат выходного JSON:
    [
    {
        "time_start": "16:34",
        "time_end": "16:39",
        "reason": "R2 Highlights"
    },
    {
        "time_start": "30:12",
        "time_end": "30:17",
        "reason": "R2 Highlights"
    },
    {
        "time_start": "42:16",
        "time_end": "42:21",
        "reason": "R2 Highlights"
    },
    {
        "time_start": "59:26",
        "time_end": "59:31",
        "reason": "R2 Highlights"
    },
    {
        "time_start": "62:43",
        "time_end": "62:48",
        "reason": "R2 Highlights"
    }
    ]
    """
    # Проверяем размер видео и при необходимости нарезаем его на части
    
    json_results = []
    
    # Выполняем команду для каждой части видео
    command = [
        'python', script_path, fname, prompt, 
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
    output = get_json_from_video_r2(fname, script_path, video_path, prompt, config_path, checkpoint_path)
    
    return output

if __name__ == "__main__":
    fname = 'example_video.mp4'  # Имя файла видео, которое нужно обработать
    result = main(fname)
    print(result)
