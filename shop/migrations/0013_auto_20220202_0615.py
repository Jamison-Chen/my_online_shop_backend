# Generated by Django 3.2 on 2022-02-01 22:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0012_auto_20220202_0339'),
    ]

    operations = [
        migrations.AlterField(
            model_name='inventory',
            name='color',
            field=models.ForeignKey(limit_choices_to={'group': 'color'}, on_delete=django.db.models.deletion.DO_NOTHING, related_name='inventoty_of_this_color', to='shop.product_specification'),
        ),
        migrations.AlterField(
            model_name='inventory',
            name='size',
            field=models.ForeignKey(limit_choices_to={'group': 'size'}, on_delete=django.db.models.deletion.DO_NOTHING, related_name='inventoty_of_this_size', to='shop.product_specification'),
        ),
    ]
