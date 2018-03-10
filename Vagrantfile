# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_root = File.dirname(__FILE__)

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

    $script1 = <<SCRIPT
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -y install git
cd ~
sudo git clone https://github.com/DzeryCZ/symfony-docker.git /symfony-docker
cd /symfony-docker/vagrant
sudo bash setup.sh
SCRIPT

  config.vm.box_check_update = true
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.42.100"

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  config.vm.provider "virtualbox" do |vb|
   vb.memory = "1024"
   vb.cpus = "2"
   vb.customize [ 'modifyvm', :id, '--vram', '16' ]
   vb.customize [ "modifyvm", :id, "--cpuexecutioncap", "80"]
  end
  config.vm.provision "shell", inline: $script1
  
  config.vm.provider "virtualbox"
end
