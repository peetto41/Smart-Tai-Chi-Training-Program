from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from taichi.views import deletescore, lessontaichi,learntaichi,history,contact,login,register,learntaichi
from taichi.views import registerstudent,loginstudent,loginteacher,loginTeacher,addlesson,searchstudent,searchlesson
from taichi.views import managelesson,managestudent,logoutteacher,deletelesson,editlesson,updatelesson
from taichi.views import addteacher,registerteacher,detailtaichi,detailstudent,managescorest,logoutst
from taichi.views import profilestudent,traintaichi,trainall,deletelesson,editprofile

from taichi.detecttaichi.detectai1 import detectpose1
from taichi.detecttaichi.detectai2 import detectpose2
from taichi.detecttaichi.detectai3 import detectpose3
from taichi.detecttaichi.detectai4 import detectpose4
from taichi.detecttaichi.detectai5 import detectpose5
from taichi.detecttaichi.detectai6 import detectpose6
from taichi.detecttaichi.detectai7 import detectpose7
from taichi.detecttaichi.detectai8 import detectpose8
from taichi.detecttaichi.detectai9 import detectpose9
from taichi.detecttaichi.detectai10 import detectpose10

from taichi.detectall import detectall
# from taichi.detectall import detectpose_1,detectpose_2,detectpose_3,detectpose_4,detectpose_5,detectpose_6,detectpose_7
# from taichi.detectall import detectpose_8,detectpose_9,detectpose_10,detectpose_11,detectpose_12,detectpose_13,detectpose_14
# from taichi.detectall import detectpose_15,detectpose_16,detectpose_17,detectpose_18,detectpose_19,detectpose_20,detectpose_21,detectpose_22

urlpatterns = [
    path('', history),
    path('learntaichi', learntaichi),
    path('index', history),
    path('contact', contact),
    path('login', login),
    path('register', register),
    path('addlesson', lessontaichi),
    path('addstudent', registerstudent),
    path('addlogin', loginstudent),
    path('loginTeacher', loginteacher),
    path('addloginT', loginTeacher),
    path('lesson',addlesson),
    path('managelesson',managelesson),
    path('managestudent',managestudent),
    path('logout',logoutteacher),
    path('deletelesson/<int:id>', deletelesson),
    path('editlesson/<int:id>', editlesson),
    path('updatelesson/<int:id>', updatelesson , name="updatelesson"),
    path('addteacher', addteacher),
    path('registerteacher',registerteacher),
    path('detailtaichi/<int:id>', detailtaichi),
    path('detailstudent/<int:id>', detailstudent),
    path('managescorestudent',managescorest),
    path('deletescorest/<int:id>', deletescore),
    path('logoutst',logoutst),
    path('profilestudent', profilestudent),
    path('editprofile', editprofile),        
    path('traintaichi', traintaichi),
    path('trainall', trainall),
    path('searchstudent', searchstudent),
    path('searchlesson', searchlesson),
    # Path Detect AI
    path('detecttaichi1', detectpose1),
    path('detecttaichi2', detectpose2),
    path('detecttaichi3', detectpose3),
    path('detecttaichi4', detectpose4),
    path('detecttaichi5', detectpose5),
    path('detecttaichi6', detectpose6),
    path('detecttaichi7', detectpose7),
    path('detecttaichi8', detectpose8),
    path('detecttaichi9', detectpose9),
    path('detecttaichi10', detectpose10),
   

    # Path Detect AI ALL USER
    path('train', detectall),

] + static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT)
