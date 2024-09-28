from moviepy.editor import VideoFileClip, CompositeVideoClip, TextClip
from moviepy.video.tools.subtitles import SubtitlesClip
from moviepy.video.compositing.concatenate import concatenate_videoclips
from datetime import timedelta
import whisper
import os
import srt
import ffmpeg
from pydub import AudioSegment

def aggregate_timestamp(timestamps, video_path, output_path):
    # Function to convert timestamp (MM:SS) to seconds
    def time_to_seconds(time_str):
        minutes, seconds = map(int, time_str.split(':'))
        return minutes * 60 + seconds

    # Create a list to hold the video clips
    clips = []

    # Load the video
    video = VideoFileClip(video_path)

    # Extract the clips based on the timestamps
    for ts in timestamps:
        start_time = time_to_seconds(ts['time_start'])
        end_time = time_to_seconds(ts['time_end'])

        # Extract the subclip
        clip = video.subclip(start_time, end_time)
        clips.append(clip)

    # Concatenate the clips and save the result
    final_video = concatenate_videoclips(clips)
    final_video.write_videofile(output_path, codec="libx264")

# Путь к файлу шрифта
font_path = "Obelix Pro.ttf"


def video_to_text(video_name, model_name):
    print("Whisper is started")
    model = whisper.load_model(model_name)
    audio_file_language = 'russian'
    no_speech_threshold = 0.2


    def convert_mp4_to_mp3(input_file, output_file):
        print(f"output_file = {output_file}")
        print(f"input_file = {input_file}")
        # Extract audio stream (AAC) from video file
        audio_stream = ffmpeg.input(input_file).audio
        
        aac_file = 'temp_audio.aac'
        if os.path.isfile(aac_file):
            os.remove(aac_file)
       
        ffmpeg.output(audio_stream, aac_file).run()
        # Convert AAC to MP3 using pydub
        audio = AudioSegment.from_file(aac_file, format='aac')
        audio.export(output_file, format='mp3')

    convert_mp4_to_mp3(video_name, "tmp.mp3")

    result = model.transcribe(
        "tmp.mp3",
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

    with open(f"audio_{video_name}.txt", 'w', encoding='utf-8') as f:
        f.write(composed_transcription)

    file_path = f"audio_{video_name}.txt"

    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File {file_path} not found.")

    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()
    print(lines)
    return lines

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
                                                                             stroke_color="black", stroke_width=2))

    # Накладываем субтитры на видео, поднимаем их чуть выше
    video_with_subtitles = CompositeVideoClip([clip, subtitles.set_pos(('center', clip.h * 0.82))])

    # Сохраняем результат
    video_with_subtitles.write_videofile(output_path, codec="libx264", fps=clip.fps)

def create_subtitles2(video_path, segments, output_path):
    # Загружаем видео
    clip = VideoFileClip(video_path)

    subtitle_clips = []
    
    for segment in segments:
        # Разбиваем текст на фрагменты
        chunks = split_text_to_chunks(segment['text'].strip(), clip)
        
        # Определяем длительность каждого фрагмента
        chunk_duration = (segment['end'] - segment['start']) / len(chunks)
        
        # Создаем отдельный TextClip для каждого фрагмента
        for i, chunk in enumerate(chunks):
            chunk_start = segment['start'] + i * chunk_duration
            
            # Создаем TextClip с нужной стилизацией
            text_clip = TextClip(chunk, font=font_path, fontsize=40, color="yellow",
                                 stroke_color="black", stroke_width=4, size=(clip.w, None))
            text_clip = text_clip.set_duration(chunk_duration).set_start(chunk_start)
            subtitle_clips.append(text_clip)

    # Накладываем субтитры на видео, поднимаем их чуть выше
    video_with_subtitles = CompositeVideoClip([clip] + [sub.set_pos(('center', clip.h * 0.8)) for sub in subtitle_clips])
    
    # Сохраняем результат
    video_with_subtitles.write_videofile(output_path, codec="libx264", fps=clip.fps)


def process_video(timestamps, video_path, output_path, whisper_model="base"):
    print('Объединяем отрезки')
    aggregate_timestamp(timestamps, video_path, output_path)

    print("Транскрибируем видео...")
    segments = transcribe_video(video_path, whisper_model=whisper_model)

    print("Накладываем субтитры...")
    create_subtitles2(video_path, segments, output_path)

    print(f"Видео сохранено с субтитрами: {output_path}")
