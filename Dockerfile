# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Clone the R2-Tuning repo and install its dependencies
RUN git clone https://github.com/yeliudev/R2-Tuning.git && \
    pip install -r R2-Tuning/requirements.txt

# Install nncore and specific setuptools version
RUN pip install nncore==0.4.4 setuptools==69.5.1

# Expose port for FastAPI
EXPOSE 8000

# Run the FastAPI app using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
