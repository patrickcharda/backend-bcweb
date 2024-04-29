from restful01.settings import *

DEBUG = False
SECRET_KEY='FlLmRZe6JDS4rA0a1tSd2rf9AO9yop9cra6TuAmEfKMjoQePzG50FilmEco'
ALLOWED_HOSTS = ['demo-btw.monkey-soft.fr','www.demo-btw.monkey-soft.fr','localhost','127.0.0.1','185.31.40.22']
""" DATABASES = {
    'default': {
	'ENGINE': 'django.db.backends.postgresql',
	'NAME': 'charda_pgweb', 
	'USER': 'charda', 
	'PASSWORD': 'Wla7x6cla!',
	'HOST': 'localhost',
	'PORT': 5432,
    }
} """
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
STATIC_ROOT = '/var/cache/back-lpb/static/'
STATIC_URL = '/static/'
MEDIA_ROOT = '/var/opt/back-lpb/media/'
MEDIA_URL = '/media/'
# MAILS
SERVER_EMAIL = 'noreply@back-lpb.monkey-soft.fr'
DEFAULT_FROM_EMAIL = 'noreply@back-lpb.monkey-soft.fr'
ADMINS = [
    ('pacos', 'p.chardavoine@monkey-soft.fr'),
]
MANAGERS = ADMINS

#EMAIL_HOST = 'btweb-demo.monkey-soft.fr'
#EMAIL_HOST_USER = 'noreply@monkey-soft.fr'
#EMAIL_HOST_PASSWORD = 'Ron-xxxx9...'
#EMAIL_PORT = 465
#EMAIL_USE_SSL = True

EMAIL_BACKEND = 'django_sendmail_backend.backends.EmailBackend'

# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'fr-FR'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

#LOGIN_REDIRECT_URL = "/foxweb"
#LOGOUT_REDIRECT_URL = "/accounts/login"

