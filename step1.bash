#!/bin/bash -exv

UBUNTU_VER=$(lsb_release -sc)
ROS_VER=kinetic
[ "$UBUNTU_VER" = "precise" ] && ROS_VER=indigo

set +vx

if grep -F 'http://jp.' /etc/apt/sources.list ; then
	echo "############WARNING##############"
	echo "2016年5月29日現在、http://jp.archive.ubuntu.comに無いパッケージが存在しています。"
	echo "/etc/apt/sources.list内のURLのjp.をus.等に変更の上実行のこと。"
	echo "###インストールは中断されました###"
	exit 1
fi

set -vx

echo "deb http://packages.ros.org/ros/ubuntu $UBUNTU_VER main" > /tmp/$$-deb
sudo mv /tmp/$$-deb /etc/apt/sources.list.d/ros-latest.list

sudo apt-get install -y curl
curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
sudo apt-get update || echo ""

sudo apt-get install -y ros-${ROS_VER}-ros-base

sudo rosdep init
rosdep update

sudo apt-get install -y python-rosinstall
sudo apt-get install -y build-essential
sudo apt-get install -y python-roslaunch
#sudo apt-get install -y linux-headers-$(uname -r)

grep -F "source /opt/ros/$ROS_VER/setup.bash" ~/.bashrc ||
echo "source /opt/ros/$ROS_VER/setup.bash" >> ~/.bashrc


### instruction for user ###
set +xv

echo '***INSTRUCTION*****************'
echo '* do the following command    *'
echo '* $ source ~/.bashrc          *'
echo '* after that, try             *'
echo '* $ LANG=C roscore            *'
echo '*******************************'
