# Generated by Django 3.2 on 2022-02-02 22:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0015_auto_20220203_0536'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cart',
            name='total_costs',
            field=models.FloatField(default=0.0),
        ),
    ]