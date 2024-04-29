from django.shortcuts import render

# Create your views here.
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from django.http import HttpResponse
from django.shortcuts import render
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.reverse import reverse
from bcweb.models import Bordereau, Piece, Produit, Machine, Param, PrintDebug, Command, Qrpiece, Qrpiece_article
from bcweb.serializers import (
    BordereauSerializer,
    PieceSerializer,
    QrpieceSerializer,
    Qrpiece_articleSerializer,
    ProduitSerializer,
    MachineSerializer,
    CommandSerializer,
)
from rest_framework import permissions
from rest_framework.throttling import ScopedRateThrottle
from rest_framework.decorators import api_view, permission_classes
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
from django.contrib.auth.models import User
from django.db import transaction
import json
from rest_framework.pagination import PageNumberPagination


class StandardResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 1000


class JSONResponse(HttpResponse):
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs["content_type"] = "application/json"
        super(JSONResponse, self).__init__(content, **kwargs)


class BordereauList(generics.ListCreateAPIView):
    throttle_scope = "bordereau-list"
    throttle_classes = (ScopedRateThrottle,)
    queryset = Bordereau.objects.all()
    serializer_class = BordereauSerializer
    name = "bordereau-list"
    filter_fields = (
        "bc_num",
        "bc_num_affaire",
        "bc_client",
        "bc_chantier",
        "bc_ville_livraison",
    )
    search_fields = (
        "bc_num",
        "bc_num_affaire",
        "bc_client",
        "bc_chantier",
        "bc_ville_livraison",
        "bc_affaire",
    )
    ordering_fields = (
        "bc_num",
        "bc_num_affaire",
        "bc_affaire",
        "bc_client",
        "bc_chantier",
        "bc_ville_livraison",
    )
    permission_classes = (permissions.IsAuthenticated,)


class BordereauDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Bordereau.objects.all()
    serializer_class = BordereauSerializer
    name = "bordereau-detail"
    permission_classes = (permissions.IsAuthenticated,)


class PieceList(generics.ListCreateAPIView):
    queryset = Piece.objects.all()
    serializer_class = PieceSerializer
    name = "piece-list"
    filter_fields = (
        "pce_num_bl",
        "pce_num",
        "pce_unit",
        "pce_ref_client",
        "pce_charge",
    )
    search_fields = (
        "pce_num_bl",
        "pce_num",
        "pce_ref_client",
        "pce_nom_etude",
        "pce_charge",
    )
    ordering_fields = (
        "pce_num_bl",
        "pce_num",
        "pce_codeproduit",
    )
    permission_classes = (permissions.IsAuthenticated,)


class PiecesList(generics.ListAPIView):
    serializer_class = PieceSerializer
    pagination_class = StandardResultsSetPagination
    name="pcesdubc"
    
    def get_queryset(self):
        pce_num_bl = self.kwargs['pce_num_bl']
        return Piece.objects.filter(pce_num_bl=pce_num_bl)
        
        
class ProduitList(generics.ListCreateAPIView):
    queryset = Produit.objects.all()
    serializer_class = ProduitSerializer
    name = "produit-list"
    filter_fields = (
        "pdt_num_bl",
        "pdt_code",
        "pdt_num_serie",
        "pdt_libel",
        "pdt_qte",
        "pdt_unit",
        "pdt_prop_charge",
        "pdt_charge",
        "pdt_consigne",
        "pdt_date_bt",
        "pdt_date_web",
        "pdt_webuser",
        "pdt_observ_bc",
        "pdt_observ_web",
    )
    search_fields = (
        "pdt_num_bl",
        "pdt_code",
        "pdt_num_serie",
        "pdt_libel",
        "pdt_charge",
    )
    ordering_fields = (
        "pdt_num_bl",
        "pdt_code",
        "pdt_charge",
    )
    permission_classes = (permissions.IsAuthenticated,)


class PieceDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Piece.objects.all()
    serializer_class = PieceSerializer
    name = "piece_detail"
    permission_classes = (permissions.IsAuthenticated,)

class QrpieceList(generics.ListCreateAPIView):

    queryset = Qrpiece.objects.all()
    serializer_class = QrpieceSerializer
    name = "qrpiece-list"
    filter_fields = (
        "qrp_num",
        "qrp_num_affaire",
        "qrp_nom_client",
    )
    search_fields = (
        "qrp_num",
        "qrp_num_affaire",
        "qrp_nom_affaire",
        "qrp_nom_client",
    )
    ordering_fields = (
        "qrp_num",
        "qrp_num_affaire",
        "qrp_nom_affaire",
        "qrp_nom_client",
    )


class Qrpiece_articleDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Qrpiece_article.objects.all()
    serializer_class = Qrpiece_articleSerializer
    name = "qrpiece_article_detail"

