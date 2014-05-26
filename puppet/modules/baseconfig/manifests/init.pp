class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  package { ['mongodb', 'nodejs', 'nodejs-dev', 'npm', 'redis-server', 'git-core',
             'build-essential', 'g++', 'make', 'wget']:
    ensure => present;
  }

  host { 'hostname':
    ip => '10.10.10.10';
  }

  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['nodejs'];
  }

  exec { 'npm install -g grunt':
    command => '/usr/bin/npm install -g grunt grunt-cli grunt-contrib-clean grunt-contrib-concat grunt-contrib-copy grunt-contrib-cssmin grunt-contrib-jshint grunt-contrib-nodeunit grunt-contrib-uglify grunt-contrib-watch',
    require => Package['nodejs'];
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
