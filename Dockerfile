FROM python:3.8-slim-bullseye

WORKDIR /app

COPY . /app

COPY requirements.txt .
RUN pip install -r requirements.txt

CMD ["python", "model.py"]

EXPOSE 5000
CMD ["python", "app.py"]