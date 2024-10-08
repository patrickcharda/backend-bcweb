# Generated by Django 4.0.2 on 2024-01-26 09:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('btapps', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bordereau',
            fields=[
                ('bc_num', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('bc_num_affaire', models.CharField(blank=True, max_length=20, null=True)),
                ('bc_affaire', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_etat_affaire', models.CharField(blank=True, max_length=20, null=True)),
                ('bc_client', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_etat_bl', models.CharField(blank=True, max_length=25, null=True)),
                ('bc_chantier', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_adresse_livraison', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_ville_livraison', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_cp_livraison', models.CharField(blank=True, max_length=20, null=True)),
                ('bc_transporteur', models.CharField(blank=True, max_length=50, null=True)),
                ('bc_date_creation', models.DateTimeField(blank=True, null=True)),
                ('bc_date_chargement_prev', models.DateTimeField(blank=True, null=True)),
                ('bc_date_livraison_prev', models.DateTimeField(blank=True, null=True)),
                ('bc_poste', models.CharField(blank=True, max_length=10, null=True)),
                ('bc_date_bt', models.DateTimeField(blank=True, null=True)),
                ('bc_date_web', models.DateTimeField(blank=True, null=True)),
                ('bc_webuser', models.CharField(blank=True, max_length=20, null=True)),
                ('bc_observ_web', models.TextField(blank=True, max_length=2000, null=True)),
                ('bc_observ', models.TextField(blank=True, max_length=2000, null=True)),
                ('bc_statut', models.CharField(blank=True, max_length=20, null=True)),
            ],
            options={
                'ordering': ('-bc_num',),
            },
        ),
        migrations.CreateModel(
            name='Machine',
            fields=[
                ('device_id', models.CharField(max_length=100, primary_key=True, serialize=False)),
                ('scandit_device_id', models.CharField(blank=True, max_length=100, null=True)),
                ('entreprise', models.CharField(blank=True, max_length=50, null=True)),
                ('utilisateur', models.CharField(blank=True, max_length=50, null=True)),
                ('record_date', models.DateTimeField(blank=True, null=True)),
                ('actif', models.BooleanField(blank=True, default=True, null=True)),
                ('nb_conn', models.IntegerField(blank=True, default=1, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Param',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('addOK', models.BooleanField(blank=True, default=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='PrintDebug',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.TextField(blank=True, max_length=2000, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Qrpiece',
            fields=[
                ('qrp_num', models.CharField(blank=True, max_length=20, primary_key=True, serialize=False)),
                ('qrp_ref_client', models.CharField(blank=True, max_length=20, null=True)),
                ('qrp_etat', models.CharField(blank=True, max_length=5, null=True)),
                ('qrp_nom_etude', models.CharField(blank=True, max_length=100, null=True)),
                ('qrp_ref_etude', models.CharField(blank=True, max_length=5, null=True)),
                ('qrp_type_pdt', models.CharField(blank=True, max_length=30, null=True)),
                ('qrp_qte', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_unit', models.CharField(blank=True, max_length=5, null=True)),
                ('qrp_poids', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_prop_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('qrp_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('qrp_observ_pce', models.TextField(blank=True, max_length=2000, null=True)),
                ('qrp_num_bl', models.CharField(blank=True, max_length=20, null=True)),
                ('qrp_nom_client', models.CharField(blank=True, max_length=50, null=True)),
                ('qrp_nom_affaire', models.CharField(blank=True, max_length=50, null=True)),
                ('qrp_num_affaire', models.CharField(blank=True, max_length=10, null=True)),
                ('qrp_etat_affaire', models.CharField(blank=True, max_length=20, null=True)),
                ('qrp_etat_prod', models.CharField(blank=True, max_length=100, null=True)),
                ('qrp_cahier_plan', models.CharField(blank=True, max_length=255, null=True)),
                ('qrp_dessinateur', models.CharField(blank=True, max_length=255, null=True)),
                ('qrp_etude_par', models.CharField(blank=True, max_length=255, null=True)),
                ('qrp_redige_par', models.CharField(blank=True, max_length=255, null=True)),
                ('qrp_atelier', models.CharField(blank=True, max_length=50, null=True)),
                ('qrp_date_fabr_prevue', models.DateTimeField(blank=True, null=True)),
                ('qrp_date_livr_prevue', models.DateTimeField(blank=True, null=True)),
                ('qrp_date_charge', models.DateTimeField(blank=True, null=True)),
                ('qrp_date_livraison', models.DateTimeField(blank=True, null=True)),
                ('qrp_etat_bl', models.CharField(blank=True, max_length=25, null=True)),
                ('qrp_num_phase', models.IntegerField(blank=True, null=True)),
                ('qrp_date_phase', models.DateTimeField(blank=True, null=True)),
                ('qrp_prix_unit', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_num_nc', models.IntegerField(blank=True, null=True)),
                ('qrp_num_facture', models.CharField(blank=True, max_length=10, null=True)),
                ('qrp_etat_facture', models.CharField(blank=True, max_length=10, null=True)),
                ('qrp_date_facture', models.DateTimeField(blank=True, null=True)),
                ('qrp_surface', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_volume', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_longueur', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_largeur', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_hauteur', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrp_beton', models.CharField(blank=True, max_length=150, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Qrpiece_article',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qrpa_unit', models.CharField(blank=True, max_length=5, null=True)),
                ('qrpa_libel', models.CharField(blank=True, max_length=50, null=True)),
                ('qrpa_qte', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrpa_observ', models.CharField(blank=True, max_length=255, null=True)),
                ('qrpa_origine', models.CharField(blank=True, max_length=255, null=True)),
                ('qrpa_prix_unit', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('qrpa_qrp_num', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='qrpieces', to='bcweb.qrpiece')),
            ],
        ),
        migrations.CreateModel(
            name='Produit',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pdt_code', models.IntegerField(blank=True, null=True)),
                ('pdt_num_serie', models.CharField(blank=True, max_length=50, null=True)),
                ('pdt_libel', models.TextField(blank=True, max_length=2000, null=True)),
                ('pdt_qte', models.FloatField(blank=True, null=True)),
                ('pdt_unit', models.CharField(blank=True, choices=[('ML', 'Mètre linéaire'), ('UN', 'Unité'), ('U', 'Unité'), ('M2', 'Mètre carré'), ('KG', 'Kilogramme'), ('M3', 'Mètre cube'), ('TO', 'Tonne')], max_length=3, null=True)),
                ('pdt_prop_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('pdt_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('pdt_observ_bc', models.TextField(blank=True, max_length=2000, null=True)),
                ('pdt_consigne', models.BooleanField(blank=True, default=False, null=True)),
                ('pdt_date_bt', models.DateTimeField(blank=True, null=True)),
                ('pdt_date_web', models.DateTimeField(blank=True, null=True)),
                ('pdt_webuser', models.CharField(blank=True, max_length=20, null=True)),
                ('pdt_observ_web', models.TextField(blank=True, max_length=2000, null=True)),
                ('pdt_num_bl', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='produits', to='bcweb.bordereau')),
            ],
            options={
                'ordering': ('-pdt_num_bl', '-pdt_code'),
            },
        ),
        migrations.CreateModel(
            name='Piece',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pce_num', models.CharField(blank=True, max_length=20, null=True)),
                ('pce_ref_client', models.CharField(blank=True, max_length=20, null=True)),
                ('pce_etat', models.CharField(blank=True, max_length=5, null=True)),
                ('pce_nom_etude', models.CharField(blank=True, max_length=100, null=True)),
                ('pce_ref_etude', models.CharField(blank=True, max_length=5, null=True)),
                ('pce_type_pdt', models.CharField(blank=True, max_length=30, null=True)),
                ('pce_qte', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('pce_unit', models.CharField(blank=True, choices=[('ML', 'Mètre linéaire'), ('UN', 'Unité'), ('M2', 'Mètre carré'), ('KG', 'Kilogramme'), ('M3', 'Mètre cube'), ('TO', 'Tonne')], max_length=3, null=True)),
                ('pce_poids', models.DecimalField(blank=True, decimal_places=4, max_digits=14, null=True)),
                ('pce_prop_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('pce_charge', models.BooleanField(blank=True, default=False, null=True)),
                ('pce_observ_bc', models.TextField(blank=True, max_length=2000, null=True)),
                ('pce_date_prod', models.DateTimeField(blank=True, null=True)),
                ('pce_observ_pce', models.TextField(blank=True, max_length=2000, null=True)),
                ('pce_date_planif', models.DateTimeField(blank=True, null=True)),
                ('pce_date_bt', models.DateTimeField(blank=True, null=True)),
                ('pce_date_web', models.DateTimeField(blank=True, null=True)),
                ('pce_webuser', models.CharField(blank=True, max_length=20, null=True)),
                ('pce_observ_web', models.TextField(blank=True, max_length=2000, null=True)),
                ('pce_num_bl', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pieces', to='bcweb.bordereau')),
            ],
            options={
                'ordering': ('-pce_num_bl', '-pce_num', 'pce_type_pdt'),
            },
        ),
        migrations.CreateModel(
            name='Command',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bc_num', models.CharField(blank=True, max_length=20, null=True)),
                ('iduser', models.CharField(blank=True, max_length=20, null=True)),
                ('command', models.CharField(blank=True, max_length=70, null=True)),
                ('application_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='command_applications', to='btapps.application')),
            ],
            options={
                'ordering': ('iduser',),
                'unique_together': {('iduser', 'application_id')},
            },
        ),
    ]
