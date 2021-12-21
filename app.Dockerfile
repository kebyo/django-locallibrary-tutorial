FROM python:3.8.3-slim

WORKDIR /usr/src/app


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip3 install --upgrade pip

COPY . .

RUN pip3 install -r requirements.txt

RUN python3 manage.py migrate

CMD gunicorn locallibrary.wsgi:application --bind 0.0.0.0:8000
