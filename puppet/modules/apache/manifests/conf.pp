# == Define: conf
#
# Adds an Apache configuration file.
#
define apache::conf() {
  file { "/etc/apache2/${name}":
    source  => "puppet:///modules/apache/${name}",
    require => Package['apache2'],
    notify  => Service['apache2'];
  }
}

define apache::extconf() {
  file {
    "/etc/apache2/conf-available/${name}.conf":
      source  => "puppet:///modules/apache/${name}.conf",
      require => Package['apache2'],
      notify  => Service['apache2'];

    "/etc/apache2/conf-enabled/${name}.conf":
      ensure => link,
      target => "/etc/apache2/conf-available/${name}.conf",
      notify => Service['apache2'];
  }
}


