# Use a lightweight, official Python runtime
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application file into the container
COPY app.py .

# Expose port 8000 for web traffic
EXPOSE 8000

# Command to run the application
CMD ["python", "app.py"]
