from django.urls import include, re_path, path

# from bcweb.views import PieceConsultation
from bcweb import views


urlpatterns = [
    re_path(r"^bcx/$", views.BordereauList.as_view(), name=views.BordereauList.name),
    re_path(
        r"^bc/(?P<pk>[0-9]+)$",
        views.BordereauDetail.as_view(),
        name=views.BordereauDetail.name,
    ),
    re_path(
        r"^bc/updatedatepces/$",
        views.updateDatePces,
        name="updateDatePces",
    ),
    re_path(r"^pces/$", views.PieceList.as_view(), name=views.PieceList.name),
    re_path(
        r"^pce/(?P<pk>[a-z-0-9]+)$",
        views.PieceDetail.as_view(),
        name=views.PieceDetail.name,
    ),
    re_path(r"^pcestopatch/$",
        views.PiecesToPatch,
        name="PiecesToPatch",
        ),
    re_path(
        r"^qrp/(?P<qrp_num>[a-z-0-9]+)$",
        views.QrpieceDetail,
        name="QrpieceDetail",
    ),
    re_path(
        r"^consult/(?P<pce_num>[A-Za-z0-9.-]+)$",
        views.PieceConsultation,
        name="PieceConsultation",
    ),
    re_path(r"^pdts/$", views.ProduitList.as_view(), name=views.ProduitList.name),
    re_path(
        r"^pdt/(?P<pk>[0-9]+)$",
        views.ProduitDetail.as_view(),
        name=views.ProduitDetail.name,
    ),
    re_path(r"^$", views.ApiRoot.as_view(), name=views.ApiRoot.name),
    # re_path(r"^api-auth/", include("rest_framework.urls")),
    re_path(r"^hello/$", views.Hello.as_view(), name=views.Hello.name),
    re_path(r"^devices/$", views.checkDevice, name="checkDevice"),
    re_path(
        r"^opendoorfornewdevice/$",
        views.openDoorForNewDevice,
        name="openDoorForNewDevice",
    ),
    re_path(r"^newdevice/$", views.addDevice, name="addDevice"),
    re_path(
        r"^hascommandline/$",
        views.checkifUserHasCommandLine,
        name="checkifUserHasCommandLine",
    ),
    re_path(r"^actualiser/$", views.cmdeActualiserBcs, name="cmdeActualiserBcs"),
    re_path(r"^checkcommand/$", views.checkcommand, name="checkcommand"),
    re_path(r"^pause/$", views.pause, name="pause"),
    re_path(r"^reprise/$", views.reprise, name="reprise"),
    re_path(r"^fermer/$", views.fermer, name="fermer"),
    re_path(r"^checkok/$", views.checkok, name="checkok"),
    re_path(r"^checkwib/$", views.checkwib, name="checkwib"),
    re_path(r"^ouvrir/$", views.ouvrir, name="ouvrir"),
    re_path(r"^checkstatutbc/$", views.checkstatutbc, name="checkstatutbc"),
    re_path(r"^valider/$", views.valider, name="valider"),
    re_path(r"^livrable/$", views.livrable, name="livrable"),
    re_path(r"^record/$", views.record, name="record"),
    re_path(r"^checklogs/$", views.checklogs, name="checklogs"),
    re_path(r"^sendok/$", views.sendok, name="sendok"),
    re_path(r"^nbpces/(?P<pce_num_bl>[a-z-0-9]+)$", views.nbpces, name="nbpces"),
    re_path(r"^pcesdubc/(?P<pce_num_bl>[a-z-0-9]+)$", views.PiecesList.as_view(), name="pcesdubc"),
]
