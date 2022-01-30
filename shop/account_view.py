from django.http import JsonResponse, HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from django.middleware import csrf
from .my_decorators import cors_exempt
from .models import customer


# response.set_cookie("csrftoken", csrf.get_token(request))
# can be substitude by @ensure_csrf_cookie
# @ensure_csrf_cookie
@csrf_exempt
@cors_exempt
def login(request):
    def confirmIdentity(userEmail, userPassword):
        q = customer.objects.filter(email=userEmail)
        if q:
            if q.get().password == userPassword:
                return "passed"
            else:
                return "wrong password"
        else:
            return "user not found"

    if request.method == "POST" or request.method == "OPTIONS":
        res = {"status": "blocked"}
        token = request.COOKIES.get("token", "")
        if token != "" and customer.objects.filter(token=token):
            res["status"] = "passed"
            res = JsonResponse(res)
        else:
            email = request.POST.get("email", default=None)
            password = request.POST.get("password", default=None)
            status = confirmIdentity(email, password)
            res["status"] = status
            res = JsonResponse(res)
            if status == "passed":
                newToken = csrf.get_token(request)
                customer.objects.filter(email=email).update(token=newToken)
                res.set_cookie(
                    "token",
                    newToken,
                    max_age=86400,
                    samesite="None",
                    secure=True,
                )
        return res
    return HttpResponseNotFound()


@csrf_exempt
@cors_exempt
def logout(request):
    res = {"status": "failed"}
    token = request.COOKIES.get("token", "")
    q = customer.objects.filter(token=token)
    if token != "" and q:
        res["status"] = "succeeded"
        q.update(token="")
        res = JsonResponse(res)
        res.delete_cookie("token", samesite="None")
    else:
        res["status"] = "user not found"
        res = JsonResponse(res)
    return res


@csrf_exempt
@cors_exempt
def register(request):
    return HttpResponseNotFound()
