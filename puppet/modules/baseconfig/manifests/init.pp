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

  exec { 'locale-gen':
    command => '/usr/sbin/locale-gen en_US en_US.UTF-8';
  }

  exec { 'dpkg-reconfigure locales':
    command => '/usr/sbin/dpkg-reconfigure locales';
  }

  exec { 'increase file watches':
    command => '/usr/bin/bash echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sudo sysctl -p';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
