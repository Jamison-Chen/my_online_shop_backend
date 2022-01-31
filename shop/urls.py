from django.urls import path, include

from . import product_view
from . import category_view
from . import search_result_view
from . import account_view
from . import item_view

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
    path("login", account_view.login),
    path("logout", account_view.logout),
    path("register", account_view.register),
    path("favorites", item_view.favorites),
]
