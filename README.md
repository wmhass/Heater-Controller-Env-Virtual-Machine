# Heater Controller Environment Virtual Machine

This is a Vagrant Virtual Machine that uses the `bento/amazonlinux-2` box, which is the same OS as the Amazon EC2 instances.

## Shared folder with host
Shared folder between host and virtual machine: `shared_folder`

## Installed packages
- **Git**
- **Docker** and **Docker-Compose**

## Github extra feature
In the `bootstrap.sh` file, which is the file that runs on provision, there is a feature that will check if there is a `id_rsa` key in the `github/key` directory. If so, it will copy that key to the virtual machine `.ssh` folder.

In addition to that, it will try to execute every `.sh` file located in `github/repos` directory. This is useful in case you want to clone some repos into the virtual machine during provision. 

There is a file named `copy_repo.sh.template` inside `github/repos`. You can create a copy of this file renaming to the name of your repo and removing the `.template` extension. There are a few variables inside this file that you just have to replace with your github repository information. This script is also useful for Continuous Integration/Continuous Delivery because it will pull the repository every time the script is executed.
