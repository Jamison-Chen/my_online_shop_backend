from django.http import JsonResponse
from .models import product
from .my_decorators import cors_exempt


@cors_exempt
def search(request):
    if request.method == "GET":
        query = request.POST.get("query", default="").split(",")
        q = product.objects.all()
        # TODOS: implement search algorithm
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
