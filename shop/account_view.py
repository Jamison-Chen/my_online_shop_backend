from django.http import HttpResponseRedirect, JsonResponse, HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from .models import customer


def CORS_exempt(func):
    def wrap(request, **args):
        res = func(request, **args)
        res["Access-Control-Allow-Credentials"] = "true"
        res["Access-Control-Allow-Methods"] = "*"
        res["Access-Control-Allow-Origin"] = request.headers.get("Origin")
        return res

    return wrap


# response.set_cookie("csrftoken", csrf.get_token(request))
# can be substitude by @ensure_csrf_cookie
@csrf_exempt
@ensure_csrf_cookie
@CORS_exempt
def login(request):
    def confirmIdentity():
        # TODOS: Implement the identity comfirmation logic.
        return "passed"

    if request.method == "POST" or request.method == "OPTIONS":
        res = {"status": "blocked"}
        if request.COOKIES.get("csrftoken"):
            res["status"] = "passed"
        else:
            status = confirmIdentity()
            res["status"] = status
            if status == "passed":
                # TODOS: Store the new csrf token into the customer table as "login session"
                pass
        return JsonResponse(res)
    return HttpResponseNotFound()
