from rest_framework import serializers
from bcweb.models import Bordereau, Piece, Produit, Machine, Command, Qrpiece, Qrpiece_article

# from wprod.views import *


class BordereauSerializer(serializers.HyperlinkedModelSerializer):
    produits = serializers.HyperlinkedRelatedField(
        many=True, read_only=True, view_name="produit_detail"
    )
    pieces = serializers.HyperlinkedRelatedField(
        many=True, read_only=True, view_name="piece_detail"
    )
    
    class Meta:
        model = Bordereau
        fields = (
            "url",
            "bc_num",
            "bc_num_affaire",
            "bc_affaire",
            "bc_etat_affaire",
            "bc_client",
            "bc_etat_bl",
            "bc_chantier",
            "bc_adresse_livraison",
            "bc_ville_livraison",
            "bc_cp_livraison",
            "bc_transporteur",
            "bc_date_creation",
            "bc_date_chargement_prev",
            "bc_date_livraison_prev",
            "bc_poste",
            "bc_date_bt",
            "bc_date_web",
            "bc_webuser",
            "bc_observ_web",
            "bc_observ",
            "bc_statut",
            "pieces",
            "produits",
        )


class PieceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Piece
        fields = (
            "id",
            "pce_num_bl",
            "pce_num",
            "pce_ref_client",
            "pce_etat",
            "pce_nom_etude",
            "pce_ref_etude",
            "pce_type_pdt",
            "pce_qte",
            "pce_unit",
            "pce_poids",
            "pce_charge",
            "pce_prop_charge",
            "pce_date_prod",
            "pce_date_planif",
            "pce_observ_bc",
            "pce_observ_pce",
            "pce_date_bt",
            "pce_date_web",
            "pce_webuser",
            "pce_observ_web",
        )


class ProduitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produit
        fields = (
            "id",
            "pdt_num_bl",
            "pdt_code",
            "pdt_num_serie",
            "pdt_libel",
            "pdt_qte",
            "pdt_unit",
            "pdt_prop_charge",
            "pdt_charge",
            "pdt_observ_bc",
            "pdt_consigne",
            "pdt_date_bt",
            "pdt_date_web",
            "pdt_webuser",
            "pdt_observ_web", 
        )


class MachineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Machine
        fields = (
            "device_id",
            "scandit_device_id",
        )

class CommandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Command
        fields = (
            "id",
            "bc_num",
            "iduser",
            "command",
        )

class QrpieceSerializer(serializers.HyperlinkedModelSerializer):
    qrpieces = serializers.HyperlinkedRelatedField(
        many=True, read_only=True, view_name="qrpiece_article_detail"
    )
    
    class Meta:
        model = Qrpiece
        fields = (
            "url",
            "qrp_num",
            "qrpieces",
            "qrp_ref_client",
            "qrp_etat",
            "qrp_nom_etude",
            "qrp_ref_etude",
            "qrp_type_pdt",
            "qrp_qte",
            "qrp_unit",
            "qrp_poids",
            "qrp_prop_charge",
            "qrp_charge",
            "qrp_observ_pce",
            "qrp_num_bl",
            "qrp_nom_client",
            "qrp_nom_affaire",
            "qrp_num_affaire",
            "qrp_etat_affaire",
            "qrp_etat_prod",
            "qrp_cahier_plan",
            "qrp_dessinateur",
            "qrp_etude_par",
            "qrp_redige_par",
            "qrp_atelier",
            "qrp_date_fabr_prevue",
            "qrp_date_livr_prevue",
            "qrp_date_charge",
            "qrp_date_livraison",
            "qrp_etat_bl",
            "qrp_num_phase",
            "qrp_date_phase",
            "qrp_prix_unit",
            "qrp_num_nc",
            "qrp_num_facture",
            "qrp_etat_facture",
            "qrp_date_facture",
            "qrp_surface",
            "qrp_volume",
            "qrp_longueur",
            "qrp_largeur",
            "qrp_hauteur",
            "qrp_beton",
        )


class Qrpiece_articleSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Qrpiece_article
        fields = (
            "id",
            "qrpa_unit",
            "qrpa_libel",
            "qrpa_qte",
            "qrpa_observ",
            "qrpa_origine",
            "qrpa_qrp_num_id",
        )