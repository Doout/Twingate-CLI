FROM python:3.11-slim

# Install any system dependencies needed
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    && apt-get clean

WORKDIR /app

COPY requirements.txt /app/requirements.txt

# Set environment variable for pip to use piwheels when installing on armv7
RUN if [ "$(uname -m)" = "armv7l" ]; then \
    pip install --no-cache-dir --index-url=https://www.piwheels.org/simple -r requirements.txt; \
    else \
    pip install --no-cache-dir -r requirements.txt; \
    fi

# Copy the application code
COPY . /app

# Default command
CMD ["python", "tgcli.py"]
