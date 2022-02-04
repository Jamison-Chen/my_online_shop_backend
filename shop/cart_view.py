from django.http import (
    JsonResponse,
    HttpResponseNotFound,
)
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, cart_item, inventory, cart
from django.db.models import Sum


@csrf_exempt
@cors_exempt
def index(request):
    if request.method == "POST":
        operation = request.POST.get("operation", default="")
        token = request.COOKIES.get("token", "")
        res = {}
        if operation == "create":
            cstmr = customer.objects.get(token=token)
            try:
                crt = cart.objects.get(customer=cstmr)
            except:
                crt = cart.objects.create(customer=cstmr)
            inv = inventory.objects.get(id=request.POST.get("inventory_id", default=""))
            quantity = int(request.POST.get("quantity", default=""))

            # TODOS: check if the inventory quantity is sufficient.
            # If yes, update the inventory quantity;
            # if no, report "failed" status to the front end.
            subTotal = inv.product.unit_price * quantity
            citm = crt.items.filter(inventory=inv)
            if citm:
                citm.update(
                    quantity=citm[0].quantity + quantity,
                    subtotal_costs=citm[0].subtotal_costs + subTotal,
                )
            else:
                citm = cart_item.objects.create(
                    cart=crt, inventory=inv, quantity=quantity, subtotal_costs=subTotal
                )

            # re-fetch the cart due to the change of its many-to-many field
            crt = cart.objects.filter(customer=cstmr)
            newTotalCosts = crt[0].items.all().aggregate(t=Sum("subtotal_costs"))["t"]
            crt.update(
                total_costs=newTotalCosts, freight=60 if newTotalCosts < 100 else 0
            )
            res["data"] = {"total_costs": crt[0].total_costs, "freight": crt[0].freight}
            res["status"] = "succeeded"
        elif operation == "read":
            res["data"] = {"total_costs": 0, "cart_items": []}
            crt = cart.objects.filter(customer__token=token)
            if crt:
                crt = crt[0]
                res["data"]["total_costs"] = crt.total_costs
                res["data"]["freight"] = crt.freight
                for eachCartItem in crt.items.all():
                    res["data"]["cart_items"].append(
                        {
                            "cart_item_id": eachCartItem.id,
                            "product_id": eachCartItem.inventory.product.id,
                            "product_name": eachCartItem.inventory.product.name,
                            "color": eachCartItem.inventory.color.detail,
                            "size": eachCartItem.inventory.size.detail,
                            "unit_price": eachCartItem.inventory.product.unit_price,
                            "quantity": eachCartItem.quantity,
                            "subtotal_costs": eachCartItem.subtotal_costs,
                        }
                    )
        elif operation == "delete":
            cstmr = customer.objects.get(token=token)
            crt = cart.objects.get(customer=cstmr)
            citm = crt.items.get(id=request.POST.get("cart_item_id")).delete()

            # re-fetch the cart due to the change of its many-to-many field
            crt = cart.objects.filter(customer=cstmr)
            newTotalCosts = crt[0].items.all().aggregate(t=Sum("subtotal_costs"))["t"]
            crt.update(
                total_costs=newTotalCosts, freight=60 if newTotalCosts < 100 else 0
            )
            res["data"] = {"total_costs": crt[0].total_costs, "freight": crt[0].freight}
            res["status"] = "succeeded"
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
