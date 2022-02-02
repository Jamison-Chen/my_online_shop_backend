# Generated by Django 3.2 on 2022-01-31 19:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0009_customer_token'),
    ]

    operations = [
        migrations.CreateModel(
            name='favorite_item',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='shop.customer')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='shop.product')),
            ],
            options={
                'unique_together': {('customer', 'product')},
            },
        ),
    ]