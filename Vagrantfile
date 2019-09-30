# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/amazonlinux-2"
  config.vm.box_version = "1.0.0"

  config.vm.provision :shell, path: "./bootstrap.sh"
  # config.vm.network :forwarded_port, guest: 8000, host: 4567
  config.vm.network :public_network
  config.vm.synced_folder "../shared_folder", "/shared_folder"
end