@api_view(['GET'])
def QrpieceDetail(request, qrp_num):
    qrpiece = Qrpiece.objects.filter(qrp_num=qrp_num).first()
    print(qrpiece)
    qrpiece_articles = Qrpiece_article.objects.filter(qrpa_qrp_num=qrp_num)
    if request.user.is_authenticated:
        return render(request, "qrpiece_spec.html", {"qrpiece": qrpiece, "qrpiece_articles": qrpiece_articles})
    else:
        return render(request, "qrpiece.html", {"qrpiece": qrpiece, "qrpiece_articles": qrpiece_articles})

def PieceConsultation(request, pce_num):
    piece = Piece.objects.get(pce_num=pce_num)
    # print(piece)
    # res = "test"
    # return HttpResponse(piece)
    return render(request, "piece.html", {"piece": piece})


class ProduitDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Produit.objects.all()
    serializer_class = ProduitSerializer
    name = "produit_detail"
    permission_classes = (permissions.IsAuthenticated,)


class ApiRoot(generics.GenericAPIView):
    throttle_scope = "api-root"
    throttle_classes = (ScopedRateThrottle,)
    name = "api-root"

    def get(self, request, *args, **kwargs):
        return Response(
            {
                "bordereaux": reverse(BordereauList.name, request=request),
                "pieces": reverse(PieceList.name, request=request),
                "produits": reverse(ProduitList.name, request=request),
                "qrpieces": reverse(QrpieceList.name, request=request),
            }
        )


class Hello(generics.GenericAPIView):
    name = "hello"

    def get(self, request, *args, **kwargs):
        return Response(
            {
                "hello": "hello",
            }
        )


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checkDevice(request):
    trace = PrintDebug(message="passage ds la fonction checkDevice...")
    trace.save()
    uuid_data = JSONParser().parse(request)
    try:
        uuid = Machine.objects.get(pk=uuid_data["uuid"])
        uuid.nb_conn = uuid.nb_conn + 1
        uuid.save()
    except Machine.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == "POST":
        # print(uuid_data["uuid"])
        # print(type(uuid_data))
        uuid_serialized = MachineSerializer(uuid)
        return JSONResponse(uuid_serialized.data)
    return Response(status=status.HTTP_404_NOT_FOUND)
    # print(queryset)
    # qrs_list = list(uuid)
    # print(qrs_list)

@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["PATCH"])
@transaction.atomic
def PiecesToPatch(request):
    trace = PrintDebug(message="passage ds la fonction PiecesToPatch...")
    trace.save()
    #data = JSONParser().parse(request) # a python object that can be used by a serializer
    data = request.data # a python object that can be used by a serializer
    try:
        for obj in data:
            # mettre à jour les champs
            # print(obj["id"])
            pce = Piece.objects.get(id=obj["id"])
            pce.pce_date_web = obj["pce_date_web"]
            pce.pce_observ_bc = obj["pce_observ_bc"]
            pce.pce_charge = obj["pce_charge"]
            pce.pce_webuser = obj["pce_webuser"]
            pce.save()
        message = {"message": "success. Pieces bien patchées."}
    except Piece.DoesNotExist:
        {"message": "failed. Pieces non patchées."}
        #return Response(status=status.HTTP_404_NOT_FOUND)
        return JSONResponse(message)
    #return Response(status=status.HTTP_200_OK)
    return JSONResponse(message)

