#!/bin/bash -xve

# This script is required only when you did not get this script via Git.

### setup git and openssh ###

sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y openssh-server

### cloning this repository ###

git clone https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu16.04_server.git

# If your git gives a SSL error, please try this.  ###
#GIT_SSL_NO_VERIFY=1 git clone https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu14.04_server.git

