from django.http import JsonResponse
from .models import product


def CORS_exempt(func):
    def wrap(request, **args):
        res = func(request, **args)
        res["Access-Control-Allow-Origin"] = "*"
        return res

    return wrap


@CORS_exempt
def search(request):
    if request.method == "GET":
        query = request.POST.get("query", default="").split(",")
        q = product.objects.all()
        res = {
            "data": [
                {
                    "id": each.id,
                    "name": each.name,
                    "category": each.category.name,
                    "brand": each.brand.name,
                    "unit_price": each.unit_price,
                    "description": each.description,
                    "inventory": each.inventory,
                    "quantity_sold": each.quantity_sold,
                }
                for each in q
            ]
        }
        res = JsonResponse(res)
        return res
