from unittest.util import _MAX_LENGTH
from django.db import models
# from djmoney.models.fields import MoneyField
from btapps.models import Application
# Create your models here.

NB_CONN_ALLOWED = 4

class Bordereau(models.Model):
    bc_num = models.CharField(max_length=20, primary_key=True)
    bc_num_affaire = models.CharField(max_length=20, null=True, blank=True)
    bc_affaire = models.CharField(max_length=50, null=True, blank=True)
    bc_etat_affaire = models.CharField(max_length=20, null=True, blank=True)
    bc_client = models.CharField(max_length=50, null=True, blank=True)
    bc_etat_bl = models.CharField(max_length=25, null=True, blank=True)
    bc_chantier = models.CharField(max_length=50, blank=True, null=True)
    bc_adresse_livraison = models.CharField(max_length=50, blank=True, null=True)
    bc_ville_livraison = models.CharField(max_length=50, blank=True, null=True)
    bc_cp_livraison = models.CharField(max_length=20, blank=True, null=True)
    bc_transporteur = models.CharField(max_length=50, blank=True, null=True)
    bc_date_creation = models.DateTimeField(blank=True, null=True)
    bc_date_chargement_prev = models.DateTimeField(blank=True, null=True)
    bc_date_livraison_prev = models.DateTimeField(blank=True, null=True)
    bc_poste = models.CharField(max_length=10, blank=True, null=True)
    bc_date_bt = models.DateTimeField(blank=True, null=True)
    bc_date_web = models.DateTimeField(blank=True, null=True)
    bc_webuser = models.CharField(max_length=20, null=True, blank=True)
    bc_observ_web = models.TextField(max_length=2000, blank=True, null=True)
    bc_observ = models.TextField(max_length=2000, blank=True, null=True)
    bc_statut = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        ordering = ("-bc_num",)

    def __str__(self):
        return "N° de BC: " + str(self.bc_num)


class Piece(models.Model):
    UNITE_CHOICES = [
        (
            "ML",
            "Mètre linéaire",
        ),  # 'valeur en bdd', 'valeur utilisateur' / ligne.bli_unite affiche valeur db, ligne.get_bli_unite_display() affiche val util
        ("UN", "Unité"),
        ("M2", "Mètre carré"),
        ("KG", "Kilogramme"),
        ("M3", "Mètre cube"),
        ("TO", "Tonne"),
    ]
    pce_num_bl = models.ForeignKey(
        Bordereau, related_name="pieces", on_delete=models.CASCADE
    )
    pce_num = models.CharField(max_length=20, blank=True, null=True)
    pce_ref_client = models.CharField(max_length=20, blank=True, null=True)
    pce_etat = models.CharField(max_length=5, blank=True, null=True)
    pce_nom_etude = models.CharField(max_length=100, blank=True, null=True)
    pce_ref_etude = models.CharField(max_length=5, blank=True, null=True)
    pce_type_pdt = models.CharField(max_length=30, blank=True, null=True)
    pce_qte = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    pce_unit = models.CharField(
        max_length=3, blank=True, null=True, choices=UNITE_CHOICES
    )
    pce_poids = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    pce_prop_charge = models.BooleanField(default=False, blank=True, null=True)
    pce_charge = models.BooleanField(default=False, blank=True, null=True)
    pce_observ_bc = models.TextField(max_length=2000, blank=True, null=True)
    pce_date_prod = models.DateTimeField(blank=True, null=True)
    pce_observ_pce = models.TextField(max_length=2000, blank=True, null=True)
    pce_date_planif = models.DateTimeField(blank=True, null=True)
    pce_date_bt = models.DateTimeField(blank=True, null=True)
    pce_date_web = models.DateTimeField(blank=True, null=True)
    pce_webuser = models.CharField(max_length=20, blank=True, null=True)
    pce_observ_web = models.TextField(max_length=2000, blank=True, null=True)

    class Meta:
        ordering = ("-pce_num_bl", "-pce_num", "pce_type_pdt")

    def __str__(self):
        return str(self.id)


class Produit(models.Model):
    UNITE_CHOICES = [
        (
            "ML",
            "Mètre linéaire",
        ),  # 'valeur en bdd', 'valeur utilisateur' / ligne.bli_unite affiche valeur db, ligne.get_bli_unite_display() affiche val util
        ("UN", "Unité"),
        ("U", "Unité"),
        ("M2", "Mètre carré"),
        ("KG", "Kilogramme"),
        ("M3", "Mètre cube"),
        ("TO", "Tonne"),
    ]
    pdt_num_bl = models.ForeignKey(
        Bordereau, related_name="produits", on_delete=models.CASCADE
    )
    pdt_code = models.IntegerField(blank=True, null=True)
    pdt_num_serie = models.CharField(max_length=50, blank=True, null=True)
    pdt_libel = models.TextField(max_length=2000, blank=True, null=True)
    pdt_qte = models.FloatField(blank=True, null=True)
    pdt_unit = models.CharField(
        max_length=3, blank=True, null=True, choices=UNITE_CHOICES
    )
    pdt_prop_charge = models.BooleanField(default=False, blank=True, null=True)
    pdt_charge = models.BooleanField(default=False, blank=True, null=True)
    pdt_observ_bc = models.TextField(max_length=2000, blank=True, null=True)
    pdt_consigne = models.BooleanField(default=False, blank=True, null=True)
    pdt_date_bt = models.DateTimeField(blank=True, null=True)
    pdt_date_web = models.DateTimeField(blank=True, null=True)
    pdt_webuser = models.CharField(max_length=20, blank=True, null=True)
    pdt_observ_web = models.TextField(max_length=2000, blank=True, null=True)

    class Meta:
        ordering = ("-pdt_num_bl", "-pdt_code")

    def __str__(self):
        return str(self.id)


