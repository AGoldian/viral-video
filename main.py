
from viral.r2_candidates import get_json_from_video_r2
from viral.splash_audio_candidates import get_json_of_audio_moments

from viral.llama_text_candidates import get_json_of_text_moments

from viral.utils import split_video

from settings import config

video_path = '/Users/s.vandanov/Desktop/viral-video/rest/pythonProject3/test_video.MP4'
fname = 'test_video.MP4'

# Нарезаем видео на части
video_parts = split_video(video_path, video_path)
# Возвращает пути

for part in video_parts:
    json_candidates_from_r2 = get_json_from_video_r2(part, 
                                                     config.R2_SCRIPT_PATH,
                                                     config.R2_PROMPT,
                                                     config.R2_CONFIG_PATH,
                                                     config.R2_CHECPOINT_PATH) # default 5 candidates
    
    json_candidates_audio = get_json_of_audio_moments(part,
                                                    config.AUDIO_WINDOW_SIZE_IN_SECS, 
                                                    config.AUDIO_NUM_CANDIDATES, 
                                                    config.AUDIO_OUTPUT_PATH)
    
    json_candidates_llama = get_json_of_audio_moments()