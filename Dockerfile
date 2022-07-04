#Base image from which container is setup and provide environment for application
FROM python:3.8-slim-bullseye

#Setting working directory in the container, where all application files will be store
WORKDIR /app

#Copying local files to working directory path
COPY . /app

#Copying requirements file to working directory path
COPY requirements.txt .

#Installing required packages when container is run
RUN pip install -r requirements.txt

#Container terminal command to run training script
CMD ["python", "model.py"]

#Assigning port to web-app with localhost
EXPOSE 5000
#Running flask application
CMD ["flask", "run", "--host", "0.0.0.0"]