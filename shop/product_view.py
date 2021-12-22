from django.http import HttpResponse
from .models import product

def createProduct(request):
    if request:
        res = product.objects.filter(brand__name = 'Apple').filter(brand__name = "Roots")
        return HttpResponse(res)