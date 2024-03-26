# Use the official Python image with specified version
FROM python:3.12.2

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app/
COPY ./entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]
