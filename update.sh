#! /bin/bash
git add .
git commit -m "update"
git push origin master
heroku run python manage.py migrate -a online-shop-prototype