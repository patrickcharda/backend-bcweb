# Generated by Django 4.0.2 on 2023-03-13 08:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('bcweb', '0003_alter_machine_nb_conn'),
    ]

    operations = [
        migrations.AlterField(
            model_name='machine',
            name='nb_conn',
            field=models.IntegerField(blank=True, default=1, null=True),
        ),
    ]
