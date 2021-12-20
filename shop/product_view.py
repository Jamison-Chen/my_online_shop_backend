from django.http import HttpResponse
from .models import product

def createProduct(request):
    if request:
        res = product.objects.all()
        print(res)
        return HttpResponse(res)