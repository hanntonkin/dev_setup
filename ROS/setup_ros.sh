#!/bin/bash
# setup ros
# hann@ieee.org

sudo rosdep init

rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-get install -y python-catkin-tools