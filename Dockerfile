FROM python:3.6.15-alpine3.13

RUN pip install flake8 \
  autopep8 \
  Flask
