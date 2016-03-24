# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "bento/centos-6.7-i386"
  config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
  end

  config.vm.define "NameNode" do |nn|
      nn.vm.network "public_network"
      nn.vm.network "private_network", ip: "192.168.33.10"
  end

  config.vm.define "DataNode1" do |dn1|
      dn1.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.define "DataNode2" do |dn2|
      dn2.vm.network "private_network", ip: "192.168.33.12"
  end

  config.vm.define "DataNode3" do |dn3|
      dn3.vm.network "private_network", ip: "192.168.33.13"
  end
  
  
  
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "./", "/home/vagrant/"
  # config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo yum install -y --nogpgcheck git
  # SHELL
end
