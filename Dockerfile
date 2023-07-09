FROM python:3.11-alpine

ENV PYTHONUNBUFFERED=1

COPY requirements.txt /tmp/requirements.txt

RUN apk add --virtual .build-deps \
        build-base \
        geos-dev \
        proj-dev \
        gfortran \
        openblas-dev \
    && apk add \
        geos \
        proj \
        proj-util \
        openblas \
    && pip install -r /tmp/requirements.txt \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/cache/apk/*

RUN rm -f /tmp/requirements.txt
