from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.exceptions import AuthenticationFailed
from btapps.models import Session

class CustomJWTAuthentication(JWTAuthentication):
    def authenticate(self, request):
        header = self.get_header(request)
        if header is None:
            return None

        raw_token = self.get_raw_token(header)
        if raw_token is None:
            return None

        validated_token = self.get_validated_token(raw_token)
        #print(f"test : {validated_token}")
        appliname = request.headers.get("appliname")
        #print(f"appli : {appliname}")
        fingerprint = request.headers.get("fingerprint")
        #print(f"fingerprint : {fingerprint}")
        
        if (fingerprint is None):
            raise AuthenticationFailed('Authentification failed - fingerprint ')
        if (appliname is None):
            raise AuthenticationFailed('Authentification failed - appliname ')
        
        # Vérifier l'existence d'une session
        session_user_count = Session.objects.filter(token=validated_token, application=appliname, fingerprint=fingerprint).count()
        #print(session_user_count)
        if (session_user_count == 0):
            raise AuthenticationFailed('Authentification failed - session introuvable')
        if (session_user_count > 1):
            # delete all instances
            sessions_user = Session.objects.filter(token=validated_token, application=appliname, fingerprint=fingerprint)
            sessions_user.delete()     
            raise AuthenticationFailed('Authentification failed - too many sessions for the user')
        return self.get_user(validated_token), validated_token
