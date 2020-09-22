#!/bin/bash

# ROS Melodic
# http://wiki.ros.org/melodic/Installation/Ubuntu

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y

sudo apt install python-rosdep -y

sudo rosdep init

rosdep update

sudo apt-get install python-catkin-tools -y