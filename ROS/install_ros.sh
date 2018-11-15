#!/bin/bash
# install ros
# hann@ieee.org


# install ROS if needed
if [ -d '/opt/ros' ]; then
	echo "ROS installed";
else
	sudo chmod +x download_ros.sh
	sudo chmod +x setup_ros.sh
	. download_ros.sh
	. setup_ros.sh
fi
