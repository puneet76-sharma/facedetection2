FROM ubuntu:18.04

FROM python:3.6.9

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirement.txt /app/requirement.txt

WORKDIR /app

RUN pip3 install -r requirement.txt

COPY . /app

CMD python /app/model.py && python /app/server.py
