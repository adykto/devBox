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

include baseconfig, apache, mysql, php, apache_vhosts, git-core, build-essential
