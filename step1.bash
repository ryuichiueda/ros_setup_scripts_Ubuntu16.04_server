#!/bin/bash -exv

UBUNTU_VER=$(lsb_release -sc)
ROS_VER=kinetic
[ "$UBUNTU_VER" = "trusty" ] && ROS_VER=indigo

echo "deb http://packages.ros.org/ros/ubuntu $UBUNTU_VER main" > /tmp/$$-deb
sudo mv /tmp/$$-deb /etc/apt/sources.list.d/ros-latest.list

sudo apt-get install -y curl
curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
sudo apt-get update || echo ""

sudo apt-get install -y ros-${ROS_VER}-ros-base

ls /etc/ros/rosdep/sources.list.d/20-default.list && sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init 
rosdep update

sudo apt-get install -y python-rosinstall
sudo apt-get install -y build-essential

#[ "$ROS_VER" = "kinetic" ] && sudo apt-get install -y ros-${ROS_VER}-roslaunch

grep -F "source /opt/ros/$ROS_VER/setup.bash" ~/.bashrc ||
echo "source /opt/ros/$ROS_VER/setup.bash" >> ~/.bashrc

grep -F "ROS_MASTER_URI" ~/.bashrc ||
echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc

grep -F "ROS_HOSTNAME" ~/.bashrc ||
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc


### instruction for user ###
set +xv

echo '***INSTRUCTION*****************'
echo '* do the following command    *'
echo '* $ source ~/.bashrc          *'
echo '* after that, try             *'
echo '* $ LANG=C roscore            *'
echo '*******************************'
