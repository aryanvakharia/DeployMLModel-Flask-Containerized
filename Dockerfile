
#EACH COMMAND -> ONE LAYER OF DOCKER IMAGE

#Base image from which container is setup and provide environment for application
#Size of image depends on size of app/program
FROM python:3.8-slim-bullseye

#Setting working directory in the container, where all application files will be store
WORKDIR /app

#Copying local files to working directory path
COPY . /app

#Copying requirements file to working directory path
COPY requirements.txt .

#Installing required packages when container is built
RUN pip install -r requirements.txt

#Container terminal command to run training script
#CMD ["python", "model.py"]

#Assigning and exposing port to web-app with localhost
EXPOSE 5000
#Running flask application from container terminal
#CMD ["flask", "run", "--host", "0.0.0.0"]
ENTRYPOINT ["/bin/sh", "-c", "python model.py && flask run --host 0.0.0.0"]

