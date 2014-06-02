class nodejs {
  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['npm'];
  }

  exec { 'npm install stuff':
    command => '/usr/bin/npm install -g express express-generator jade yo monk mongoose bower grunt grunt-cli grunt-contrib-clean grunt-contrib-concat grunt-contrib-copy grunt-contrib-cssmin grunt-contrib-jshint grunt-contrib-nodeunit grunt-contrib-uglify grunt-contrib-watch meanio',
    require => Package['npm'];
  }
}
