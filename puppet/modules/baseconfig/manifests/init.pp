class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  package { ['mongodb', 'redis-server', 'g++', 'zip', 'unzip', 'curl', 'wget',
             'git-core', 'build-essential', 'make', 'language-pack-en',
             'python-sphinxcontrib-httpdomain', 'python-sphinx',
             'nodejs', 'nodejs-dev', 'npm']:
    ensure => present;
  }

  host { 'hostname':
    ip => '10.10.10.10';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
