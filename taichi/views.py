from django.contrib.auth.decorators import login_required
from django.core.checks import messages
from django.shortcuts import redirect, render, get_object_or_404
from .models import Lesson,Student,ScoreStudent
from .forms import *
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User,auth
from django.contrib import messages
from django.http import HttpResponse
from django.core.validators import validate_email,validate_integer
from django.http import StreamingHttpResponse
from django.core.files.storage import FileSystemStorage
import bcrypt
import os

# Teacher and Admin System

def loginteacher(request):
    return render(request, 'loginTeacher.html',{'':''})

@login_required
def lessontaichi(request):
    return render(request, 'addtaichi.html',{'':''})

@login_required
def addlesson(request):
    lpose=request.POST['pose']
    lname=request.POST['named']
    ldetail=request.POST['detail']
    limage = request.FILES['image_upload']
    lvideo = request.FILES['video_upload']
    if (lpose==""):
        messages.info(request,'กรุณาใส่ลำดับท่า!!!')
        return redirect('/addlesson')
    if (lname==""):
        messages.info(request,'กรุณาใส่ชื่อเนื้อหาบทเรียน!!!')
        return redirect('/addlesson')
    if (ldetail==""):
        messages.info(request,'กรุณาใส่เนื้อหาบทเรียน!!!')
        return redirect('/addlesson')
    if (limage==""):
        messages.info(request,'กรุณาใส่เนื้อหารูปภาพ!!!')
        return redirect('/addlesson')
    if (lvideo==""):
        messages.info(request,'กรุณาใส่เนื้อหาวิดีโอ!!!')
        return redirect('/addlesson')
    if (Lesson.objects.filter(pose_id=lpose).exists()):
        messages.info(request,'ลำดับท่าซ้ำ!!!')
        return redirect('/addlesson')
    if (Lesson.objects.filter(lesson_name=lname).exists()):
        messages.info(request,'ชื่อบทเรียนซ้ำ!!!')
        return redirect('/addlesson')
    lesson = Lesson.objects.create(
                    pose_id=lpose,
                    lesson_name=lname,
                    lesson_detail=ldetail,
                    lesson_image=limage,
                    videofile=lvideo
    )
    lesson.save()
    messages.success(request,'เพิ่มเนื้อหาเรียบร้อย')
            #request.session['id'] = user.id
    return redirect('/addlesson')

@login_required
def managelesson(request):
    data=Lesson.objects.all()
    return render(request, 'managelesson.html',{'learnt':data})

@login_required
def searchlesson(request):
    searched = request.POST['searched']
    if (searched==""):
        messages.info(request,'กรุณาใส่ข้อมูลค้นหาลำดับท่า!!!')
        return redirect('/managelesson')
    data = Lesson.objects.filter(pose_id=searched)
    return render(request, 'searchlesson.html',{'lesson':searched,'learnt':data})

@login_required
def deletelesson(request, id):
    data = Lesson.objects.get(pose_id=id)
    data.delete()
    return redirect("/managelesson")

@login_required
def editlesson(request, id):
    data = Lesson.objects.get(pose_id=id)
    if request.method == 'POST' and request.FILES['imup'] and request.FILES['vup']:
        data = request.POST.copy()
        lpose=data.get('id')
        lname=data.get('nd')
        ldetail=data.get('dt')
        limage = request.FILES['imup']
        lvideo = request.FILES['vup']

        upd = Lesson()
        #update file image
        # file_image = request.FILES['imup']
        # file_image_name = file_image.name
        # fs = FileSystemStorage()
        # filename = fs.save(file_image_name,file_image)
        # upload_file_url = fs.url(filename)
        # upd.lesson_image = upload_file_url
        upd.pose_id=lpose
        upd.lesson_name=lname
        upd.lesson_detail=ldetail
        upd.lesson_image=limage
        upd.videofile=lvideo
        upd.save()
        return redirect('/managelesson')
    return render(request,'editlesson.html',{'learn':data})

