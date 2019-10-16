#!/bin/bash 

# SSH Directory
ROOT_SSH_DIRECTORY=/root/.ssh
VAGRANT_SSH_DIRECTORY=/home/vagrant/.ssh

# Shared Directory
VAGRANT_DIR=/vagrant

# Github Directories
GITHUB_DIR=$VAGRANT_DIR/github
GITHUB_REPOS_DIR=$GITHUB_DIR/repos
SSH_PRIVATE_KEY=$GITHUB_DIR/key/id_rsa
SSH_PUBLIC_KEY=$GITHUB_DIR/key/id_rsa.pub

# Create ssh Directory if it does not exist
if [ ! -d $ROOT_SSH_DIRECTORY ]; then mkdir -p $ROOT_SSH_DIRECTORY; fi
chmod 700 $ROOT_SSH_DIRECTORY

if [ ! -d $VAGRANT_SSH_DIRECTORY ]; then mkdir -p $VAGRANT_SSH_DIRECTORY; fi
chmod 700 $VAGRANT_SSH_DIRECTORY

# Copy SSH Private Key
if [ -f $SSH_PRIVATE_KEY ]; then
    cp $SSH_PRIVATE_KEY $ROOT_SSH_DIRECTORY;
    cp $SSH_PRIVATE_KEY $VAGRANT_SSH_DIRECTORY;

    # Add Github as a known host
    ROOT_KNOWN_HOSTS=$ROOT_SSH_DIRECTORY/known_hosts
    VAGRANT_KNOWN_HOSTS=$VAGRANT_SSH_DIRECTORY/known_hosts
    ssh-keyscan github.com >> $ROOT_KNOWN_HOSTS
    ssh-keyscan github.com >> $VAGRANT_KNOWN_HOSTS
fi

# Copy SSH Public Key
if [ -f $SSH_PUBLIC_KEY ]; then 
    cp $SSH_PUBLIC_KEY $ROOT_SSH_DIRECTORY; 
    cp $SSH_PUBLIC_KEY $VAGRANT_SSH_DIRECTORY; 
fi

# Execute all scripts in SHARED_GITHUB_REPOS_DIR
if [ -d $GITHUB_REPOS_DIR ]; then
    for f in $GITHUB_REPOS_DIR/*.sh
    do
        sh $f
    done
fi