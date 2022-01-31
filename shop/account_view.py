from email.policy import default
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
        res = {"status": ""}
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
    res = {"status": ""}
    token = request.COOKIES.get("token", "")
    q = customer.objects.filter(token=token)
    if token != "" and q:
        res["status"] = "succeeded"
        q.update(token=None)
        res = JsonResponse(res)
        res.delete_cookie("token", samesite="None")
    else:
        res["status"] = "user not found"
        res = JsonResponse(res)
    return res


@csrf_exempt
@cors_exempt
def register(request):
    if request.method == "POST" or request.method == "OPTIONS":
        res = {"status": ""}
        name = request.POST.get("name", default="")
        email = request.POST.get("email", default="")
        pwd = request.POST.get("password", default="")
        pwdCk = request.POST.get("password-check", default="")
        if name == "" or email == "" or pwd == "" or pwdCk == "":
            res["status"] = "info not sufficient"
            res = JsonResponse(res)
        elif len(name) > 32:
            res["status"] = "name too long"
            res = JsonResponse(res)
        elif len(name) < 3:
            res["status"] = "name too short"
            res = JsonResponse(res)
        elif customer.objects.filter(email=email):
            res["status"] = "duplicated email"
            res = JsonResponse(res)
        elif len(pwd) < 8:
            res["status"] = "password too simple"
            res = JsonResponse(res)
        elif pwd != pwdCk:
            res["status"] = "check your password"
            res = JsonResponse(res)
        else:
            phoneNum = request.POST.get("phone-number")
            bd = request.POST.get("date-of-birth")
            newToken = csrf.get_token(request)
            p = customer.objects.create(
                name=name,
                email=email,
                password=pwd,
                date_of_birth=bd,
                phone_number=phoneNum,
                token=newToken,
            )
            res["status"] = "passed"
            res = JsonResponse(res)
            res.set_cookie(
                "token",
                newToken,
                max_age=86400,
                samesite="None",
                secure=True,
            )
        return res
    else:
        return HttpResponseNotFound()