@login_required
def updatelesson(request, id):
    lpose=request.POST.get('id')
    lname=request.POST.get('nd')
    ldetail=request.POST.get('dt')
    limage = request.FILES.get('imup')
    lvideo = request.FILES.get('vup')
    print(lname)
    data = Lesson.objects.get(pose_id=id)
    data.pose_id=lpose
    data.lesson_name=lname
    data.lesson_detail=ldetail
    data.lesson_image=limage
    data.videofile=lvideo
    data.save()
    return redirect('/managelesson')

@login_required	
def managestudent(request):
    data=Student.objects.all()
    return render(request, 'managestudent.html',{'student':data})

@login_required
def searchstudent(request):
        searched = request.POST['searched']
        name = request.POST['nn']
        year = request.POST['yy']
        groupp = request.POST['gg']
     
        if searched : 
            data = Student.objects.filter(id_sd=searched)   
            return render(request, 'searchstudent.html',{'student':searched,'sr':data})
        if groupp :
            group = Student.objects.filter(group_student=groupp)
            return render(request, 'searchstudent.html',{'student':groupp,'sr':group})
        if year :
            yearr = Student.objects.filter(year_student=year)
            return render(request, 'searchstudent.html',{'student':year,'sr':yearr})
        if name : 
            nn = Student.objects.filter(student_name=name)   
            return render(request, 'searchstudent.html',{'student':name,'sr':nn})

@login_required
def detailstudent(request,id):
    data = Student.objects.get(id_sd=id)
    sc = ScoreStudent.objects.raw('SELECT * FROM taichi_scorestudent WHERE id_sd = %s GROUP BY pose_id HAVING count(pose_id) >= 1 ORDER BY score_id ASC',[id])
    return render(request,'detailstudent.html',{'st':data,'sc':sc})
    
@login_required
def addteacher(request):
    return render(request, 'addteacher.html',{'':''})

@login_required
def registerteacher(request):
    fname=request.POST['fname']
    lname=request.POST['lname']
    uname=request.POST['uname']
    email=request.POST['email']
    pwd=request.POST['pwd']
    staff = "1"
    #Validate form input register
    if (fname==""):
        messages.info(request,'กรุณาใส่ข้อมูลอาจารย์!!!')
        return redirect('/addteacher')
    if (User.objects.filter(first_name=fname).exists()):
        messages.info(request,'ชื่อผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/addteacher')
    elif (User.objects.filter(last_name=lname).exists()):
        messages.info(request,'นามสกุลผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/addteacher')
    elif (User.objects.filter(username=uname).exists()):
        messages.info(request,'ชื่อผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/addteacher')
    elif (User.objects.filter(email=email).exists()):
        messages.info(request,'อีเมลผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/addteacher')
    elif (pwd==""):
        messages.info(request,'กรุณาใส่รหัสผ่าน!!!')
        return redirect('/addteacher')
    elif (fname==""):
        messages.info(request,'กรุณาใส่ชื่อของอาจารย์!!!')
        return redirect('/addteacher')
    elif (lname==""):
        messages.info(request,'กรุณาใส่นามสกุลของอาจารย์!!!')
        return redirect('/addteacher')
    elif (uname==""):
        messages.info(request,'กรุณาใส่ชื่อผู้ใช้!!!')
        return redirect('/addteacher')
    elif (email==""):
        messages.info(request,'กรุณาใส่อีเมลของนักศึกษา!!!')
        return redirect('/addteacher')
    else :
            user = User.objects.create_user(
                    username=uname,
                    first_name=fname,
                    last_name=lname,
                    email=email,
                    password=pwd,
                    is_staff=staff
            )
            user.save()
            #request.session['id'] = user.id
            return redirect('/addteacher')

