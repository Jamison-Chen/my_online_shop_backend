from django.contrib import admin
from .models import (
    category,
    brand,
    product,
    product_specification,
    product_picture,
    inventory,
    customer,
    cart,
    cart_item,
    order,
    order_item,
    favorite_item,
)

admin.site.register(category)
admin.site.register(brand)
admin.site.register(product)
admin.site.register(product_specification)
admin.site.register(product_picture)
admin.site.register(inventory)
admin.site.register(customer)
admin.site.register(cart)
admin.site.register(cart_item)
admin.site.register(order)
admin.site.register(order_item)
admin.site.register(favorite_item)
