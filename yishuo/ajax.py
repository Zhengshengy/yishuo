from django.shortcuts import render,redirect,HttpResponse
from django.views import View
from .MySQL import *
import json
class addLY(View):
    def get(self,req):
        pass
    def post(self,req):
        name=req.POST.get("name")
        time = req.POST.get("time")
        con = req.POST.get("con")
        flag = req.POST.get("flag")
        db = Mysql()

        return HttpResponse(json.dumps("ok"))