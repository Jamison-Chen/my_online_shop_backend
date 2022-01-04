from django.http import JsonResponse
from .models import product

def createProduct(request):
    pass

def readSpecificProduct(request, productId):
    if request.method == 'GET':
        # print(request.user, request.user.is_authenticated)
        try:
            q = product.objects.get(id=productId)
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
        except Exception as e:
            res = {"error-message":str(e)}
        res = JsonResponse(res)
        res["Access-Control-Allow-Origin"] = "*"
        return res

def readAllProduct(request):
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
        res["Access-Control-Allow-Origin"] = "*"
        return res