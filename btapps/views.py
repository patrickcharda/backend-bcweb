from django.shortcuts import render
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from btapps.serializers import CustomTokenObtainPairSerializer, CustomTokenRefreshSerializer
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import generics, status
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from rest_framework.authentication import TokenAuthentication
from rest_framework_simplejwt.exceptions import AuthenticationFailed
from bcweb.models import PrintDebug
from btapps.models import Session
from django.contrib.auth.hashers import check_password
from accounts.models import CustomUser
from django.http import HttpResponse



class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs["content_type"] = "application/json"
        super(JSONResponse, self).__init__(content, **kwargs)


class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer
    
class CustomTokenRefreshView(TokenRefreshView):
    serializer_class = CustomTokenRefreshSerializer
    

@permission_classes((permissions.IsAuthenticated,))
@api_view(["GET"])
def applogout(request):
    name = "applogout"
    application= request.headers.get('appliname')

    #print(application)
    #print(fingerprint)
    # Get the token
    try:
        auth_header = request.META['HTTP_AUTHORIZATION']
        # The auth_header usually comes in the format 'Bearer <token>'
        auth_type, token = auth_header.split()
        if auth_type.lower() != 'bearer':
            raise ValueError('Invalid token header. No credentials provided.')
    except KeyError:
        raise ValueError('Authorization header is missing.')
    except ValueError:
        raise ValueError('Token string should not contain spaces.')
    
    # print(token)

    # get the username to log
    session_user = Session.objects.get(token=token)
    trace = PrintDebug(message="utilisateur "+session_user.utilisateur+" / passage ds la fonction applogout ("+name+")")
    trace.save()
    # delete session
    session_to_delete = Session.objects.filter(application=application, token=token)
    if session_to_delete.count() > 0:
        session_to_delete.delete()
    result = {"logout":"success"}
    return JSONResponse(result)

@api_view(["GET"])
def userapplogout(request):
    name = "userapplogout"
    application= request.headers.get('appliname')
    username= request.headers.get('username')
    #print(username)
    #print(application)
    # get the username to log
        
    trace = PrintDebug(message="passage ds la fonction userapplogout ("+username+")")
    trace.save()
    # delete session
    try:
        session_to_delete = Session.objects.filter(application=application, utilisateur=username)
        print(session_to_delete.count())
        if session_to_delete.count() > 0:
            session_to_delete.delete()
            result = {"logout":"success"}
            print(Session.objects.filter(application=application, utilisateur=username).count())
        else:
            raise AuthenticationFailed("Session introuvable")  
    except:
        raise AuthenticationFailed("Session introuvable") 
    return JSONResponse(result)

@api_view(["POST"])
def preapplogin(request):

    data = JSONParser().parse(request)
    username = data['username']
    clear_password = data['password']
    try:
        user = CustomUser.objects.get(username=username)
    except:
        result = {"login":"failed"}
        #print(result)
        return JSONResponse(result)
    if user and check_password(clear_password, user.password):
        #print(user.username)
        result = {"login":"success"}
        application= request.headers.get('appliname')
        try:
            session = Session.objects.get(application=application, utilisateur=user.username)
            if session:
                result = {"login":"success", "opened_session":"yes", "username":username, "password":clear_password}
                return JSONResponse(result)
        except Session.DoesNotExist:
            result = {"login":"success", "opened_session":"no", "username":username, "password":clear_password}
            return JSONResponse(result)
    else:
        result = {"login":"failed"}
        
        return JSONResponse(result)

    

