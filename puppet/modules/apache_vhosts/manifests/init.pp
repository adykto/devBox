class apache_vhosts {
  file { '/vagrant/projects':
    ensure => directory;
  }

  apache_vhosts::vhost { ['common']: }
}
