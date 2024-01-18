# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run the Streamlit app
CMD ["streamlit", "run", "app.py"]

#  docker build -t test_image .
#  docker run -p 8501:8501 sametyaprak/test_image


