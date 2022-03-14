from django.http import HttpResponseServerError, JsonResponse, HttpResponseNotFound
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
                crt = cstmr.cart
            except:
                crt = cart.objects.create(customer=cstmr)
            inv = inventory.objects.get(id=request.POST.get("inventory_id", default=""))
            quantity = abs(int(request.POST.get("quantity", default="")))
            subTotal = inv.product.unit_price * quantity
            citm = crt.items.filter(inventory=inv)
            invIsSufficient = True
            if citm:
                newQuantity = citm[0].quantity + quantity
                if inv.inventory >= newQuantity:
                    citm.update(
                        quantity=newQuantity,
                        subtotal_costs=citm[0].subtotal_costs + subTotal,
                    )
                else:
                    invIsSufficient = False
            else:
                if inv.inventory >= quantity:
                    citm = cart_item.objects.create(
                        cart=crt,
                        inventory=inv,
                        quantity=quantity,
                        subtotal_costs=subTotal,
                    )
                else:
                    invIsSufficient = False
            if invIsSufficient:
                newTotalCosts = crt.items.all().aggregate(t=Sum("subtotal_costs"))["t"]
                crt.total_costs = newTotalCosts
                crt.freight = 5.0 if newTotalCosts < 100 else 0.0
                crt.save()
                res["status"] = "succeeded"
            else:
                res["status"] = "inventory not sufficient"
            res["data"] = {
                "total_costs": crt.total_costs,
                "freight": crt.freight,
                "count": crt.items.all().count(),
            }
        elif operation == "read":
            res["data"] = {"total_costs": 0, "freight": 0, "count": 0, "cart_items": []}
            crt = cart.objects.filter(customer__token=token)
            if crt:
                crt = crt[0]
                res["data"]["total_costs"] = crt.total_costs
                res["data"]["freight"] = crt.freight
                res["data"]["count"] = crt.items.all().count()
                for eachItem in crt.items.all():
                    res["data"]["cart_items"].append(
                        {
                            "cart_item_id": eachItem.id,
                            "product_id": eachItem.inventory.product.id,
                            "product_name": eachItem.inventory.product.name,
                            "color": eachItem.inventory.color.detail,
                            "size": eachItem.inventory.size.detail,
                            "unit_price": eachItem.inventory.product.unit_price,
                            "quantity": eachItem.quantity,
                            "subtotal_costs": eachItem.subtotal_costs,
                        }
                    )
        elif operation == "delete":
            crt = customer.objects.get(token=token).cart
            citm = crt.items.get(id=request.POST.get("cart_item_id")).delete()
            newTotalCosts = crt.items.all().aggregate(t=Sum("subtotal_costs"))["t"] or 0
            crt.total_costs = newTotalCosts
            crt.freight = 5.0 if newTotalCosts < 100 and newTotalCosts != 0 else 0.0
            crt.save()
            res["data"] = {
                "total_costs": crt.total_costs,
                "freight": crt.freight,
                "count": crt.items.all().count(),
            }
            res["status"] = "succeeded"
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()


@csrf_exempt
@cors_exempt
def proceedToCheckout(request):
    if request.method == "GET":
        try:
            token = request.COOKIES.get("token", "")
            crt = customer.objects.get(token=token).cart
            crt.ready_to_checkout = True
            crt.save()
            res = {"status": "succeeded"}
            res = JsonResponse(res)
            return res
        except:
            return HttpResponseServerError()
    else:
        return HttpResponseNotFound()
