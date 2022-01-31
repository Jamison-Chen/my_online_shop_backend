from django.contrib import admin
from .models import (
    category,
    brand,
    product,
    product_picture,
    customer,
    cart,
    cart_item,
    payment,
    favorite_item,
)

admin.site.register(category)
admin.site.register(brand)
admin.site.register(product)
admin.site.register(product_picture)
admin.site.register(customer)
admin.site.register(cart)
admin.site.register(cart_item)
admin.site.register(payment)
admin.site.register(favorite_item)
