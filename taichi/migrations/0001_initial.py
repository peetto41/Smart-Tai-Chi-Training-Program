# Generated by Django 3.2.3 on 2021-05-18 10:01

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Lesson',
            fields=[
                ('pose_id', models.IntegerField(primary_key=True, serialize=False, verbose_name='ID')),
                ('lesson_name', models.CharField(max_length=200)),
                ('lesson_detail', models.TextField()),
                ('lesson_image', models.ImageField(blank=True, null=True, upload_to='images/')),
                ('videofile', models.FileField(null=True, upload_to='videos/', verbose_name='')),
            ],
        ),
        migrations.CreateModel(
            name='ScoreStudent',
            fields=[
                ('score_id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pose_id', models.IntegerField()),
                ('status_pose', models.CharField(max_length=200)),
                ('score_date', models.DateTimeField(auto_now=True)),
                ('test_video', models.FileField(null=True, upload_to='testtaichi/', verbose_name='')),
                ('id_sd', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id_sd', models.IntegerField(primary_key=True, serialize=False, verbose_name='ID')),
                ('student_name', models.CharField(max_length=200)),
                ('student_lastname', models.CharField(max_length=200)),
                ('year_student', models.IntegerField()),
                ('branch_student', models.CharField(max_length=200)),
                ('faculty_student', models.CharField(max_length=200)),
                ('email_student', models.CharField(max_length=500)),
                ('pass_student', models.CharField(max_length=500)),
                ('group_student', models.IntegerField()),
            ],
        ),
    ]
