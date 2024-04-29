from btapps import views
from django.urls import path, include, re_path
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from rest_framework import urls
from rest_framework_simplejwt import views as jwt_views


urlpatterns = [
    re_path(
        r"^preapplogin/$",
        views.preapplogin,
        name="preapplogin",
    ),
    re_path(
        r"^applogin/$",
        views.CustomTokenObtainPairView.as_view(),
        name="custom_token_obtain_pair",
    ),
    re_path(
        r"^apprefresh/$",
        views.CustomTokenRefreshView.as_view(),
        name="custom_token_refresh",
    ),
    re_path(
        r"^applogout/$",
        views.applogout,
        name="applogout",
    ),
    re_path(
        r"^userapplogout/$",
        views.userapplogout,
        name="userapplogout",
    ),
]

