box      = 'trusty64'
url      = 'http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
hostname = 'devbox'
domain   = 'devbox.dev'
ip       = '10.10.10.10'
ram      = '512'
cpus     = '1'

Vagrant::Config.run do |config|
  config.vm.box = box
  config.vm.box_url = url
  config.vm.host_name = hostname + '.' + domain
  config.vm.network :hostonly, ip

  config.vm"virtualbox" do |v|
    v.customize[
        'modifyvm', :id,
        '--name', hostname,
        '--memory', ram,
        '--cpus', cpus
      ]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'lamp.pp'
    puppet.module_path = 'puppet/modules'
  end
end
