# == Class: pip
#
# Installs Pip - python package management system and packages required for django
#
class python-pip {
  package { 'python-pip':
    ensure => latest,
  }

  exec { 'install-django':
    command      => 'sudo pip install django',
    path    => ['/bin', '/usr/bin'],
    require => Package['python-pip'];
  }

  exec { 'setup-testsite':
    command  => 'django-admin.py startproject django_learn',
    cwd     => '/home/vagrant/django-app',
    path    => ['/bin', '/usr/bin', '/usr/local/bin'],
    require => Exec['install-django'],
    returns => [0, 1];
  }
}
