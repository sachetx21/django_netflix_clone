FROM python:3

WORKDIR /data

COPY . .

#RUN pip install django==3.7.2

RUN pip install -r requirements.txt

RUN python3 manage.py migrate

RUN python3 manage.py makemigrations

EXPOSE 8000

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
