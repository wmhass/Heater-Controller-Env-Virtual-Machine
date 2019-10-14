#!/bin/bash 

# SSH Directory
SSH_DIRECTORY=~/.ssh

# Shared Directory
VAGRANT_DIR=/vagrant

# Github Directories
GITHUB_DIR=$VAGRANT_DIR/github
SHARED_GITHUB_REPOS_DIR=$GITHUB_DIR/repos
SSH_KEY=$GITHUB_DIR/key/id_rsa

# Create ssh Directory if it does not exist
if [ ! -d $SSH_DIRECTORY ]; then mkdir -p $SSH_DIRECTORY; fi
chmod 700 $SSH_DIRECTORY

# Copy SSH Keys
if [ -f $SSH_KEY ]; then 
    cp $SSH_KEY $SSH_DIRECTORY; 

    # Add Github as a known host
    KNOWN_HOSTS=$SSH_DIRECTORY/known_hosts
    ssh-keyscan github.com >> $KNOWN_HOSTS
fi

# Execute all scripts in SHARED_GITHUB_REPOS_DIR
if [ -d $SHARED_GITHUB_REPOS_DIR ]; then
    for f in $SHARED_GITHUB_REPOS_DIR/*.sh
    do
        sh $f
    done
fi