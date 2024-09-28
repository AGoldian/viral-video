import requests

url = 'http://127.0.0.1:8000/load_file'
file = {'file': open('test_video.MP4', 'rb')}
resp = requests.post(url=url, files=file)
print(resp.json())
