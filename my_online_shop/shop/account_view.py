from django.conf import settings
from django.http import HttpResponseBadRequest, JsonResponse, HttpResponseNotFound
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from django.middleware import csrf
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from django.core.mail import EmailMessage
from .utils import emailVerifyTokenGenerator, EmailThreading, EMAIL_SEND_MESSAGE
from .my_decorators import cors_exempt
from .models import customer


def validateNewUserInfo(
    email=None, userName=None, oldPassword=None, newPassword=None, newPasswordCheck=None
):
    if email and userName and newPassword and newPasswordCheck:
        pass
    elif True:
        pass


def confirmIdentity(userEmail, userPassword):
    try:
        q = customer.objects.get(email=userEmail)
        if q.password == userPassword:
            if q.is_email_verified:
                return "passed"
            return "email not verified"
        return "wrong password"
    except:
        return "user not found"


def sendVerificationEmail(request, cstmr):
    body = render_to_string(
        "shop/verifyEmail.html",
        {
            "customer": cstmr,
            "domain": get_current_site(request),
            "cid": urlsafe_base64_encode(force_bytes(cstmr.id)),
            "token": emailVerifyTokenGenerator.make_token(user=cstmr),
        },
    )
    email = EmailMessage(
        subject="Activate Your Account",
        body=body,
        from_email=settings.DEFAULT_FROM_EMAIL,
        to=[cstmr.email],
    )
    EmailThreading(email).start()


# response.set_cookie("csrftoken", csrf.get_token(request))
# can be substitude by @ensure_csrf_cookie
# @ensure_csrf_cookie
@csrf_exempt
@cors_exempt
def login(request):
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
                    max_age=settings.CSRF_COOKIE_AGE,
                    samesite=settings.CSRF_COOKIE_SAMESITE,
                    secure=settings.CSRF_COOKIE_SECURE,
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
        existingAccount = customer.objects.filter(email=email)
        if name == "" or email == "" or pwd == "" or pwdCk == "":
            res["status"] = "info not sufficient"
            res = JsonResponse(res)
        elif len(name) > 32:
            res["status"] = "name too long"
            res = JsonResponse(res)
        elif len(name) < 2:
            res["status"] = "name too short"
            res = JsonResponse(res)
        elif existingAccount and existingAccount.get().is_email_verified:
            res["status"] = "duplicate email"
            res = JsonResponse(res)
        elif len(pwd) < 8:
            res["status"] = "password too simple"
            res = JsonResponse(res)
        elif pwd != pwdCk:
            res["status"] = "check your password"
            res = JsonResponse(res)
        else:
            if existingAccount and not (c := existingAccount.get()).is_email_verified:
                c.delete()
            phoneNum = request.POST.get("phone_number")
            bd = request.POST.get("date_of_birth")
            newToken = csrf.get_token(request)
            c = customer.objects.create(
                name=name,
                email=email,
                password=pwd,
                date_of_birth=bd,
                phone_number=phoneNum,
                token=newToken,
            )
            sendVerificationEmail(request, c)
            res["status"] = "passed"
            res["message"] = EMAIL_SEND_MESSAGE
            res = JsonResponse(res)
        return res
    else:
        return HttpResponseNotFound()


@csrf_exempt
@cors_exempt
def resendVerificationEmail(request):
    if request.method == "POST":
        res = {"status": "", "message": ""}
        email = request.POST.get("email", default=None)
        try:
            c = customer.objects.get(email=email)
            sendVerificationEmail(request, c)
            res["status"] = "succeeded"
            res["message"] = EMAIL_SEND_MESSAGE
            res = JsonResponse(res)
            return res
        except:
            return HttpResponseNotFound()
    else:
        return HttpResponseBadRequest()


@csrf_exempt
@cors_exempt
def editProfile(request):
    res = {"status": "", "message": ""}
    token = request.COOKIES.get("token", "")
    q = customer.objects.filter(token=token)
    if token != "" and len(q) == 1:
        newName = request.POST.get("name", default="")
        newEmail = request.POST.get("email", default="")
        newPhoneNumber = request.POST.get("phone_number")
        newGender = request.POST.get("gender")
        newDateOfBirth = request.POST.get("date_of_birth")
        if newName == "" or newEmail == "":
            res["status"] = "info not sufficient"
        elif len(newName) > 32:
            res["status"] = "name too long"
        elif len(newName) < 2:
            res["status"] = "name too short"
        elif q.get().email != newEmail and customer.objects.filter(email=newEmail):
            res["status"] = "duplicate email"
        else:
            if q.get().email != newEmail:
                q.update(
                    name=newName,
                    email=newEmail,
                    phone_number=newPhoneNumber,
                    gender=newGender,
                    date_of_birth=newDateOfBirth,
                    is_email_verified=False,
                )
                sendVerificationEmail(request, q.get())
                res["status"] = "email not verified"
                res["message"] = EMAIL_SEND_MESSAGE
            else:
                q.update(
                    name=newName,
                    phone_number=newPhoneNumber,
                    gender=newGender,
                    date_of_birth=newDateOfBirth,
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


def activateAccount(request, cidb64, token):
    cid = force_text(urlsafe_base64_decode(cidb64))
    try:
        c = customer.objects.get(id=cid)
        if emailVerifyTokenGenerator.check_token(c, token):
            c.is_email_verified = True
            c.save()
            return render(request, "shop/verificationSucceed.html")
        return HttpResponseNotFound()
    except:
        return HttpResponseNotFound()
