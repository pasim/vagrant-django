# == Class: apache
#
# Installs packages for Apache2, enables modules, and sets config files.
#
class apache {
  package { ['apache2', 'apache2-mpm-prefork', 'libapache2-mod-wsgi']:
    ensure => latest;
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  apache::conf { ['apache2.conf', 'ports.conf']: }
  apache::module { ['expires.load', 'proxy.conf', 'proxy.load', 'proxy_http.load', 'rewrite.load']: }
  apache::extconf{ ['servername']: }
}
