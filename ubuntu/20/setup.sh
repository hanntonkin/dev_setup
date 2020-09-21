#!/bin/bash
#hann@ieee.org

function apt_install {
	v=$1
	if [[  -f "/usr/bin/${v}" ]]; then
		echo " $v installed"
	else
		echo " install $v"
		sudo apt-get install -y $v
	fi 
}

function snap_install {
	v=$1
	if [[  -L "/snap/bin/${v}" ]]; then
		echo " $v installed"
	else
		echo " install $v"
		sudo snap install $v $2
	fi 
}

UBUNTU_VERSION="`lsb_release -rs`"

if [[ "${UBUNTU_VERSION}" == "20.04" ]]; then
	echo "Ubuntu 20.04"

	# ---------------------------------------------
	echo "Media ----------"

	snap_install vlc
	snap_install spotify
	snap_install chromium

	
	# ---------------------------------------------
	echo "Coding ---------"

	if [[  -L '/snap/bin/subl' ]]; then
		echo " subl installed"
	else
		echo " install subl"
		sudo snap install --classic sublime-text
	fi

	snap_install code --classic
	snap_install gitkraken --classic

	apt_install vim
	apt_install terminator

	# ---------------------------------------------
	echo "Communication -"
	snap_install skype --classic


	# ---------------------------------------------
	echo "Configuration -"

	
	apt_install htop
	# apt_install net-tools
	if [[  -f "/usr/sbin/ifconfig" ]]; then
		echo " net-tools installed"
	else
		echo " install net-tools"
		sudo apt-get install -y net-tools
	fi


fi