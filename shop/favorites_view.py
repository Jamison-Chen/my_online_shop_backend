from django.http import (
    HttpResponseNotAllowed,
    JsonResponse,
    HttpResponseNotFound,
)
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, favorite_item, product


@csrf_exempt
@cors_exempt
def index(request):
    if request.method == "POST":
        operation = request.POST.get("operation", default="")
        token = request.COOKIES.get("token", "")
        res = {}
        if operation == "create" or operation == "delete":
            c = customer.objects.get(token=token)
            p = product.objects.get(id=request.POST.get("product", default=""))
            q = favorite_item.objects.filter(customer=c, product=p)
            if len(q) > 0 and operation == "delete":
                q = favorite_item.objects.get(customer=c, product=p)
                q.delete()
                res["status"] = "succeeded"
            elif len(q) == 0 and operation == "create":
                q = favorite_item.objects.create(customer=c, product=p)
                res["status"] = "succeeded"
            else:
                return HttpResponseNotAllowed()
        elif operation == "read":
            res["data"] = []
            q = favorite_item.objects.filter(customer__token=token)
            for each in q:
                p = each.product
                res["data"].append(
                    {
                        "id": p.id,
                        "name": p.name,
                        "category": p.category.name,
                        "brand": p.brand.name,
                        "unit_price": p.unit_price,
                        "description": p.description,
                    }
                )
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
