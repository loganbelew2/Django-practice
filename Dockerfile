FROM python:3.12.2

ENV PYTHONUNBUFFERED 1
ENV PATH="/scripts:${PATH}"

WORKDIR /code
COPY . /code/

RUN pip install -r requirements.txt
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser --disabled-password user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD [ "entrypoint.sh" ]