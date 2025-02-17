# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 5000

# Create a directory for persistent data
RUN mkdir /app/data  && chmod -R 777 /app/data


# Define environment variable
ENV NAME World

# Run app.py when the container launches
#CMD ["python3", "run.py"]
CMD ["flask", "run", "--host=0.0.0.0"]
