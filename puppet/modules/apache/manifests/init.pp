class apache {
  package { ['apache2', 'apache2-mpm-prefork']:
    ensure => present;
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  apache::conf { ['apache2.conf', 'ports.conf', 'httpd.conf', 'envvars']: }
  apache::module { ['expires.load', 'proxy.conf', 'proxy.load', 'proxy_http.load', 'rewrite.load', 'vhost_alias.load', 'headers.load']: }
}
