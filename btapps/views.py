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
from bcweb.models import PrintDebug, Command
from btapps.models import Session
from btapps.models import Reset
from django.contrib.auth.hashers import check_password
from accounts.models import CustomUser
from django.http import HttpResponse
from django.db import transaction


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

@permission_classes((permissions.IsAuthenticated,))
@api_view(["GET"])
def userapplogout(request):
    name = "userapplogout"
    application= request.headers.get('appliname')
    username= request.headers.get('username')
    token= request.headers.get('token')
    """ auth_header = request.META['HTTP_AUTHORIZATION']
    # The auth_header usually comes in the format 'Bearer <token>'
    auth_type, token = auth_header.split()
    if auth_type.lower() != 'bearer':
        raise ValueError('Invalid token header. No credentials provided.') """
    print(username)
    print(application)
    print(token)
    # get the username to log
        
    trace = PrintDebug(message="passage ds la fonction userapplogout ("+username+")")
    trace.save()
    # delete session
    try:
        session_to_delete = Session.objects.filter(application=application, utilisateur=username, token=token)
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
        print("preapplogin", user.username)
    except:
        result = {"login":"failed"}
        print("preapplogin", result)
        return JSONResponse(result)
    if user and check_password(clear_password, user.password):
        print(user.username)
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

""" @api_view(["POST"])
def cmdreset(request):
    data = JSONParser().parse(request)
    searched_key = data['reset_key']
    try:
        reset_key = Reset.objects.get(reset_key=searched_key)
    except:
        result = {"message":"code reset invalide"}
        print(result)
        return JSONResponse(result)
    if (reset_key and not reset_key.used) or (reset_key.reset_key == "#***#"):
        # rechercher s'il existe déjà un enregistrement Command avec le iduser "system"
        try:
            cmde_reset = Command.objects.get(iduser="system")
            cmde_reset.command="reset"
            cmde_reset.save()
            result = {"message":"commande reset envoyée"}
            return JSONResponse(result)
        except Command.DoesNotExist as e:
            new_cmde_reset = Command(command="reset")
            new_cmde_reset.save()
            reset_key.used = True
            reset_key.save()
            result = {"message":"commande reset envoyée"}
            return JSONResponse(result)
        except Exception as e:
            result = {"message": "la commande reset ne peut-être créée", "error": str(e)}
            return JSONResponse(result)
    else:
        result = {"message":"code reset déjà utilisé"}
        return JSONResponse(result) """

@api_view(["POST"])
def cmdreset(request):
    data = JSONParser().parse(request)
    searched_key = data['reset_key']
    try:
        reset_key = Reset.objects.get(reset_key=searched_key)
    except Reset.DoesNotExist:
        result = {"message":"code reset invalide"}
        return JSONResponse(result, status=status.HTTP_404_NOT_FOUND)
    if (reset_key and not reset_key.used) or (reset_key.reset_key == "#***#"):
        # rechercher s'il existe déjà un enregistrement Command avec le iduser "system"
        try:
            with transaction.atomic():
                cmde_reset, created = Command.objects.get_or_create(iduser="system", defaults={"command": "reset"})
                if not created:
                    cmde_reset.command = "reset"
                    cmde_reset.save()
                
                reset_key.used = True
                reset_key.save()
                
                result = {"message": "commande reset envoyée"}
                return JSONResponse(result, status=status.HTTP_200_OK)
        except Exception as e:
            result = {"message": "la commande reset ne peut-être créée", "error": str(e)}
            return JSONResponse(result, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    else:
        result = {"message":"code reset déjà utilisé"}
        JSONResponse(result, status=status.HTTP_400_BAD_REQUEST)

