from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from .models import Bordereau, Piece, Produit


class BordereauTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.bordereau = Bordereau.objects.create(
            bc_num = "000044",
            bc_num_affaire = "202323031",
            bc_affaire = "ALDO",
            bc_etat_affaire = "Signée",
            bc_client = "BENEPE",
            bc_etat_bl = "BC édité",
            bc_chantier = "ZI Vivaldi",
            bc_adresse_livraison = "Rue des Charmes",
            bc_ville_livraison = "REIMS",
            bc_cp_livraison = "51100",
            bc_transporteur = "VITOTI",
            bc_date_creation = "2022-11-17 09:57:25+00",
            bc_date_chargement_prev = "2022-11-09 23:00:00+00",
            bc_date_livraison_prev = "2022-11-09 23:00:00+00",
            bc_poste = "Atelier 3",
            bc_date_bt = "2022-11-09 23:00:00+00",
            bc_date_web = "2023-03-18 16:38:43+00",
            bc_webuser = "user1",
            bc_observ_web = "test",
            bc_observ = "Décharger d'abord pièce XYZ quai D5",
        )
    
    def test_bordereau_content(self):
        self.assertEqual(self.bordereau.bc_num, "000044")
        self.assertEqual(self.bordereau.bc_date_creation, "2022-11-17 09:57:25+00")
        
class PieceTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.myBordereau = Bordereau.objects.create(
            bc_num = "000045",
            bc_num_affaire = "202323031",
            bc_affaire = "ALDO",
            bc_etat_affaire = "Signée",
            bc_client = "BENEPE",
            bc_etat_bl = "BC édité",
            bc_chantier = "ZI Vivaldi",
            bc_adresse_livraison = "Rue des Charmes",
            bc_ville_livraison = "REIMS",
            bc_cp_livraison = "51100",
            bc_transporteur = "VITOTI",
            bc_date_creation = "2022-11-17 09:57:25+00",
            bc_date_chargement_prev = "2022-11-09 23:00:00+00",
            bc_date_livraison_prev = "2022-11-09 23:00:00+00",
            bc_poste = "Atelier 3",
            bc_date_bt = "2022-11-09 23:00:00+00",
            bc_date_web = "2023-03-18 16:38:43+00",
            bc_webuser = "user1",
            bc_observ_web = "test",
            bc_observ = "Décharger d'abord pièce XYZ quai D5",
        )
        cls.piece = Piece.objects.create(   
            pce_num_bl = cls.myBordereau,
            pce_num = "000888",
            pce_ref_client = "Transport ET40",
            pce_etat = "OK",
            pce_nom_etude = "TRANSPORT",
            pce_ref_etude = "40",
            pce_type_pdt = "TRANSPORT",
            pce_qte = 4.000,
            pce_unit = "U",
            pce_poids = 1.9030,
            pce_prop_charge = False,
            pce_charge = True,
            pce_observ_bc = "TRANSPORT",
            pce_date_prod = "2023-03-22 13:27:13+00",
            pce_observ_pce = "TRANSPORT",
            pce_date_planif = "2023-03-22 13:27:13+00",
            pce_date_bt = "2023-03-22 13:27:13+00",
            pce_date_web = "2023-03-22 13:27:13+00",
            pce_webuser = "user1",
            pce_observ_web = "TRANSPORT ...",
        )
    
    def test_piece_content(self):
        self.assertEqual(self.piece.pce_num_bl, self.myBordereau)
        self.assertEqual(self.piece.pce_date_planif, "2023-03-22 13:27:13+00")
        self.assertEqual(self.piece.pce_qte, 4.000)
        self.assertEqual(self.piece.pce_charge, True)
        
class ProduitTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.myBordereau = Bordereau.objects.create(
            bc_num = "000046",
            bc_num_affaire = "202323031",
            bc_affaire = "ALDO",
            bc_etat_affaire = "Signée",
            bc_client = "BENEPE",
            bc_etat_bl = "BC édité",
            bc_chantier = "ZI Vivaldi",
            bc_adresse_livraison = "Rue des Charmes",
            bc_ville_livraison = "REIMS",
            bc_cp_livraison = "51100",
            bc_transporteur = "VITOTI",
            bc_date_creation = "2022-11-17 09:57:25+00",
            bc_date_chargement_prev = "2022-11-09 23:00:00+00",
            bc_date_livraison_prev = "2022-11-09 23:00:00+00",
            bc_poste = "Atelier 3",
            bc_date_bt = "2022-11-09 23:00:00+00",
            bc_date_web = "2023-03-18 16:38:43+00",
            bc_webuser = "user1",
            bc_observ_web = "test",
            bc_observ = "Décharger d'abord pièce XYZ quai D5",
        )
        cls.produit = Produit.objects.create(   
            pdt_num_bl = cls.myBordereau,
            pdt_code = 3902,
            pdt_num_serie = "548ef94-az",
            pdt_libel = "",
            pdt_qte = 3.5,
            pdt_unit = "U",
            pdt_prop_charge = True,
            pdt_charge = True,
            pdt_observ_bc = "retour prévu le ...",
            pdt_consigne = True,
            pdt_date_bt = "2023-03-24 08:15:41+00",
            pdt_date_web = "2023-03-24 08:15:41+00",
            pdt_webuser = "user2",
            pdt_observ_web = "du texte",
        )
    
    def test_piece_content(self):
        self.assertEqual(self.produit.pdt_num_bl, self.myBordereau)
        self.assertEqual(self.produit.pdt_code, 3902)
        self.assertEqual(self.produit.pdt_num_serie, "548ef94-az")
        self.assertEqual(self.produit.pdt_libel, "")
        self.assertEqual(self.produit.pdt_qte, 3.5)
        self.assertEqual(self.produit.pdt_prop_charge, True)
        self.assertEqual(self.produit.pdt_charge, True)
        self.assertEqual(self.produit.pdt_observ_bc, "retour prévu le ...")
        self.assertEqual(self.produit.pdt_date_bt, "2023-03-24 08:15:41+00")

class APITests(APITestCase):
    @classmethod
    def setUpTestData(cls):
        cls.bordereau = Bordereau.objects.create(
            bc_num = "000047",
            bc_num_affaire = "202323031",
            bc_affaire = "ALDO",
            bc_etat_affaire = "Signée",
            bc_client = "BENEPE",
            bc_etat_bl = "BC édité",
            bc_chantier = "ZI Vivaldi",
            bc_adresse_livraison = "Rue des Charmes",
            bc_ville_livraison = "REIMS",
            bc_cp_livraison = "51100",
            bc_transporteur = "VITOTI",
            bc_date_creation = "2022-11-17 09:57:25+00",
            bc_date_chargement_prev = "2022-11-09 23:00:00+00",
            bc_date_livraison_prev = "2022-11-09 23:00:00+00",
            bc_poste = "Atelier 3",
            bc_date_bt = "2022-11-09 23:00:00+00",
            bc_date_web = "2023-03-18 16:38:43+00",
            bc_webuser = "user1",
            bc_observ_web = "test",
            bc_observ = "Décharger d'abord pièce XYZ quai D5",
        )
    
    def test_bordereau_listview(self):
        response = self.client.get(reverse("bordereau-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(Bordereau.objects.count(), 1)
        self.assertContains(response, self.bordereau)
        
        
        
    
        