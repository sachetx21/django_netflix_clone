python3 -m pip install Django=3.7.2

pip install -r requirements.txt

python3 manage.py makemigrations

python3 manage.py migrate

python3 manage.py createsuperuser

python3 manage.py runserver 0.0.0.0:8000

add Allowed Host in settings.py

full tutorial =  https://www.youtube.com/watch?v=gbyYXgiSgdM

open http://localhost:8000/admin [login with superuser you created]
add a movie to avoid error
