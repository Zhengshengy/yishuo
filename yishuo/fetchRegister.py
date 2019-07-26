from django.shortcuts import redirect,render,HttpResponse
import pymysql
import hashlib,json

db = pymysql.connect("localhost", "root", "root", "yishuo",charset='utf8',
                     cursorclass=pymysql.cursors.DictCursor)
cursor= db.cursor()

def md5(str):
    md5=hashlib.md5()
    md5.update(str.encode("utf8"))
    return md5.hexdigest()

def yishuoRegisterCheck(req):
    names = req.POST.get('name')
    sql = "select * from user where uname = %s"
    cursor.execute(sql,[names])
    result = cursor.fetchone()
    if not result:
        return HttpResponse('ok')
    else:
        return HttpResponse('error')

def yiShuoRegister(req):
    name = req.POST.get('name')
    password = req.POST.get('pass')
    sql = 'insert into user (uname,upass) values (%s,%s)'
    cursor.execute(sql,[name,md5(password)])
    db.commit()
    return HttpResponse('ok')




