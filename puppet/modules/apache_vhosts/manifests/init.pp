# == Class: apache_vhosts
#
# Adds and enables virtual hosts. Sets up /var/www symlinks.
#
class apache_vhosts {
  file { '/var/www/html':
    ensure => directory,
    require => Package['python-pip'];
  }

  apache_vhosts::vhost { ['django-learn']: }
}
