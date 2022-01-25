from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from .models import category
from django.db.models import Count


def CORS_exempt(func):
    def wrap(request, **args):
        res = func(request, **args)
        res["Access-Control-Allow-Origin"] = "*"
        return res

    return wrap


@CORS_exempt
def createCategory(request):
    pass


@CORS_exempt
def readSpecificCategory(request, categoryId):
    if request.method == "GET":
        q = get_object_or_404(category, id=categoryId)
        res = {"data": {"id": q.id, "name": q.name}}
        res = JsonResponse(res)
        return res


@CORS_exempt
def readAllCategoriesWithProducts(request):
    if request.method == "GET":
        q = category.objects.annotate(num_of_product=Count("product")).filter(
            num_of_product__gt=0
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
