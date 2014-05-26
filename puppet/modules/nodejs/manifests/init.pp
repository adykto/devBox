class nodejs {
  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['npm'];
  }

  exec { 'npm install -g grunt':
    command => '/usr/bin/npm install -g yo bower grunt grunt-cli grunt-contrib-clean grunt-contrib-concat grunt-contrib-copy grunt-contrib-cssmin grunt-contrib-jshint grunt-contrib-nodeunit grunt-contrib-uglify grunt-contrib-watch',
    require => Package['npm'];
  }
}
