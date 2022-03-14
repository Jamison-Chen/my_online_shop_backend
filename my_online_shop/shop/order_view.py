from django.http import JsonResponse, HttpResponseNotFound, HttpResponseServerError
from django.views.decorators.csrf import csrf_exempt
from .my_decorators import cors_exempt
from .models import customer, order, order_item


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
        if (not crt.ready_to_checkout) or crt.items.all().count() == 0:
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
            cstmr.cart.delete()  # delete cart after successfully creating on order
            res["status"] = "succeeded"
        elif operation == "read":
            res["data"] = []
            odrs = order.objects.filter(customer__token=token).order_by("ordered_date")
            for eachOrder in odrs:
                orderData = {
                    "id": str(eachOrder.id),
                    "name_of_picker": eachOrder.name_of_picker,
                    "phone_number_of_picker": eachOrder.phone_number_of_picker,
                    "payment_method": eachOrder.type,
                    "address": eachOrder.address,
                    "final_cost": eachOrder.final_costs,
                    "ordered_date": eachOrder.ordered_date,
                    "paid_date": eachOrder.paid_date,
                    "shipped_date": eachOrder.shipped_date,
                    "arrived_date": eachOrder.arrived_date,
                    "picked_up_date": eachOrder.picked_up_date,
                    "items": [],
                }
                for eachItem in eachOrder.items.all():
                    orderData["items"].append(
                        {
                            "product_name": eachItem.inventory.product.name,
                            "product_specification": "color:{}/size:{}".format(
                                eachItem.inventory.color.detail,
                                eachItem.inventory.size.detail,
                            ),
                            "quantity": eachItem.quantity,
                            "subtotal_costs": eachItem.subtotal_costs,
                        }
                    )
                res["data"].append(orderData)
        elif operation == "delete":
            pass
        else:
            return HttpResponseNotFound()
        res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()
