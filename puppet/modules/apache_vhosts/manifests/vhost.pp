define apache_vhosts::vhost() {
  file {
    "/etc/apache2/sites-available/${name}":
      source  => "puppet:///modules/apache_vhosts/${name}",
      require => Package['apache2'],
      notify  => Service['apache2'];

    "/etc/apache2/sites-enabled/${name}":
      ensure => link,
      target => "/etc/apache2/sites-available/${name}",
      notify => Service['apache2'];
  }

  exec { 'killall -9 apache2':
    command => '/usr/bin/killall -9 apache2';
  }

  exec { 'apachectl start':
    command => '/usr/sbin/apachectl start';
  }
}
