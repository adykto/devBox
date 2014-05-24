class apache_vhosts {
  file { '/devbox/projects':
    ensure => directory;
  }

  apache_vhosts::vhost { ['static-site', 'dynamic-site']: }
}
