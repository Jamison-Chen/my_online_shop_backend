from django.urls import path, include
from . import product_view

urlpatterns = [
    path("product/",
        include([
            path("all", product_view.readAllProducts),
            path("all/", product_view.readAllProducts),
            path("<str:productId>", product_view.readSpecificProduct),
            path("<str:productId>/", product_view.readSpecificProduct),
        ])
    ),
]
