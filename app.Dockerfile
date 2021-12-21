FROM python:3.8.3-slim

WORKDIR /usr/src/app


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

CMD gunicorn locallibrary.wsgi:application --bind 0.0.0.0:8000
