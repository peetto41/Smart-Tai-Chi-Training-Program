from django import forms  
from .models import Lesson
class LessonForm(forms.ModelForm):  
    class Meta:  
        model = Lesson 
        fields = ['pose_id','lesson_name', 'lesson_detail','lesson_image','videofile'] 