def loginTeacher(request):
    tuser=request.POST['user']
    pwduser=request.POST['pwd']
    if (tuser==""):
        messages.info(request,'กรุณาใส่ชื่อผู้ใช้ของอาจารย์!!!')
        return redirect('/loginTeacher')
    if (pwduser==""):
        messages.info(request,'กรุณาใส่รหัสผ่านของอาจารย์!!!')
        return redirect('/loginTeacher')
    user = auth.authenticate(username=tuser, password=pwduser)
    if user is not None:
        auth.login(request,user)
        return redirect('/managestudent')
    else:
        messages.info(request,'ชื่อผู้ใช้และรหัสผ่านเข้าสู่ระบบไม่ถูกต้อง!!!')
        return redirect('/loginTeacher')

def logoutteacher(request):
    logout(request)
    return redirect('/loginTeacher')

# Create your views here.
def homepage(request):
    return render(request, 'home.html',{'':''})

def traintaichi(request):
    return render(request, 'traintaichi.html',{})

def trainall(request):
    return render(request, 'trainall.html',{})

def learntaichi(request):
    data=Lesson.objects.all()
    return render(request, 'learntaichi.html',{'learnt':data})

def detailtaichi(request, id):
    data = Lesson.objects.get(pose_id=id)
    return render(request,'detaillesson.html',{'learn':data})

def history(request):
    data=Lesson.objects.all()
    return render(request, 'index.html',{'learnt':data})

def contact(request):
    uu = "peetto"
    sql = User.objects.get(username=uu)
    return render(request, 'contact.html',{'s':sql})

def login(request):
    return render(request, 'login.html',{'':''})

def register(request):
    return render(request, 'registerstudent.html',{'':''})

def registerstudent(request):
    fname=request.POST['fname']
    lname=request.POST['lname']
    ids=request.POST['ids']
    year=request.POST['year']
    group=request.POST['group']
    b=request.POST['b']
    f=request.POST['f']
    email=request.POST['email']
    pwd=request.POST['pwd']
    hashed_password = bcrypt.hashpw(pwd.encode('utf8'), bcrypt.gensalt())
    validate_type_email = validate_email.validate_domain_part('live.hcu.-ac-.-th')
    #Validate form input register
    if (fname==""):
        messages.info(request,'กรุณาใส่ข้อมูลนักศึกษา!!!')
        return redirect('/register')
    if (Student.objects.filter(student_name=fname).exists()):
        messages.info(request,'ชื่อผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/register')
    elif (Student.objects.filter(student_lastname=lname).exists()):
        messages.info(request,'นามสกุลผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/register')
    elif (Student.objects.filter(id_sd=ids).exists()):
        messages.info(request,'รหัสนักศึกษาผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/register')
    elif (Student.objects.filter(email_student=email).exists()):
        messages.info(request,'อีเมลผู้ใช้มีอยู่ในระบบแล้ว!!!')
        return redirect('/register')
    elif (pwd==""):
        messages.info(request,'กรุณาใส่รหัสผ่าน!!!')
        return redirect('/register')
    elif (year==""):
        messages.info(request,'กรุณาใส่ชั้นปีที่กำลังศึกษา!!!')
        return redirect('/register')
    elif (group==""):
        messages.info(request,'กรุณาใส่กลุ่มวิชา!!!')
        return redirect('/register')
    elif (b==""):
        messages.info(request,'กรุณาใส่สาขาของนักศึกษา!!!')
        return redirect('/register')
    elif (f==""):
        messages.info(request,'กรุณาใส่คณะของนักศึกษา!!!')
        return redirect('/register')
    elif (fname==""):
        messages.info(request,'กรุณาใส่ชื่อของนักศึกษา!!!')
        return redirect('/register')
    elif (lname==""):
        messages.info(request,'กรุณาใส่นามสกุลของนักศึกษา!!!')
        return redirect('/register')
    elif (ids==""):
        messages.info(request,'กรุณาใส่รหัสประจำตัวของนักศึกษา!!!')
        return redirect('/register')
    elif (email==""):
        messages.info(request,'กรุณาใส่อีเมลของนักศึกษา!!!')
        return redirect('/register')
    else :
            user = Student.objects.create(
                    id_sd=ids,
                    student_name=fname,
                    student_lastname=lname,
                    year_student=year,
                    branch_student=b,
                    faculty_student=f,
                    email_student=email,
                    pass_student=hashed_password.decode('utf-8'),
                    group_student=group,

            )
            user.save()
            #request.session['id'] = user.id
            return redirect('/login')

