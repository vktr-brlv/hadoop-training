# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "bento/centos-7.1"
  config.vm.provider "virtualbox" do |vb|
      vb.memory = "2500"
  end

  config.vm.synced_folder "./puppet", "/etc/puppet"

  config.vm.define "NameNode" do |nn|
      nn.vm.network "public_network"
      nn.vm.network "private_network", ip: "192.168.33.10"
      nn.vm.hostname = "nn1.example.com"
  end

  config.vm.define "DataNode1" do |dn1|
      dn1.vm.network "private_network", ip: "192.168.33.11"
      dn1.vm.hostname = "dn1.example.com"
  end

  config.vm.define "DataNode2" do |dn2|
      dn2.vm.network "private_network", ip: "192.168.33.12"
      dn2.vm.hostname = "dn2.example.com"
  end

  config.vm.define "DataNode3" do |dn3|
      dn3.vm.network "private_network", ip: "192.168.33.13"
      dn3.vm.hostname = "dn3.example.com"
  end
  
  config.vm.box_check_update = false

  config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y install epel-release --nogpgcheck
    sudo yum -y install puppet --nogpgcheck
    echo -e '192.168.33.10 nn1.example.com\r\n192.168.33.11 dn1.example.com\r\n192.168.33.12 dn2.example.com\r\n192.168.33.13 dn3.example.com' >> /etc/hosts
  SHELL

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
  end

end
