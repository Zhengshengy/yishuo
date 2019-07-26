from django.shortcuts import redirect,render,HttpResponse
import pymysql
import hashlib,json

db = pymysql.connect("localhost", "root", "root", "yishuo",charset='utf8',
                     cursorclass=pymysql.cursors.DictCursor)
cursor= db.cursor()

def yiShuoMain(req):
    id = req.POST.get('id')
    sql = "select * from content where cid = %s"
    cursor.execute(sql, [id])
    result = cursor.fetchone()
    result['cstart'] = str(result['cstart'])
    sql = "select * from message where mcid = %s"
    cursor.execute(sql, [id])
    result1 = cursor.fetchall()
    sql = "select * from user where uname=%s"
    cursor.execute(sql,[result['cname']])
    result2 = cursor.fetchone()
    sql = "select * from dianzan where zcid=%s"
    cursor.execute(sql, [id])
    result3 = len(cursor.fetchall())
    return HttpResponse(json.dumps({'result':result,'result1':result1,'result2':result2,'result3':result3}))
def yiShuoMessage(req):
    id = req.POST.get('id')
    return HttpResponse('aa')