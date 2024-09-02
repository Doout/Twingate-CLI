FROM python:3-slim

RUN apt-get update && \
    apt-get install -y jq curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
# Copy the rest of the application's code into the container (optional, depends on your needs)
# COPY . .

# Command to run your application (optional, depends on your needs)
# CMD ["python", "./your-script.py"]
