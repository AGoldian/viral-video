# from transformers import AutoTokenizer, AutoModelForCausalLM, AutoProcessor

# candidates
# from viral.r2_candidates import get_json_from_video_r2
from viral.splash_audio_candidates import get_json_of_audio_moments
# from viral.llama_text_candidates import text_to_timestamps

# processing
from viral.utils import split_video
from viral.video_agg import transcribe_video, create_subtitles

from settings import config

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

for idx, part in enumerate(video_parts):
    print(f"Видео разбито на {len(video_parts)} частей")

    print("Транскрибируем видео...")
    segments = transcribe_video(video_path, whisper_model=config.WHISPER_MODEL)

    print("Получаем кандидаты из разных моделей")
    # json_candidates_from_r2 = get_json_from_video_r2(part, 
    #                                                  config.R2_SCRIPT_PATH,
    #                                                  config.R2_PROMPT,
    #                                                  config.R2_CONFIG_PATH,
    #                                                  config.R2_CHECPOINT_PATH) # default 5 candidates
    print("Кандидаты из R2-Tuning получены")
    json_candidates_audio = get_json_of_audio_moments(part,
                                                     config.AUDIO_WINDOW_SIZE_IN_SECS, 
                                                     config.AUDIO_NUM_CANDIDATES, 
                                                     config.AUDIO_OUTPUT_PATH)
    print("Кандидаты из аудио получены")
    # json_candidates_llama = text_to_timestamps(segments, model=llama_model, processor=llama_processor)
    # print("Кандидаты из LLM получены")
    # select best candidates

    print("Накладываем субтитры...")
    output_path = f'{base_path}_out_{idx}.MP4'
    create_subtitles(video_path, segments, f"{output_path}")
    print(f"Видео сохранено с субтитрами: {output_path}")
