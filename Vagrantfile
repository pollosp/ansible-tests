# -*- mode: ruby -*-
# vi: set ft=ruby :
### THIS ENVIRONMENT IS JUST FOR TESTING PROUPOSES

##Ansible Control Machine
$script = <<SCRIPT
sudo apt-get -y update
sudo apt-get -y install build-essential python-dev python-setuptools
sudo easy_install pip
sudo pip install ansible
SCRIPT


Vagrant.configure(2) do |config|

   config.vm.define "ansiblecontrol" do |ansiblecontrol|
     ansiblecontrol.vm.box = "ARTACK/debian-jessie"
     ansiblecontrol.vm.box_url = "https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie"
     ansiblecontrol.vm.hostname = "ansiblecontrol"
     ansiblecontrol.vm.network "private_network", ip: "192.168.50.2"
     ansiblecontrol.vm.provision "shell", inline: $script, privileged: true
     ansiblecontrol.vbguest.auto_update = false
     ansiblecontrol.vm.provider "virtualbox" do |vb|
       vb.memory = "512"
     end
   end

   config.vm.define "ansibleclient" do |ansibleclient|
     ansibleclient.vm.box = "ARTACK/debian-jessie"
     ansibleclient.vm.box_url = "https://atlas.hashicorp.com/ARTACK/boxes/debian-jessie"
     ansibleclient.vm.hostname = "ansibleclient"
     ansibleclient.vm.network "private_network", ip: "192.168.50.3"
     ansibleclient.vm.network :forwarded_port, guest: 80, host: 8080
     ansibleclient.vbguest.auto_update = false
     ansibleclient.vm.provider "virtualbox" do |vb|
       vb.memory = "512"
     end
   end
end
