# Smart-Tai-Chi-Training-Program
Smart Tai Chi training program is a web application system that scans the dance through a webcam using artificial intelligence to check the Tai Chi dance moves.
## Build Setup
``` bash
# install env
pip install virtualenv
```
``` bash
# create a python environment named env or whatever.
venv env
```
``` bash
# activate env for Linux and macOS
source env/bin/activate 
```
``` bash
# activate env for Windows
.\env\Scripts\activate
```
``` bash
# install package module python
pip install requirements.txt
```
``` bash
# update database in /taichi/models.py use migrations
python manage.py makemigrations
and
python manage.py migrate 
```
``` bash
# run test local server
python manage.py runserver -h 127.0.0.1 -p 8000
```
## Video Demo
https://drive.google.com/drive/folders/1xW8sumL7nIcaLINVN3Bg8mhh2wzSFUo9?usp=sharing

## Project for making AI check Tai Chi dance moves.
https://github.com/peetto41/TrainDetectTaichi
