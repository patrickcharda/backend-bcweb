from django.db import models

# Create your models here.


class Application(models.Model):
    name = models.CharField(primary_key=True, max_length=20)  # CLE PRIMAIRE
    nb_conn_max = models.IntegerField(blank=True, null=True, default=1)
    version = models.CharField(max_length=25, blank=True, null=True)


class Droit(models.Model):
    application = models.ForeignKey(
        Application, related_name="droit_applications", on_delete=models.CASCADE
    )
    utilisateur = models.CharField(max_length=50, blank=True, null=True)
    client = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        unique_together = (
            "application",
            "utilisateur",
        )


class Session(models.Model):
    utilisateur = models.CharField(max_length=50, blank=True, null=True)
    application = models.ForeignKey(
        Application, related_name="session_applications", on_delete=models.CASCADE
    )
    token = models.TextField(max_length=700, blank=True, null=True)
    fingerprint = models.CharField(max_length=100, blank=True, null=True)
    sessionid = models.TextField(max_length=350, blank=True, null=True)

    class Meta:
        unique_together = ("application", "utilisateur", "token", "fingerprint")


class Code(models.Model):
    # codes erreurs
    code = models.CharField(primary_key=True, max_length=20)
    description = models.CharField(max_length=254, blank=True, null=True)

class Reset(models.Model):
    # codes autorisant- le reset de Wib
    reset_key = models.CharField(primary_key=True, max_length=20)
    used = models.BooleanField(default=False, blank=True, null=True)