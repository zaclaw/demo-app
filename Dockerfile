# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port (default Flask port, can be overridden)
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=main.py

# Run the app
CMD ["sh", "-c", "flask run --host=0.0.0.0 --port $PORT"]
