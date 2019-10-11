# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/amazonlinux-2"
  config.vm.box_version = "1.0.0"
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "./bootstrap.sh"
  config.vm.provision :shell, run: "always", inline: <<-SHELL
    sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/updatestack.sh --all --pull --build
    sudo /usr/local/var/Heater-Controller-Server-Docker-Stack/sh/stack.sh --start --prod
    echo IPAddress:
    ifconfig | grep "inet.*broadcast 192.168.0.255"
  SHELL
  # config.vm.network :forwarded_port, guest: 8000, host: 4567
  config.vm.network :public_network
  config.vm.synced_folder "./shared_folder", "/shared_folder"
end
