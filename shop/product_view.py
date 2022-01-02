from django.http import HttpResponse
from .models import category, product
import json

def createProduct(request):
    pass

def readSpecificProduct(request, productId):
    if request.method == 'GET':
        # print(request.user, request.user.is_authenticated)
        q = product.objects.get(id=productId)
        res = [{"name":q.name, "category":q.category.name}]
        return HttpResponse(json.dumps(res))

def readAllProduct(request):
    if request.method == 'GET':
        q = product.objects.all()
        res = [{"name":i.name, "category":i.category.name} for i in q]
        return HttpResponse(json.dumps(res))