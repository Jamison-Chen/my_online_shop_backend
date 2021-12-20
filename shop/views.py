# from django.shortcuts import render
from django.http import HttpResponse
from . import product_view

def product(request):
    return product_view.createProduct(request)
