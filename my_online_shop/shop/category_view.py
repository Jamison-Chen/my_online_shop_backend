from django.http import JsonResponse
from .models import category
from django.db.models import Count
from .my_decorators import cors_exempt


@cors_exempt
def readAllCategoriesWithProducts(request):
    if request.method == "GET":
        q = (
            category.objects.annotate(num_of_product=Count("product"))
            .filter(num_of_product__gt=0)
            .order_by("name")
        )
        res = {
            "data": [
                {
                    "id": each.id,
                    "name": each.name,
                }
                for each in q
            ]
        }
        res = JsonResponse(res)
        return res
