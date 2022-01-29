from django.http import JsonResponse, HttpResponseNotFound
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from .my_decorators import cors_exempt
from .models import customer


# response.set_cookie("csrftoken", csrf.get_token(request))
# can be substitude by @ensure_csrf_cookie
@csrf_exempt
@ensure_csrf_cookie
@cors_exempt
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
