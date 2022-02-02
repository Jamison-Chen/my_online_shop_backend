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
            crt = cart.objects.filter(customer=cust)
            if len(crt) != 1:
                crt = cart.objects.create(customer=cust)
            else:
                crt = crt[0]
            inv = inventory.objects.get(id=request.POST.get("inventory_id", default=""))
            quantity = int(request.POST.get("quantity", default=""))
            subTotal = inv.product.unit_price * quantity
            citm = cart_item.objects.filter(cart=crt, inventory=inv)
            if citm:
                citm.update(
                    quantity=citm[0].quantity + quantity,
                    subtotal_costs=citm[0].subtotal_costs + subTotal,
                )
            else:
                citm = cart_item.objects.create(
                    cart=crt, inventory=inv, quantity=quantity, subtotal_costs=subTotal
                )
            cart.objects.filter(customer=cust).update(
                total_costs=crt.total_costs + subTotal
            )
            res["status"] = "succeeded"
        elif operation == "read":
            res["data"] = {}
            crt = cart.objects.filter(customer__token=token)
            res["data"]["id"] = crt.id
            res["data"]["total_costs"] = crt.total_costs
            if crt:
                res["data"]["cart_items"] = []
                for eachCartItem in crt.products:
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
