from moviepy.editor import VideoFileClip, CompositeVideoClip, TextClip
from moviepy.video.tools.subtitles import SubtitlesClip
import whisper
import os

# Путь к файлу шрифта
font_path = "Obelix Pro.ttf"


def transcribe_video(video_path, whisper_model="base"):
    # Загружаем модель Whisper
    model = whisper.load_model(whisper_model)

    # Загружаем видеофайл
    clip = VideoFileClip(video_path)

    # Извлекаем аудио из видео
    audio_path = "temp_audio.wav"
    clip.audio.write_audiofile(audio_path, codec='pcm_s16le')

    # Транскрибируем аудио
    result = model.transcribe(audio_path)
    os.remove(audio_path)  # Удаляем временный аудиофайл

    return result['segments']


# Разбивает текст на фрагменты, проверяя ширину текста
def split_text_to_chunks(text, clip):
    words = text.split()
    chunks = []
    current_chunk = []
    max_width = clip.w - 20  # Оставим 10 пикселей с каждой стороны для отступа

    for word in words:
        current_chunk.append(word)
        # Создаем временный TextClip, чтобы проверить ширину
        temp_clip = TextClip(' '.join(current_chunk), font=font_path, fontsize=40, color="red")
        if temp_clip.w > max_width:
            # Если ширина превышает максимальную, убираем последнее слово и добавляем в chunks
            current_chunk.pop()  # Убираем последнее слово
            if current_chunk:  # Если есть слова для добавления
                chunks.append(' '.join(current_chunk))
            current_chunk = [word]  # Начинаем новый chunk с текущим словом

    # Добавляем последний chunk, если он не пуст
    if current_chunk:
        chunks.append(' '.join(current_chunk))

    return chunks


# Генерация субтитров
def create_subtitles(video_path, segments, output_path):
    # Загружаем видео
    clip = VideoFileClip(video_path)

    subtitle_data = []

    for segment in segments:
        # Разбиваем текст на фрагменты
        chunks = split_text_to_chunks(segment['text'].strip(), clip)

        # Определяем длительность каждого фрагмента
        chunk_duration = (segment['end'] - segment['start']) / len(chunks)

        # Создаем данные для SubtitlesClip
        for i, chunk in enumerate(chunks):
            chunk_start = segment['start'] + i * chunk_duration
            chunk_end = chunk_start + chunk_duration
            # Добавляем только (начало, конец, текст)
            subtitle_data.append(((chunk_start, chunk_end), chunk))  # Изменено на кортеж из двух элементов

    # Создаем SubtitlesClip
    subtitles = SubtitlesClip(subtitle_data, make_textclip=lambda txt: TextClip(txt, font=font_path, fontsize=40, color="yellow",
                                                                             stroke_color="black", stroke_width=4))

    # Накладываем субтитры на видео, поднимаем их чуть выше
    video_with_subtitles = CompositeVideoClip([clip, subtitles.set_pos(('center', clip.h * 0.82))])

    # Сохраняем результат
    video_with_subtitles.write_videofile(output_path, codec="libx264", fps=clip.fps)


def process_video(video_path, output_path, whisper_model="base"):
    print("Транскрибируем видео...")
    segments = transcribe_video(video_path, whisper_model=whisper_model)

    print("Накладываем субтитры...")
    create_subtitles(video_path, segments, output_path)

    print(f"Видео сохранено с субтитрами: {output_path}")
