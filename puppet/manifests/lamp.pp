stage { 'pre':
  before => Stage['main']
}

class { 'baseconfig':
  stage => 'pre'
}

File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

include baseconfig, apache, php, apache_vhosts, composer
