# Generated by Django 3.2 on 2022-01-30 07:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0008_auto_20220127_2011'),
    ]

    operations = [
        migrations.AddField(
            model_name='customer',
            name='token',
            field=models.CharField(blank=True, max_length=256, null=True, unique=True),
        ),
    ]
