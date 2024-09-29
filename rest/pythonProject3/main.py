import os

import uvicorn
import aiofiles
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import logging
import uuid
import asyncio

from starlette.responses import FileResponse
import json

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post('/process_file')
async def process_file(request: Request):
    json = await request.json()

    path = json['path']

    await asyncio.sleep(60)
    # TODO: goldian прикрутить модель на распознавание

    return JSONResponse(content={
        'videoName': path,
        'clips': _load_clips_from_dir(path)
    })


@app.get('/poll_directory/{directory}')
async def poll_directory(directory: str):
    return JSONResponse(content={
        'videoName': directory,
        'clips': _load_clips_from_dir(directory)
    })


def _load_clips_from_dir(path):
    directory = os.fsencode(path)

    clips = []

    for file in os.listdir(directory):
        filename = os.fsdecode(file)
        if filename.lower().endswith(".mp4") and filename.lower() != 'initial.mp4':
            with open(f'{path}/{filename.lower().replace('.mp4', '.json')}', encoding='UTF-8') as user_file:
                file_contents = user_file.read()
                parsed_json = json.loads(file_contents)
                # TODO: goldian прикрутить хранилище инфы о видосах
                clips.append({
                    'from': parsed_json['from'],
                    'to': parsed_json['to'],
                    'reason': parsed_json['reason'],
                    'fileLink': f'{path}/{filename}'
                })
    return clips


@app.get('/files/{path}/{file}')
async def load_file(path: str, file: str):
    return FileResponse(f'{path}/{file}')


@app.post("/load_file")
async def save_image_local(request: Request):
    form_data = await request.body()

    out_file_folder = f'{uuid.uuid4()}'
    if not os.path.exists(out_file_folder):
        os.makedirs(out_file_folder)

    async with aiofiles.open(f'{out_file_folder}/initial.MP4', 'wb') as out_file:
        await out_file.write(form_data)  # async write

    return JSONResponse(
        content={
            'filePath': out_file_folder
        }
    )


@app.options("/load_file")
async def analyze_image_options():
    return JSONResponse(content={})


@app.options("/process_file")
async def analyze_image_options():
    return JSONResponse(content={})


@app.options('/files/{path}/{file}')
async def analyze_image_options():
    return JSONResponse(content={})


@app.options('/poll_directory/{directory}')
async def analyze_image_options():
    return JSONResponse(content={})


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
