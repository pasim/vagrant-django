# == Define: vhost
#
# Adds and enables an Apache virtual host
#
define apache_vhosts::vhost() {
  file {
    "/etc/apache2/sites-available/${name}.conf":
      source  => "puppet:///modules/apache_vhosts/${name}.conf",
      require => Package['apache2'],
      notify  => Service['apache2'];

    "/etc/apache2/sites-enabled/${name}.conf":
      ensure => link,
      target => "/etc/apache2/sites-available/${name}.conf",
      notify => Service['apache2'];

    # "/var/www/html/${name}":
    #   ensure => link,
    #   target => "/vagrant/sites/${name}";
  }
}
