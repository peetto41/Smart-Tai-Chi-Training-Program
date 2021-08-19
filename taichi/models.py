from django.db import models

# Create your models here.'
class Lesson(models.Model):
    pose_id=models.IntegerField(primary_key=True, serialize=False, verbose_name='ID')
    lesson_name=models.CharField(max_length=200)
    lesson_detail=models.TextField()
    lesson_image = models.ImageField(null=True, blank=True,upload_to="images/")
    videofile= models.FileField(upload_to='videos/', null=True, verbose_name="")

class Student(models.Model):
    id_sd=models.IntegerField(primary_key=True, serialize=False, verbose_name='ID')
    student_name=models.CharField(max_length=200)
    student_lastname=models.CharField(max_length=200)
    year_student=models.IntegerField()
    branch_student=models.CharField(max_length=200)
    faculty_student=models.CharField(max_length=200)
    email_student=models.CharField(max_length=500)
    pass_student=models.CharField(max_length=500)
    group_student=models.IntegerField()

class ScoreStudent(models.Model):
    score_id=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')
    pose_id=models.IntegerField()
    status_pose=models.CharField(max_length=200)
    score_taichi=models.CharField(max_length=200)
    score_date=models.DateTimeField(auto_now=True)
    id_sd=models.IntegerField()

