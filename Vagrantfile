# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_root = File.dirname(__FILE__)

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

    $script1 = <<SCRIPT
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -y install samba git nano apt-transport-https ca-certificates curl software-properties-common
cd ~
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
SCRIPT

  config.vm.box_check_update = true
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.33.100"

  config.vm.provider "virtualbox" do |vb|
   vb.memory = "1024"
   vb.cpus = "2"
   vb.customize [ 'modifyvm', :id, '--vram', '16' ]
   vb.customize [ "modifyvm", :id, "--cpuexecutioncap", "80"]
  end
  config.vm.provision "shell", inline: $script1
end
