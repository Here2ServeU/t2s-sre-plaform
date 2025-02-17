# Dockerfile - Backend Containerization
FROM python:3.9-slim
WORKDIR /app

# Copy dependencies
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY backend/ .

# Expose the application port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
