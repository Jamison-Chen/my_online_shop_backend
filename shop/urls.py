from django.urls import path
from . import product_view

urlpatterns = [
    path("product/all", product_view.readAllProduct),
    path("product/all/", product_view.readAllProduct),
    path("product/<int:productId>", product_view.readSpecificProduct),
    path("product/<int:productId>/", product_view.readSpecificProduct),
]
