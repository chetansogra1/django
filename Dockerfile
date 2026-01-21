FROM python:3.8

ENV PYTHONUNBUFFERED 1

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app/

RUN python -m pip install --upgrade pip && pip install -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_lab.wsgi:application"]

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
