# Use the official Python image as the base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . /app/

# Install pipenv (used to generate requirements.txt)
RUN pip install pipenv

# Install dependencies directly using pipenv
RUN pipenv install

# Command to run the application
CMD ["pipenv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "src.wsgi:application"]

# Expose the port the app runs on
EXPOSE 8000