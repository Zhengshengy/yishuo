from django.shortcuts import render,redirect,HttpResponse
from django.views import View
import pymysql
import math
from .page import *
db = pymysql.connect("localhost","root","root",database="yishuo",cursorclass=pymysql.cursors.DictCursor)

class flag(View):
    def get(self,request):
        page = request.GET.get("page") if request.GET.get("page") else 0
        page = int(page)
        num = 7
        cursor = db.cursor()
        sql = "select * from flag limit %s,%s"
        cursor.execute(sql,[page*num,num])
        result = cursor.fetchall()
        sqls = "select count(*) as t from flag"
        cursor.execute(sqls)
        nums = cursor.fetchone()
        nums = nums["t"]
        nums = math.ceil(nums/num)
        return render(request,"flag/flag.html",{"data":result,"page":getpages(nums,page,"/flag")})

class flagadd(View):
    def get(self,request):
        return render(request,"flag/flagadd.html")
    def post(self,request):
        ftitle = request.POST.get("ftitle")
        frid = request.POST.get("frid")
        cursor = db.cursor()
        sql = "insert into flag(ftitle,frid) VALUES (%s,%s)"
        cursor.execute(sql,[ftitle,frid])
        db.commit()
        return redirect("/flag/")

class flagedit(View):
    def get(self,request):
        fid = request.GET.get("fid")
        cursor = db.cursor()
        sql = "select * from flag where fid=%s"
        cursor.execute(sql,[fid])
        result = cursor.fetchone()
        return render(request,"flag/flagedit.html",{"data":result})
    def post(self,request):
        fid = request.POST.get("fid")
        ftitle = request.POST.get("ftitle")
        frid = request.POST.get("frid")
        print(fid,ftitle,frid)
        cursor = db.cursor()
        sql = "update flag set ftitle=%s,frid=%s where fid=%s"
        cursor.execute(sql,[ftitle,frid,fid])
        db.commit()
        return redirect("/flag/")

class flagdel(View):
    def get(self,request):
        fid = request.GET.get("fid")
        cursor = db.cursor()
        sql = "delete from flag where fid=%s"
        cursor.execute(sql,[fid])
        db.commit()
        return redirect("/flag/")
