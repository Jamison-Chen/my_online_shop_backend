from django.urls import path, include

from . import product_view
from . import category_view
from . import search_result_view
from . import account_view
from . import favorites_view
from . import cart_view
from . import order_view

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
    path(
        "activate-account/<cidb64>/<token>",
        account_view.activateAccount,
        name="activate",
    ),
    path("resend-verification-email", account_view.resendVerificationEmail),
    path("edit-profile", account_view.editProfile),
    path("change-password", account_view.changePassword),
    path("favorites", favorites_view.index),
    path(
        "cart/",
        include(
            [
                path("", cart_view.index),
                path("proceed_to_checkout", cart_view.proceedToCheckout),
            ]
        ),
    ),
    path("order", order_view.index),
]
