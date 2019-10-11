#!/bin/bash 

# Repository Destination Directory
REPO_DESTINATION_ROOT_DIRECTORY=/usr/local/var

# Github Information
GITHUB_DOMAIN=github.com
GITHUB_USER=wmhass
REPO_NAME=Heater-Controller-Server-Docker-Stack
REPO_URL=git@$GITHUB_DOMAIN:$GITHUB_USER/$REPO_NAME.git
BRANCH=master

# Create repo root folder if does not exist
if [ ! -d $REPO_DESTINATION_ROOT_DIRECTORY ]; then mkdir $REPO_DESTINATION_ROOT_DIRECTORY; fi

# Delete repository directory if already exists
REPO_DESTINATION_DIRECTORY=$REPO_DESTINATION_ROOT_DIRECTORY/$REPO_NAME
if [ -d $REPO_DESTINATION_DIRECTORY ]; then sudo rm -rf $REPO_DESTINATION_DIRECTORY; fi

# Clone repo
cd $REPO_DESTINATION_ROOT_DIRECTORY
git clone --single-branch --branch $BRANCH --recurse-submodules $REPO_URL

if [ -d $REPO_DESTINATION_DIRECTORY ]; then
    cd $REPO_DESTINATION_DIRECTORY
fi

# TODO: Rebuild and recreate Docker Container