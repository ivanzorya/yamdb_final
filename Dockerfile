FROM python:3.8.5

RUN mkdir /code
WORKDIR /code
COPY . /code
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --no-input

CMD python manage.py migrate && gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000