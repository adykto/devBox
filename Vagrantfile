# -*- mode: ruby -*-
# vi: set ft=ruby :

box      = 'trusty64'
url      = 'http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
hostname = 'local'
domain   = 'devbox.dev'
ip       = '10.10.10.10'
ram      = '4096'
cpus     = '4'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = box
  config.vm.box_url = url
  config.vm.host_name = "#{hostname}.#{domain}"
  config.vm.network "private_network", ip: ip

  config.vm.provider :virtualbox do |v|
    v.name = hostname
    v.memory = ram
    v.cpus = cpus
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'lamp.pp'
    puppet.module_path = 'puppet/modules'
  end
end
