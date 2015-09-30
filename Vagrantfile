box      = 'ubuntu-precise12042-x64-vbox43'
url      = 'http://box.puphpet.com/ubuntu-precise12042-x64-vbox43.box'
hostname = 'devbox.dev'
ip       = '10.10.10.10'
ram      = '512'
cpus     = '1'
cap      = '20'

Vagrant.configure("2") do |config|
  config.vm.box = box
  config.vm.box_url = url
  config.vm.hostname = hostname
  config.vm.network :private_network, ip: ip
  config.vm.synced_folder "../", "/Public", create: true
  config.vm.provision :shell, :inline => 'apt-get update'

  config.vm.provider "virtualbox" do |vbox|
      vbox.name = hostname
      vbox.customize [
          "modifyvm", :id,
          "--groups", "/devBox",
          "--memory", ram,
          "--cpus", cpus,
          "--cpuexecutioncap", cap
      ]
      vbox.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate//Public", "1"]
  end


  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'lamp.pp'
    puppet.module_path = 'puppet/modules'
  end
end
