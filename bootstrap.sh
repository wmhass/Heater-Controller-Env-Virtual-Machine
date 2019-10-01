#!/bin/bash 

# Install dependencies
sudo yum -y update
sudo yum -y install git
sudo amazon-linux-extras install -y docker
sudo service docker start
sudo usermod -a -G docker vagrant
sudo chkconfig docker on
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Copy SSH Keys
SSH_DIRECTORY=~/.ssh
SSH_KEY=/shared_folder/github_key/id_rsa
if [ ! -d $SSH_DIRECTORY ]; then mkdir -p $SSH_DIRECTORY; fi
chmod 700 $SSH_DIRECTORY

if [ -f $SSH_KEY ]; then 
    cp $SSH_KEY $SSH_DIRECTORY; 

    # Add Github as a known host
    KNOWN_HOSTS=$SSH_DIRECTORY/known_hosts
    ssh-keyscan github.com >> $KNOWN_HOSTS

    # Set Repo information
    REPO_DESTINATION_ROOT_DIRECTORY=/usr/local/var
    GITHUB_DOMAIN=github.com
    GITHUB_USER=wmhass
    REPO_NAME=GrowApp
    REPO_URL=git@$GITHUB_DOMAIN:$GITHUB_USER/$REPO_NAME.git
    REPO_DESTINATION_DIRECTORY=$REPO_DESTINATION_ROOT_DIRECTORY/$REPO_NAME

    # Create repo root folder if does not exist
    if [ ! -d $REPO_DESTINATION_ROOT_DIRECTORY ]; then mkdir $REPO_DESTINATION_ROOT_DIRECTORY; fi

    # Delete directory if already exists
    if [ -d $REPO_DESTINATION_DIRECTORY ]; then sudo rm -rf $REPO_DESTINATION_DIRECTORY; fi
    # Clone repo
    cd $REPO_DESTINATION_ROOT_DIRECTORY
    git clone $REPO_URL
fi