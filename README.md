# Experimental Vagrant Django box
A basic Django application - nothing sophisticated just installs Django and that's about it.

Download this repository and put it some where in your system
then run
```bash
vagrant up
```
If you need to change or adjust, feel free to change Vagrantfile
It Creates a new virtual machine;

Packages included;
1. Apache and libapache2-mod-wsgi
2. Mysql and python-mysqldb
3. python-pip for package management

When you've finished built open up settings.py and change Database settings to following
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django_learn',
        'USER': 'root',
        'PASSWORD': 'root',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
```
At the end you can edit your code under sites/django-app/django_learn (On host)
