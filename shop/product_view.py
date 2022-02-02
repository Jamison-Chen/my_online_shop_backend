from django.http import HttpResponseNotFound, JsonResponse
from django.shortcuts import get_object_or_404
from .models import product, inventory
from .my_decorators import cors_exempt


@cors_exempt
def readSpecificProduct(request, productId):
    if request.method == "GET":
        q = get_object_or_404(product, id=productId)
        res = {
            "data": {
                "id": q.id,
                "name": q.name,
                "category": q.category.name,
                "brand": q.brand.name,
                "unit_price": q.unit_price,
                "description": q.description,
                "inventory": {},
            }
        }
        q = inventory.objects.filter(product__id=productId)
        for each in q:
            res["data"]["inventory"][
                each.color.detail + "_" + each.size.detail
            ] = each.inventory
        res = JsonResponse(res)
        return res
    return HttpResponseNotFound()


@cors_exempt
def readAllProducts(request):
    if request.method == "GET":
        category = request.GET.get("category")
        if category and category != "all":
            q = product.objects.filter(category__name=category)
        else:
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
                }
                for each in q
            ]
        }
        res = JsonResponse(res)
        return res
    return HttpResponseNotFound()
