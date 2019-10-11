# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/amazonlinux-2"
  config.vm.box_version = "1.0.0"
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "./bootstrap.sh"
  config.vm.provision :shell, args: ENV['ENV'], run: "always", path: "./startup.sh"
  config.vm.network :public_network
  config.vm.synced_folder "./shared_folder", "/shared_folder"
end
