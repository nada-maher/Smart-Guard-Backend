FROM python:3.12-slim

WORKDIR /app

# Install system dependencies required for CV + TF
RUN apt-get update && apt-get install -y \
    python3-dev build-essential \
    libgl1-mesa-glx libglib2.0-0 \
    libsm6 libxrender1 libxext6 \
    && apt-get clean

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=8000

CMD ["uvicorn", "start_backend:app", "--host", "0.0.0.0", "--port", "8000"]
