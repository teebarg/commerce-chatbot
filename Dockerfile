# Use the official Rasa Open Source image
FROM rasa/rasa:latest

# Copy your Rasa project files
COPY . /app

# Set the working directory
WORKDIR /app

# Expose Rasa server port
EXPOSE 5005