def checkAddOK():
    isAddOK = Param.objects.get(pk=1)
    return isAddOK.addOK


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def addDevice(request):
    name = "AddDevice"
    # return Response(status=status.HTTP_200_OK)
    infosDevice = JSONParser().parse(request)

    new_uuid = infosDevice["uuid"]

    new_scandit_device_id = infosDevice["scandit_device_id"]
    username = infosDevice["username"]

    isAddOK = checkAddOK()

    if isAddOK and new_uuid != None and new_scandit_device_id != None:
        try:
            machine = Machine.objects.get(pk=infosDevice["uuid"])
            return Response(status=status.HTTP_200_OK)
        except Machine.DoesNotExist:
            today = datetime.now()
            # return Response(status=status.HTTP_200_OK)
            newMachine = Machine(
                device_id=new_uuid,
                scandit_device_id=new_scandit_device_id,
                entreprise="DEMO",
                utilisateur=username,
                record_date=today,
                actif=True,
            )
            newMachine.save()
            isAddOK = Param.objects.get(pk=1)
            isAddOK.addOK = False
            isAddOK.save()
            return Response(status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def openDoorForNewDevice(request):
    trace = PrintDebug(message="passage ds la fonction openDoor...")
    trace.save()
    name = "openDoorForNewDevice"
    infos = JSONParser().parse(request)
    username = infos["username"]
    user = User.objects.get(username=username)
    statutAddOK = checkAddOK()
    # return Response(status=status.HTTP_200_OK)
    if statutAddOK == False:
        paramAddOK = Param.objects.get(pk=1)
        paramAddOK.addOK = True
        paramAddOK.save()
        return Response(status=status.HTTP_200_OK)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checkifUserHasCommandLine(request):
    name = "checkifUserHasCommandLine"
    user_to_check = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction checkifUserHasCommandLine..."
        + user_to_check["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=user_to_check["username"])
        cmdeUser_serialized = CommandSerializer(cmdeUser)
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        new_cmdeUser = Command(iduser=user_to_check["username"])
        new_cmdeUser.save()
        new_cmdeUser_serialized = CommandSerializer(new_cmdeUser)
        trace = PrintDebug(
            message="création nouvelle ligne de commande pour un utilisateur : passage ds la fonction checkifUserHasCommandLine"
            + user_to_check["username"]
            + " error : "
            + str(e)
        )
        trace.save()
        return JSONResponse(new_cmdeUser_serialized.data)
    return JSONResponse(cmdeUser_serialized.data)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def cmdeActualiserBcs(request):
    name = "cmdeActualiserBcs"
    user_to_check = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction cmdeActualiserBcs..."
        + user_to_check["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=user_to_check["username"])
        cmdeUser.command = "actualiser"
        cmdeUser.save()
        # cmdeUser_serialized = CommandSerializer(cmdeUser)
        message = {"message": "ok"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        message = {
            "message": "anomalie actualiser : user inexistant ds Command; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checkcommand(request):
    name = "checkcommand"
    user_to_check = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction checkcommand..." + user_to_check["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=user_to_check["username"])
        result = cmdeUser.command
        message = {"message": result}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        message = {
            "message": "anomalie checkcommand : pas de ligne de commande pr utilisateur "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        }
        trace = PrintDebug(
            message="anomalie checkcommand : pas de ligne de commande pr utilisateur "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def pause(request):
    name = "pause"
    user_to_check = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction pause..." + user_to_check["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=user_to_check["username"])
        cmdeUser.command = "pause"
        cmdeUser.save()
        message = {"message": "en pause"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie pause : pas de ligne de commande pour user "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie pause: pas de ligne de commande pour user "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def reprise(request):
    name = "reprise"
    user_to_check = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction reprise..." + user_to_check["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=user_to_check["username"])
        cmdeUser.command = "reprise"
        cmdeUser.save()
        message = {"message": "reprise"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie reprise : pas de ligne de commande pour user "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie reprise: pas de ligne de commande pour user "
            + user_to_check["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def fermer(request):
    name = "fermer"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction fermer/réinitialiser..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "reinitialiser"
        cmdeUser.bc_num = data["bc_num"]
        cmdeUser.save()
        message = {"message": "fermer"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie fermer/reinitialiser: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie fermer/reinitialiser: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checkok(request):
    name = "checkok"
    data = JSONParser().parse(request)
    trace = PrintDebug(message="passage ds la fonction checkok..." + data["username"])
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        if cmdeUser.command == "> ok":
            message = {"message": "> ok"}
        elif cmdeUser.command[:7] == "> error":
            message = {"message": cmdeUser.command}
        else:
            message = {"message": "nok"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie checkok: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie checkok: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
@transaction.atomic
def ouvrir(request):
    name = "ouvrir"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction ouvrir..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "ouvrir"
        cmdeUser.bc_num = data["bc_num"]
        cmdeUser.save()
        #print(type(data["bc_num"]))
        # afficher caractères invisibles (espace, retour à la ligne) : print(repr(data["bc_num"]))
        bcOpen = Bordereau.objects.get(pk=data["bc_num"].strip())
        bcOpen.bc_statut = "en cours"
        bcOpen.save()
        #print(isinstance(bcOpen, Bordereau))
        message = {"message": "ouvrir"}
        
    except (Command.DoesNotExist, Bordereau.DoesNotExist) as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie ouvrir: pas de ligne de commande pour user "
            + data["username"]
            + " OU accès impossible au BC "
            + data["bc_num"]
            + " l'action ouvrir n'a pu être effectuée"
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie ouvrir: pas de ligne de commande pour user "
            + data["username"]
            + " OU accès impossible au BC "
            + data["bc_num"]
            + " l'action ouvrir n'a pu être effectuée"
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checkstatutbc(request):
    name = "checkstatutbc"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction checkstatutbc..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche du bon de commande et récupération du statut
        bc = Bordereau.objects.get(bc_num=data["bc_num"])
        message = {"message": bc.bc_statut}
    except Bordereau.DoesNotExist as e:
        # si le bordereau n est pas trouvé
        trace = PrintDebug(
            message="anomalie checkstatutbc: bordereau introuvable "
            + data["username"]
            + " "
            + data["bc_num"]
            + " l'action checkstatutbc n'a pu être effectuée"
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie checkstatutbc: bordereau introuvable "
            + data["username"]
            + " "
            + data["bc_num"]
            + " l'action checkstatutbc n'a pu être effectuée"
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
@transaction.atomic
def valider(request):
    name = "valider"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction valider..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "valider"
        cmdeUser.bc_num = data["bc_num"]
        cmdeUser.save()
        bc = Bordereau.objects.get(bc_num=data["bc_num"])
        bc.bc_statut = "validé"
        bc.save()
        message = {"message": "valider"}
    except (Command.DoesNotExist, Bordereau.DoesNotExist) as e:
        # si l'utilisateur n'existe pas ds la table Command ou si le Bordereau n'est pas trouvé
        trace = PrintDebug(
            message="anomalie valider: pas de ligne de commande pour le user OU bordereau inconnu"
            + data["username"]
            + " "
            + data["bc_num"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie valider: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def record(request):
    name = "record"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction record (enregistrer) qui met en pause..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "pause"
        cmdeUser.bc_num = data["bc_num"]
        cmdeUser.save()
        message = {"message": "en pause"}
    except (Command.DoesNotExist, Bordereau.DoesNotExist) as e:
        # si l'utilisateur n'existe pas ds la table Command ou si le Bordereau n'est pas trouvé
        trace = PrintDebug(
            message="anomalie record (=mise en pause pr enreg.): pas de ligne de commande pour le user "
            + data["username"]
            + " "
            + data["bc_num"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie record (=mise en pause pr enreg.): pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)


""" @csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def valider(request):
    name = "valider"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction valider..."
        + data["username"]
        + " bc_num : "
        + data["bc_num"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "valider"
        cmdeUser.bc_num = data["bc_num"]
        cmdeUser.save()
        message = {"message": "valider"}
    except Command.DoesNotExist as e:
        # si l'utilisateur n'existe pas ds la table Command
        trace = PrintDebug(
            message="anomalie valider: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"+str(e)
        )
        trace.save()
        message = {
            "message": "anomalie valider: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"+str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message) """


@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def checklogs(request):
    name = "ckecklogs"
    data = JSONParser().parse(request)
    trace = PrintDebug(message="passage ds la fonction checklogs..." + data["username"])
    trace.save()
    try:
        user = User.objects.get(username=data["username"])
    except User.DoesNotExist as e:
        trace = PrintDebug(
            message="anomalie checklogs: utilisateur introuvable "
            + data["username"]
            + "; error :"
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie ckecklogs, utilisateur introuvable"
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    if user.is_superuser:
        try:
            logs = PrintDebug.objects.all()
            # print(piece)
            # res = "test"
            # return HttpResponse(piece)
            return render(request, "logs.html", {"logs": logs})
        except Exception as e:
            message = {
                "message": "anomalie ckecklogs"
                + data["username"]
                + "; error :"
                + str(e)
            }
            return JSONResponse(message)
    else:
        message = "Utilisateur non autorisé à consulter l'historique"
        return JSONResponse(message)

@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["POST"])
def sendok(request):
    name = "sendok"
    data = JSONParser().parse(request)
    trace = PrintDebug(
        message="passage ds la fonction sendok..."
        + data["username"]
    )
    trace.save()
    try:
        # recherche de la ligne de commande de l'utilisateur
        cmdeUser = Command.objects.get(iduser=data["username"])
        cmdeUser.command = "> ok"
        cmdeUser.save()
        message = {"message": "sendok"}
    except (Command.DoesNotExist, Bordereau.DoesNotExist) as e:
        # si l'utilisateur n'existe pas ds la table Command ou si le Bordereau n'est pas trouvé
        trace = PrintDebug(
            message="anomalie sendok: pas de ligne de commande pour le user "
            + data["username"]
            + " "
            + "; error : "
            + str(e)
        )
        trace.save()
        message = {
            "message": "anomalie sendok: pas de ligne de commande pour user "
            + data["username"]
            + "; error :"
            + str(e)
        }
        return JSONResponse(message)
    return JSONResponse(message)

@csrf_exempt
@permission_classes((permissions.IsAuthenticated,))
@api_view(["GET"])
def nbpces(request, pce_num_bl):
    name = "nbpces"
    trace = PrintDebug(
        message="passage ds la fonction nbpces..."
    )
    trace.save()

    # recherche des pièces du bl
    nbpces_bl = Piece.objects.filter(pce_num_bl=pce_num_bl).count()
    result = {"count": nbpces_bl}
    return JSONResponse(result)
