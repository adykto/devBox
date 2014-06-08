class baseconfig {
  exec { "apt-update":
      command => "/usr/bin/apt-get update",
      before  => Stage["main"],
  }

  package { ['mongodb', 'redis-server', 'g++', 'zip', 'unzip', 'curl', 'wget',
             'git-core', 'build-essential', 'make', 'language-pack-en', 'elinks',
             'python-sphinxcontrib-httpdomain', 'python-sphinx', 'gpm', 'htop',
             'nodejs', 'nodejs-dev', 'npm', 'tmux']:
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
    command => '/sbin/sysctl fs.inotify.max_user_watches=65536';
  }

  file {
    '/home/vagrant/.gitconfig':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/gitconfig';
  }

  file {
    '/home/vagrant/.setup.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/setup.sh';
  }

  file {
    '/home/vagrant/.split.sh':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/split.sh';
  }

  file {
    '/home/vagrant/.tmux.conf':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/tmux';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
