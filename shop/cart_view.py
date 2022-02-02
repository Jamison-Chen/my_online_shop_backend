from django.http import (
    JsonResponse,
    HttpResponseNotFound,
)
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, cart_item, inventory, cart


@csrf_exempt
@cors_exempt
def index(request):
    if request.method == "POST":
        operation = request.POST.get("operation", default="")
        token = request.COOKIES.get("token", "")
        res = {}
        if operation == "create":
            cust = customer.objects.get(token=token)
            inv = inventory.objects.get(id=request.POST.get("inventory", default=""))
            quantity = request.POST.get("quantity", default="")
            crt = cart.objects.get(customer=cust)
            subTotal = inv.product.unit_price * quantity
            q = cart_item.objects.create(
                inventory=inv, cart=crt, quantity=quantity, subtotal_costs=subTotal
            )
            res["status"] = "succeeded"
        elif operation == "read":
            res["data"] = {}
            q = cart.objects.filter(customer__token=token)
            res["data"]["id"] = q.id
            res["data"]["total_costs"] = q.total_costs
            if q:
                res["data"]["cart_items"] = []
                for eachCartItem in q.products:
                    res["data"]["cart_items"].append(
                        {
                            "cart_item_id": eachCartItem.id,
                            "product_id": eachCartItem.inventory.product.id,
                            "product_name": eachCartItem.inventory.product.name,
                            "color": eachCartItem.inventory.color,
                            "size": eachCartItem.inventory.size,
                            "unit_price": eachCartItem.inventory.product.unit_price,
                            "quantity": eachCartItem.quantity,
                            "subtotal_costs": eachCartItem.subtotal_costs,
                        }
                    )
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