def loginstudent(request):
    ids=request.POST['ids']
    pwduser=request.POST['pwd']
    if (ids==""):
        messages.info(request,'กรุณาใส่รหัสนักศึกษา!!!')
        return redirect('/login')
    if (pwduser==""):
        messages.info(request,'กรุณาใส่รหัสผ่านของนักศึกษา!!!')
        return redirect('/login')
    if (Student.objects.filter(id_sd=ids).exists()):
        user = Student.objects.filter(id_sd=ids)[0]
        t = user.pass_student
        bypass = bcrypt.checkpw(pwduser.encode('utf8'), t.encode('utf8'))
        if bypass:
            request.session['id_sd'] = user.id_sd
            return render(request,'layout.html', {'u':user})
        if pwduser!=bypass:
            messages.info(request,'รหัสนักศึกษากับรหัสผ่านเข้าสู่ระบบไม่ถูกต้อง!!!')
            return redirect('/login')
    else:
        messages.info(request,'รหัสนักศึกษากับรหัสผ่านเข้าสู่ระบบไม่ถูกต้อง!!!')
        return redirect('/login')

def logoutst(request):
        del request.session['id_sd']
        return render(request,'login.html')

def managescorest(request):
    u = request.session['id_sd']
    data = ScoreStudent.objects.raw('SELECT * FROM taichi_scorestudent WHERE id_sd = %s GROUP BY pose_id HAVING count(pose_id) >= 1 ORDER BY pose_id ASC',[u])
    #data = ScoreStudent.objects.filter(id_sd=u).order_by('pose_id')
    gg = ScoreStudent.objects.filter(id_sd=u)
    #user = ScoreStudent.objects.filter(id_sd=u)[0]
    #lesson = Lesson.objects.filter()
    return render(request,'managescore.html',{'u':data,'g':gg})

def deletescore(request, id):
    data = ScoreStudent.objects.filter(score_id=id)[0]
    data.delete()
    return redirect("/managescorestudent")

def profilestudent(request):
    u = request.session['id_sd']
    data = Student.objects.get(id_sd=u)
    return render(request,'profilestudent.html',{'u':data})

def editprofile(request):
    u = request.session['id_sd']
    data = Student.objects.get(id_sd=u)
    if request.method == 'POST':
        data = request.POST.copy()
        email=data.get('email')
        pwd=data.get('pwd')
        name=data.get('fname')
        lastname=data.get('lname')
        year=data.get('year')
        group=data.get('group')
        b=data.get('b')
        f=data.get('f')
        #Validate form input register
        # if (Student.objects.filter(student_name=name).exists()):
        #     messages.info(request,'ชื่อผู้ใช้มีอยู่ในระบบแล้ว!!!')
        #     return redirect('/editprofile')
        # if (Student.objects.filter(student_lastname=lastname).exists()):
        #     messages.info(request,'นามสกุลผู้ใช้มีอยู่ในระบบแล้ว!!!')
        #     return redirect('/editprofile')
        upd = Student()
        #update file image
        # file_image = request.FILES['imup']
        # file_image_name = file_image.name
        # fs = FileSystemStorage()
        # filename = fs.save(file_image_name,file_image)
        # upload_file_url = fs.url(filename)
        # upd.lesson_image = upload_file_url
        upd.id_sd=u
        upd.email_student=email
        upd.pass_student=pwd
        upd.student_name=name
        upd.student_lastname=lastname
        upd.year_student=year
        upd.branch_student=b
        upd.faculty_student=f
        upd.group_student=group
        upd.save()
        return redirect('/profilestudent')
    return render(request,'editprofile.html',{'u':data})

