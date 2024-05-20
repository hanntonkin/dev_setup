#!/bin/bash
# hann@ieee.org
# http://hann.work
# Robotics Dev Environment with Ubuntu 20.04



#==================================================================
#      			      FUNCTIONS

WORKSPACE="/home/$USER/Playground/dev_setup"

UBUNTU_VERSION="`lsb_release -rs`"

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
#      			      SYSTEM TOOLS
echo '----- SYSTEM TOOLS -------------------------'

install terminator apt -y
install htop apt -y

# net-tools
# timeshift

#==================================================================
#      			      DEV TOOLS
echo '----- DEV TOOLS ----------------------------'

install git apt -y
install gitkraken snap --classic

install code snap --classic
install vim apt -y


install sublime-text snap --classic

# docker
# install virtualbox apt -y

# install clang-format apt -y

#==================================================================
#      			      PRODUCTIVITY
echo '----- PRODUCTIVITY -------------------------'


# sudo apt install texlive-full
if [[ -f "/usr/bin/pdflatex" ]]; then
	echo " latex installed"
else
	install texlive-full apt -y
fi


#==================================================================
#      			      COMMUNICATION
echo '----- COMMUNICATION -------------------------'

# install chromium snap
# team


#==================================================================
#      			      MEDIA
echo '----- MEDIA --------------------------------'

# install vlc snap
# install spotify snap

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

# 	echo " setup terminator"
# 	cp -rf $WORKSPACE/ubuntu/config/terminator $HOME/.config/

	echo " setup vs code"
	list_extensions="$(code --list-extensions)"
	if [[ $list_extensions == "" ]]; then
		echo " install extentions for vs code"

		code --install-extension ms-vscode.cpptools
		code --install-extension ms-python.python
		code --install-extension xaver.clang-format
		code --install-extension ms-vscode.theme-predawnkit
		code --install-extension james-yu.latex-workshop
		# code --uninstall-extension ms-vscode.theme-predawnkit
	fi
	code --list-extensions

	cp -rf $WORKSPACE/ubuntu/config/Code/settings.json $HOME/.config/Code/User/

	touch $HOME/.allset
fi