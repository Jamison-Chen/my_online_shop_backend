from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt


def CORS_exempt(func):
    def wrap(request, **args):
        res = func(request, **args)
        res["Access-Control-Allow-Origin"] = "*"
        return res

    return wrap


@csrf_exempt
@CORS_exempt
def index(request):
    # if request.method == "POST":
    #     return HttpResponse("hi")
    # return "no"
    print(request.POST.get("email"))
    return HttpResponse("hi")
