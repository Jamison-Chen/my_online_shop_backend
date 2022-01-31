from django.http import HttpResponseNotAllowed, JsonResponse, HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, favorite_item, product


@csrf_exempt
@cors_exempt
def favorites(request):
    if request.method == "POST":
        mode = request.POST.get("operation", default="")
        token = request.COOKIES.get("token", "")
        res = {}
        if mode == "create" or mode == "delete":
            pid = request.POST.get("product", default="")
            c = customer.objects.get(token=token)
            p = product.objects.get(id=pid)
            q = favorite_item.objects.filter(customer=c, product=p)
            if len(q) > 0 and mode == "delete":
                q = favorite_item.objects.get(customer=c, product=p)
                q.delete()
                res["status"] = "succeeded"
            elif len(q) == 0 and mode == "create":
                q = favorite_item.objects.create(customer=c, product=p)
                res["status"] = "succeeded"
            else:
                return HttpResponseNotAllowed()
        elif mode == "read":
            res["data"] = []
            q = favorite_item.objects.filter(customer__token=token)
            for each in q:
                res["data"].append(each.product.id)
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
