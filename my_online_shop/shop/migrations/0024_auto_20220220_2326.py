# Generated by Django 3.2 on 2022-02-20 15:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0023_alter_order_customer'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cart_item',
            name='inventory',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.inventory'),
        ),
        migrations.AlterField(
            model_name='favorite_item',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.customer'),
        ),
        migrations.AlterField(
            model_name='favorite_item',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.product'),
        ),
        migrations.AlterField(
            model_name='order_item',
            name='inventory',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.inventory'),
        ),
    ]