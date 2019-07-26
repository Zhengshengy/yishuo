from django.shortcuts import render,redirect,HttpResponse
from django.views import View
import pymysql
from django import forms
from .page import *
import math
import random
import time
import os
db = pymysql.connect("localhost","root","root",database="yishuo",cursorclass=pymysql.cursors.DictCursor)

class rotate(View):
    def get(self,request):
        page = request.GET.get("page") if request.GET.get("page") else 0
        page = int(page)
        num = 4
        cursor = db.cursor()
        sql = "select rid,raddr,rcid,rfid,uname from rotate LEFT JOIN `user` on rotate.rcid = `user`.uid limit %s,%s"
        cursor.execute(sql,(page*num,num))
        result = cursor.fetchall()
        sqls = "select count(*) as t from rotate"
        cursor.execute(sqls)
        nums = cursor.fetchone()
        nums = nums["t"]
        nums = math.ceil(nums/num)
        sql1 = "select * from flag"
        cursor.execute(sql1)
        flagInfo = cursor.fetchall()
        return render(request, "rotate/rotate.html", {"data": result,"page":getpages(nums,page,"/rotate"),"flagInfo":flagInfo})
class mycheck(forms.Form):
    raddr = forms.FileField(required=True,error_messages={"required": "必须选择文件"})
class rotateadd(View):
    def get(self,request):
        cursor = db.cursor()
        sql = "select * from user"
        cursor.execute(sql)
        result = cursor.fetchall()
        sqls = "select * from flag"
        cursor.execute(sqls)
        flagInfo = cursor.fetchall()
        return render(request,"rotate/rotateadd.html",{"data":result,"flagInfo":flagInfo})
    def post(self,request):
        obj = mycheck(request.POST,request.FILES)
        if obj.is_valid():
            rcid = request.POST.get("uid")
            rfid = request.POST.get("rfid")
            file = request.FILES["raddr"]
            filepath = "static/upload/"+str(int(time.time()*1000))+str(random.randint(1,1000))+".jpg"
            obj = open(filepath,"wb")
            for item in file.chunks():
                obj.write(item)
            obj.close()
            cursor = db.cursor()
            sql = "insert into rotate(raddr,rfid,rcid) VALUES (%s,%s,%s)"
            localhost="http://localhost:8000/"
            filepath=localhost+filepath
            cursor.execute(sql,[filepath,rfid,rcid])
            db.commit()
            return redirect("/rotate/")

class rotatedel(View):
    def get(self,request):
        cursor = db.cursor()
        rid = request.GET.get("rid")
        filepath = "select * from rotate where rid=%s"
        cursor.execute(filepath,[rid])
        result = cursor.fetchone()
        raddr1 = result["raddr"]
        a,b = os.path.split(raddr1)
        urlmode = os.getcwd()
        urlmode += "\\static\\upload\\"
        urlmode += b
        os.remove(urlmode)
        sql = "delete from rotate where rid=%s"
        cursor.execute(sql,[rid])
        db.commit()
        return redirect("/rotate/")

class rotateedit(View):
    def get(self,request):
        cursor = db.cursor()
        rid = request.GET.get("rid")
        sql = "select * from rotate where rid=%s"
        cursor.execute(sql,[rid])
        result = cursor.fetchone()
        sqls = "select * from user"
        cursor.execute(sqls)
        rotateInfo = cursor.fetchall()
        sql1 = "select * from flag"
        cursor.execute(sql1)
        flagInfo = cursor.fetchall()
        return render(request,"rotate/rotateedit.html",{"data":result,"rotateInfo":rotateInfo,"flagInfo":flagInfo})
    def post(self,request):
        obj = mycheck(request.POST, request.FILES)
        if obj.is_valid():
            rid = request.POST.get("rid")
            rcid = request.POST.get("rcid")
            rfid = request.POST.get("rfid")
            file = request.FILES["raddr"]
            filepath = "static/upload/" + str(int(time.time() * 1000)) + str(random.randint(1, 1000)) + ".jpg"
            obj = open(filepath, "wb")
            for item in file.chunks():
                obj.write(item)
            obj.close()
            cursor = db.cursor()
            sql = "update rotate set raddr=%s,rcid=%s,rfid=%s where rid=%s"
            localhost = "http://localhost:8000/"
            filepath = localhost + filepath
            cursor.execute(sql,[filepath,rcid,rfid,rid])
            db.commit()
            return redirect("/rotate/")

