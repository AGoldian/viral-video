import uvicorn
import aiofiles
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import logging
import uuid
import time

from starlette.responses import FileResponse

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

    file_name = json['path']

    time.sleep(10)
    # TODO: goldian прикрутить модель

    return JSONResponse(content={
        'videoName': file_name,
        'clips': [
            {
                'from': '00:40',
                'to': '00:50',
                'reasons': ['Очень крутой момент'],
                'fileLink': 'test_video.MP4',
            }
        ]
    })


@app.get('/files/{path}')
async def load_file(path: str):
    return FileResponse(path)


@app.post("/load_file")
async def analyze_image(request: Request):
    form_data = await request.body()

    out_file_path = f'{uuid.uuid4()}.MP4'

    async with aiofiles.open(out_file_path, 'wb') as out_file:
        await out_file.write(form_data)  # async write

    return JSONResponse(
        content={
            'filePath': out_file_path
        }
    )


@app.options("/load_file")
async def analyze_image_options():
    return JSONResponse(content={})


@app.options("/process_file")
async def analyze_image_options():
    return JSONResponse(content={})


@app.options('/files/{path}')
async def analyze_image_options():
    return JSONResponse(content={})


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
