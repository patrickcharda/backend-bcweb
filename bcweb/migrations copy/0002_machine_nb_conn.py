# Generated by Django 4.0.2 on 2023-03-11 23:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bcweb', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='machine',
            name='nb_conn',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
