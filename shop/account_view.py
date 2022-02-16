from datetime import date
from django.http import HttpResponseBadRequest, JsonResponse, HttpResponseNotFound
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
        res = {"status": "", "data": {}}
        token = request.COOKIES.get("token", "")
        q = customer.objects.filter(token=token)
        if token != "" and len(q) == 1:
            res["status"] = "passed"
            q = q.get()
            res["data"]["name"] = q.name
            res["data"]["email"] = q.email
            res["data"]["phone_number"] = q.phone_number
            res["data"]["gender"] = q.gender
            res["data"]["date_of_birth"] = q.date_of_birth
            res["data"]["account_type"] = q.account_type
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
        pwdCk = request.POST.get("password_check", default="")
        if name == "" or email == "" or pwd == "" or pwdCk == "":
            res["status"] = "info not sufficient"
            res = JsonResponse(res)
        elif len(name) > 32:
            res["status"] = "name too long"
            res = JsonResponse(res)
        elif len(name) < 2:
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
            phoneNum = request.POST.get("phone_number")
            bd = request.POST.get("date_of_birth")
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


@csrf_exempt
@cors_exempt
def editProfile(request):
    res = {"status": ""}
    token = request.COOKIES.get("token", "")
    q = customer.objects.filter(token=token)
    if token != "" and len(q) == 1:
        name = request.POST.get("name", default="")
        email = request.POST.get("email", default="")
        phoneNumber = request.POST.get("phone_number")
        gender = request.POST.get("gender")
        dateOfBirth = request.POST.get("date_of_birth")
        if name == "" or email == "":
            res["status"] = "info not sufficient"
        elif len(name) > 32:
            res["status"] = "name too long"
        elif len(name) < 2:
            res["status"] = "name too short"
        elif customer.objects.filter(email=email) and q.get().email != email:
            res["status"] = "duplicated email"
        else:
            q.update(
                name=name,
                email=email,
                phone_number=phoneNumber,
                gender=gender,
                date_of_birth=dateOfBirth,
            )
            res["status"] = "succeeded"
    else:
        return HttpResponseBadRequest()
    res = JsonResponse(res)
    return res


@csrf_exempt
@cors_exempt
def changePassword(request):
    res = {"status": ""}
    token = request.COOKIES.get("token", "")
    q = customer.objects.filter(token=token)
    currentPassword = request.POST.get("current_password", default="")
    if token != "" and len(q) == 1:
        q = q.get()
        if q.password == currentPassword:
            newPassword = request.POST.get("new_password", default="")
            newPwdCheck = request.POST.get("new_password_check", default="")
            if len(newPassword) < 8:
                res["status"] = "password too simple"
            elif newPassword != newPwdCheck:
                res["status"] = "check your password"
            else:
                q.password = newPassword
                q.save()
                res["status"] = "succeeded"
        else:
            res["status"] = "wrong password"
    else:
        return HttpResponseBadRequest()
    res = JsonResponse(res)
    return res