class Machine(models.Model):
    device_id = models.CharField(primary_key=True, max_length=100)  # CLE PRIMAIRE
    scandit_device_id = models.CharField(max_length=100, blank=True, null=True)
    entreprise = models.CharField(max_length=50, blank=True, null=True)
    utilisateur = models.CharField(max_length=50, blank=True, null=True)
    record_date = models.DateTimeField(blank=True, null=True)
    actif = models.BooleanField(default=True, blank=True, null=True)
    nb_conn = models.IntegerField(blank=True, null=True, default=1)

    def __str__(self):
        return "Device ID : " + self.device_id

class Param(models.Model):
    addOK = models.BooleanField(default=True, blank=True, null=True)

class PrintDebug(models.Model):
    message = models.TextField(max_length=2000, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
""" class Application(models.Model):
    name = models.CharField(primary_key=True, max_length=20)  # CLE PRIMAIRE
    nb_conn_max = models.IntegerField(blank=True, null=True, default=1)
    
class Droit(models.Model):
    application = models.ForeignKey(
        Application, related_name="droit_applications", on_delete=models.CASCADE
    )
    utilisateur = models.CharField(max_length=50, blank=True, null=True)
    client = models.CharField(max_length=50, blank=True, null=True)
    
    class Meta:
        unique_together = ('application', 'utilisateur',) """

class Command(models.Model):
    bc_num = models.CharField(max_length=20, null=True, blank=True)
    iduser = models.CharField(max_length=20, null=True, blank=True)
    command = models.CharField(max_length=70, null=True, blank=True)
    application_id = models.ForeignKey(
        'btapps.Application', related_name="command_applications", on_delete=models.CASCADE, null=True, blank=True
    )
    
    class Meta:
        ordering = ("iduser",)
        unique_together = ('iduser', 'application_id',)

    def __str__(self):
        return "ID : "+ self.id + " Commande : " + str(self.command) + " User: " + str(self.iduser) + " BC num : " + str(self.bc_num) + "Application ID : " + self.application_id

class Qrpiece(models.Model):
    qrp_num = models.CharField(primary_key=True,max_length=20, blank=True)
    qrp_ref_client = models.CharField(max_length=20, blank=True, null=True)
    qrp_etat = models.CharField(max_length=5, blank=True, null=True)
    qrp_nom_etude = models.CharField(max_length=100, blank=True, null=True)
    qrp_ref_etude = models.CharField(max_length=5, blank=True, null=True)
    qrp_type_pdt = models.CharField(max_length=30, blank=True, null=True)
    qrp_qte = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_unit = models.CharField(
        max_length=5, blank=True, null=True
    )
    qrp_poids = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_prop_charge = models.BooleanField(default=False, blank=True, null=True)
    qrp_charge = models.BooleanField(default=False, blank=True, null=True)
    qrp_observ_pce = models.TextField(max_length=2000, blank=True, null=True)
    qrp_num_bl = models.CharField(max_length=20, blank=True, null=True)
    qrp_nom_client = models.CharField(max_length=50, blank=True, null=True)
    qrp_nom_affaire = models.CharField(max_length=50, blank=True, null=True)
    qrp_num_affaire = models.CharField(max_length=10, blank=True, null=True)
    qrp_etat_affaire = models.CharField(max_length=20, blank=True, null=True)
    qrp_etat_prod = models.CharField(max_length=100, blank=True, null=True)
    qrp_cahier_plan = models.CharField(max_length=255, blank=True, null=True)
    qrp_dessinateur = models.CharField(max_length=255, blank=True, null=True)
    qrp_etude_par = models.CharField(max_length=255, blank=True, null=True)
    qrp_redige_par = models.CharField(max_length=255, blank=True, null=True)
    qrp_atelier = models.CharField(max_length=50, blank=True, null=True)
    qrp_date_fabr_prevue = models.DateTimeField(blank=True, null=True)
    qrp_date_livr_prevue = models.DateTimeField(blank=True, null=True)
    qrp_date_charge = models.DateTimeField(blank=True, null=True)
    qrp_date_livraison = models.DateTimeField(blank=True, null=True)
    qrp_etat_bl = models.CharField(max_length=25, blank=True, null=True)
    qrp_num_phase = models.IntegerField(blank=True, null=True)
    qrp_date_phase = models.DateTimeField(blank=True, null=True)
    qrp_prix_unit = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_num_nc = models.IntegerField(blank=True, null=True)
    qrp_num_facture = models.CharField(max_length=10, blank=True, null=True)
    qrp_etat_facture = models.CharField(max_length=10, blank=True, null=True)
    qrp_date_facture = models.DateTimeField(blank=True, null=True)
    qrp_surface = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_volume = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_longueur = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_largeur = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_hauteur = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrp_beton = models.CharField(max_length=150, blank=True, null=True)

class Qrpiece_article(models.Model):
    qrpa_qrp_num = models.ForeignKey(Qrpiece, related_name="qrpieces", on_delete=models.CASCADE, null=True, blank=True)
    qrpa_unit = models.CharField(max_length=5, blank=True, null=True)
    qrpa_libel = models.CharField(max_length=50, blank=True, null=True)
    qrpa_qte = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    qrpa_observ = models.CharField(max_length=255, blank=True, null=True)
    qrpa_origine = models.CharField(max_length=255, blank=True, null=True)
    qrpa_prix_unit = models.DecimalField(
        blank=True, null=True, max_digits=14, decimal_places=4
    )
    
