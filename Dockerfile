FROM python:3

WORKDIR /app

COPY . /app

USER root

RUN pip install -r requirements.txt

CMD python3 app.py
