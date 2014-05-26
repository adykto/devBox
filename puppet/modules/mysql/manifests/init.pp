class mysql {
  package { ['mysql-server']:
    ensure => present;
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'];
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -ppassword status',
    command => "mysqladmin -uroot password password",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }

  exec { 'reset-root-privileges':
    command => 'mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" IDENTIFIED BY \"password\" WITH GRANT OPTION; FLUSH PRIVILEGES;"',
    path    => ['/bin', '/usr/bin'],
    require => Exec['set-mysql-password'];
  }

  exec { 'database-seed':
    command => 'mysql -u root -ppassword < /vagrant/db/seed.sql',
    path    => ['/bin', '/usr/bin'],
    require => Exec['reset-root-privileges'];
  }

}
