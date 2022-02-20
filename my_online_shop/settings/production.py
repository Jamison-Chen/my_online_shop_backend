import dj_database_url
from ._base import *

SECRET_KEY = "django-insecure-gt12bxf3@hrr+!0j71*r=_s56^dg67^6#_nby=$p4#=12tz6&n"

DATABASES = {
    "default": dj_database_url.config(),
}
STATIC_ROOT = "staticfiles"
SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")
ALLOWED_HOSTS = ["*"]
DEBUG = False

DEFAULT_FROM_EMAIL = ""
EMAIL_HOST = "smtp.gmail.com"
EMAIL_HOST_USER = ""
EMAIL_HOST_PASSWORD = ""
EMAIL_USE_TLS = True
EMAIL_PORT = 587
