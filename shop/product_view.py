from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from .models import product

def CORS_exempt(func):
    def wrap(request, **args):
        res = func(request, **args)
        res["Access-Control-Allow-Origin"] = "*"
        return res
    return wrap

@CORS_exempt
def createProduct(request):
    pass

@CORS_exempt
def readSpecificProduct(request, productId):
    if request.method == 'GET':
        # print(request.user, request.user.is_authenticated)
        q = get_object_or_404(product, id=productId)
        res = {
                "data":
                {
                    "id":q.id,
                    "name":q.name,
                    "category":q.category.name,
                    "brand":q.brand.name,
                    "unit_price":q.unit_price,
                    "description":q.description,
                    "inventory":q.inventory,
                    "quantity_sold":q.quantity_sold
                }
            }
        res = JsonResponse(res)
        return res

@CORS_exempt
def readAllProducts(request):
    if request.method == 'GET':
        category = request.GET.get("category")
        if category and category != "all":
            q = product.objects.filter(category__name = category)
        else: q = product.objects.all()
        res = {"data":[{"id":i.id,
                        "name":i.name,
                        "category":i.category.name,
                        "brand":i.brand.name,
                        "unit_price":i.unit_price,
                        "description":i.description,
                        "inventory":i.inventory,
                        "quantity_sold":i.quantity_sold}
                       for i in q]}
        res = JsonResponse(res)
        return res