#!/bin/bash
# hann@ieee.org
# http://hann.work
# worked for Ubuntu 18.04 and 20.04

#==================================================================
#      			      FUNCTIONS

WORKSPACE="/home/$USER/dev_setup"

UBUNTU_VERSION="`lsb_release -rs`"
if [[ "${UBUNTU_VERSION}" != "18.04" ]]; then
	echo " only worked with Ubuntu 18.04"
	return 1;
fi

if ! [[ -f "$HOME/.allset" ]]; then
	sudo apt update; sudo apt upgrade
fi

function install {
    app=$1; method=$2; opt=$3
    if [[  -f "/usr/bin/${app}" ]] || [[  -f "/snap/bin/${app}" ]]; then
        echo " $app installed"
    else
        echo " install $app"
        sudo $method install $app $opt
    fi
}

#==================================================================
#      			      MEDIA
echo '----- MEDIA --------------------------------'

install vlc snap
install spotify snap

#==================================================================
#      			      DEV TOOLS
echo '----- DEV TOOLS ----------------------------'

install git apt
install gitkraken snap --classic

install code snap --classic
install vim apt
if [ -d '/opt/sublime_text' ];
  then
	echo ' sublime installed';
  else
  	echo ' install sublime'
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb [arch=amd64] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	cp /usr/share/applications/sublime_text.desktop ~/.local/share/applications/
	#install sublime https://gist.github.com/simonewebdesign/8507139
	#curl -L git.io/sublimetext | sh
fi

#==================================================================
#      			      SYSTEM TOOLS
echo '----- SYSTEM TOOLS -------------------------'

install terminator apt -y
install htop apt -y

if [[  -f "/usr/sbin/ifconfig" ]] || [[  -f "/sbin/ifconfig" ]]; then
	echo " net-tools installed"
else
	echo " install net-tools"
	sudo apt-get install -y net-tools
fi

if [[  -f "/usr/bin/timeshift" ]]; then
	echo " timeshift installed"
else
	echo " install timeshift"	
	sudo add-apt-repository -y ppa:teejee2008/ppa
	sudo apt update
	sudo apt install timeshift -y
fi

#==================================================================
#      			      PRODUCTIVITY
echo '----- PRODUCTIVITY -------------------------'



# if [ -f '/usr/bin/mark-my-words' ]; then
# 	echo "Mark-my-words installed";
# else
# 	echo "mark-my-words not installed";
# 	sudo add-apt-repository ppa:voldyman/markmywords
# 	sudo apt-get update
# 	sudo apt-get install -y mark-my-words
# fi



#==================================================================
#      			      COMMUNICATION
echo '----- COMMUNICATION -------------------------'

install chromium snap
install skype snap --classic


#==================================================================
#      			      COMMUNICATION
echo '----- SETTINGS -------------------------'

if [[ -f "$HOME/.allset" ]]; then
	echo " all set"
else
	echo " install complete multimedia support"
	sudo apt install ubuntu-restricted-extras -y

	echo " setup git"
	cp -f $WORKSPACE/ubuntu/config/git/gitconfig $HOME/.gitconfig

	echo " setup terminator"
	cp -rf $WORKSPACE/ubuntu/config/terminator $HOME/.config/

	touch $HOME/.allset
fi


if [[ -f "/usr/bin/pip3" ]]; then
	echo " pip3 installed"
	# sudo pip3 install pylint

else
	sudo apt install python3-pip
fi
