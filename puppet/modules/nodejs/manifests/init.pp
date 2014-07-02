class nodejs {
  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['npm'];
  }

  exec { 'fixtmp':
    command => '/bin/chmod 777 -R /home/vagrant/tmp'
  }

  exec { 'npmconfig':
    command => '/usr/bin/npm config set registry http://registry.npmjs.org/',
    require => Package['npm'];
  }

  exec { 'npm install stuff':
    command => '/usr/bin/npm install -g express express-generator jade yo monk mongoose karma jasmine-node karma-jasmine phantomjs mocha bower grunt grunt-cli grunt-contrib-clean grunt-contrib-concat grunt-contrib-copy grunt-contrib-cssmin grunt-contrib-jshint grunt-contrib-nodeunit grunt-contrib-uglify grunt-contrib-watch grunt-mocha meanio --save-dev',
    require => Package['npm'];
  }
}
