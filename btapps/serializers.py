from rest_framework_simplejwt.serializers import TokenObtainPairSerializer, TokenRefreshSerializer
from rest_framework_simplejwt.exceptions import AuthenticationFailed
from rest_framework.parsers import JSONParser
from django.core.exceptions import ObjectDoesNotExist
from btapps.models import Application, Droit, Session



class CustomTokenRefreshSerializer(TokenRefreshSerializer):

    def validate(self, attrs):
        data = super().validate(attrs)
        
        # vérifier qu'il y a bien déjà une session ouverte
        appliname = self.context["request"].headers.get("appliname")
        #print(appliname)
        request= self.context.get("request")
        current_access_token = request.data['access']
        #print(current_access_token)
        fingerprint = self.context["request"].headers.get("fingerprint")
        session_count = Session.objects.filter(
            token=current_access_token, application=appliname, fingerprint=fingerprint
        ).count()
        #print(session_count)
        if session_count != 1:
            raise AuthenticationFailed(f"Session {appliname} not already opened; token can't be renewed")
        else:
            new_access_token = data['access']
            user_session = Session.objects.get(token=current_access_token, application=appliname, fingerprint=fingerprint)
            #print(user_session.token)
            user_session.token = new_access_token
            user_session.save()
            #print(user_session.token)
        return data

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        
        return token

    def validate(self, attrs):
        data = super().validate(attrs)

        # 1 vérifier si le user a le droit
        appliname = self.context["request"].headers.get("appliname")
        user_name = self.user.username
        #print(user_name)
        droit_appli_count = Droit.objects.filter(
            utilisateur=user_name, application=appliname
        ).count()
        #print(droit_appli_count)
        if droit_appli_count != 1:
            raise AuthenticationFailed("Invalid application rights")
        
        """ drf retournera HTTP 401 Unauthorized
            Content-Type: application/json
            {
                "detail": "Invalid application rights"
            }  """


        # 2 vérifier si l'utilisateur a déjà une session ouverte
        finger_print = self.context["request"].headers.get("fingerprint")
        access_token = data['access']
        user_session_count = Session.objects.filter(
            utilisateur=user_name, application=appliname
        ).count()
        #print(user_session_count)
        if user_session_count != 0:
            old_user_sessions = Session.objects.filter(utilisateur=user_name, application_id=appliname)
            #print(old_user_sessions)
            old_user_sessions.delete()
            # raise AuthenticationFailed("Session " + appliname + " already opened")

        # 3 vérifier nb licences appli et comparer au nb de sessions ouvertes pr l'appli
        try:
            selected_appli = Application.objects.get(name=appliname)
            nb_licences = selected_appli.nb_conn_max
            appli_opened_session_count = Session.objects.filter(
            application=appliname
            ).count()
            # print(nb_licences)
            # print(appli_opened_session_count)
            if (appli_opened_session_count >= nb_licences):
                raise AuthenticationFailed("Nombre de licences atteint")
        except ObjectDoesNotExist:
            raise AuthenticationFailed(f"Application {appliname} does not exist")
        
        
        
        # print(f"fingerprint: {finger_print}")
        # print(data['access'])
       
        
        # print(type(finger_print))
        # print(type(access_token))
        # print(type(user_name))
        # print(type(appliname))
        
        # enregistrement de la session
        new_user_session = Session(utilisateur=user_name, fingerprint=finger_print, application_id=appliname, token=access_token)
        new_user_session.save()
        
        data["application_name"] = appliname
        data["droit_appli_count"] = droit_appli_count
        return data
