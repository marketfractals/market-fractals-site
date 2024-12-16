from django.shortcuts import render
from django.http import HttpResponse

def getTreeMap(request):
    x = 1
    return render(request, 'tree-map.html')