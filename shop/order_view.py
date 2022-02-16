from django.http import JsonResponse, HttpResponseNotFound, HttpResponseServerError
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, order, inventory, order_item, cart_item
from django.db.models import Sum


@csrf_exempt
@cors_exempt
def index(request):
    try:
        token = request.COOKIES.get("token", "")
        cstmr = customer.objects.get(token=token)
    except:
        return HttpResponseServerError()
    if request.method == "GET":
        try:
            crt = cstmr.cart
        except:
            return HttpResponseServerError()
        if not crt.ready_to_checkout:
            return HttpResponseNotFound()
        return JsonResponse({"status": "succeeded"})
    elif request.method == "POST":
        operation = request.POST.get("operation", default="")
        res = {}
        if operation == "create":
            name = request.POST.get("name_of_picker", default="")
            phone = request.POST.get("phone_number_of_picker", default="")
            address = request.POST.get("address", default="")
            if not name or not phone:
                return JsonResponse({"status": "Please fill up the receiver's form."})
            elif not address:
                return JsonResponse(
                    {
                        "status": "Please choose a store to pickup or fill up the address."
                    }
                )
            odrs = order.objects.create(
                customer=cstmr,
                name_of_picker=name,
                phone_number_of_picker=phone,
                type=request.POST.get("payment_method"),
                address=address,
                final_costs=cstmr.cart.total_costs + cstmr.cart.freight,
            )
            for each in cstmr.cart.items.all():
                order_item.objects.create(
                    inventory=each.inventory,
                    order=odrs,
                    quantity=each.quantity,
                    subtotal_costs=each.subtotal_costs,
                )
                each.inventory.inventory -= each.quantity
                each.inventory.quantity_sold += each.quantity
                each.inventory.save()
            cstmr.cart.delete()
            res["status"] = "succeeded"
        elif operation == "read":
            res["data"] = {
                "status": "processing",
                "total_costs": 0,
                "freight": 0,
                "order_items": [],
            }
            res["status"] = "succeeded"
            # crt = cart.objects.filter(customer__token=token)
            # if crt:
            #     crt = crt[0]
            #     res["data"]["total_costs"] = crt.total_costs
            #     res["data"]["freight"] = crt.freight
            #     res["data"]["count"] = crt.items.all().count()
            #     for eachItem in crt.items.all():
            #         res["data"]["cart_items"].append(
            #             {
            #                 "cart_item_id": eachItem.id,
            #                 "product_id": eachItem.inventory.product.id,
            #                 "product_name": eachItem.inventory.product.name,
            #                 "color": eachItem.inventory.color.detail,
            #                 "size": eachItem.inventory.size.detail,
            #                 "unit_price": eachItem.inventory.product.unit_price,
            #                 "quantity": eachItem.quantity,
            #                 "subtotal_costs": eachItem.subtotal_costs,
            #             }
            #         )
        elif operation == "delete":
            # crt = customer.objects.get(token=token).cart
            # citm = crt.items.get(id=request.POST.get("cart_item_id")).delete()
            # newTotalCosts = crt.items.all().aggregate(t=Sum("subtotal_costs"))["t"] or 0
            # crt.total_costs = newTotalCosts
            # crt.freight = 60 if newTotalCosts < 100 and newTotalCosts != 0 else 0
            # crt.save()
            # res["data"] = {
            #     "total_costs": crt.total_costs,
            #     "freight": crt.freight,
            #     "count": crt.items.all().count(),
            # }
            res["status"] = "succeeded"
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
