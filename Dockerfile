# Stage 1: Build environment
FROM python:3.10.12 AS builder

WORKDIR /app

COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime environment
FROM python:3.10.12-slim

WORKDIR /app

# Copy built dependencies from the previous stage
COPY --from=builder /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

# Copy the rest of the application code
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "makemigrations"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
