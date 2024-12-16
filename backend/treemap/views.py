from django.shortcuts import render
from django.http import HttpResponse

def getTreeMap(request):
    return render(request, 'tree-map.html')