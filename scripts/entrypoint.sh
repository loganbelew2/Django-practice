#!/bin/sh

set -e

python manage.py collectstatic --noinput

gunicorn --socket :8000 --master --enable-threads --module mysite.wsgi