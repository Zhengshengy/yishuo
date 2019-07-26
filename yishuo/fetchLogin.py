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

def yiShuoLogin(req):
    name = req.POST.get('name')
    password = req.POST.get('pass')
    sql = "select * from `user` where uname = %s and upass = %s"
    cursor.execute(sql, [name,md5(password)])
    result = cursor.fetchone()
    if result :
        return HttpResponse('ok')
    else :
        return HttpResponse('error')

def yiShuoIndex(req):
    sql = "select * from content left join user on content.cname = user.uname limit 0 , 4 " # 此处需要修改，要查看内容以及相关内容、留言数与下载量
    cursor.execute(sql)
    result = cursor.fetchall()
    for item in result:
        item['cstart'] = str(item['cstart'])
    return HttpResponse(json.dumps(result))
def yiShuoIndexInfo(req):
    sql = "select * from content left join user on content.cname = user.uname limit 0 , 2 "  # 此处需要修改，要查看内容以及相关内容、留言数与下载量
    cursor.execute(sql)
    result = cursor.fetchall()
    for item in result:
        item['cstart'] = str(item['cstart'])
    return HttpResponse(json.dumps(result))
def yiShuoIndexGuess(req):
    sql = "select * from content left join user on content.cname = user.uname limit 0 , 4 "  # 此处需要修改，需要根据个人喜好（个性化定制）来搜索
    cursor.execute(sql)
    result = cursor.fetchall()
    for item in result:
        item['cstart'] = str(item['cstart'])
    return HttpResponse(json.dumps(result))