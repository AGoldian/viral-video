import uvicorn
import aiofiles
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import logging
import uuid

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


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
