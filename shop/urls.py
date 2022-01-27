from django.urls import path, include

from . import product_view
from . import category_view
from . import search_result_view
from . import views

urlpatterns = [
    path(
        "product/",
        include(
            [
                path("all", product_view.readAllProducts),
                path("<str:productId>", product_view.readSpecificProduct),
            ]
        ),
    ),
    path(
        "category/",
        include(
            [
                path("all", category_view.readAllCategoriesWithProducts),
            ]
        ),
    ),
    path("search", search_result_view.search),
    path("login", views.index),
]
