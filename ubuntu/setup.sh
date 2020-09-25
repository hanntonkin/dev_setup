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

if [[ -f "/usr/bin/teamviewer" ]]; then
	echo " teamviewer installed"
else
	echo " install teamviewer"
	curl https://dl.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
	echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
	sudo apt-get update
	sudo apt install teamviewer -y
fi

#==================================================================
#      			      DEV TOOLS
echo '----- DEV TOOLS ----------------------------'

install git apt -y
install gitkraken snap --classic

install code snap --classic
install vim apt -y
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



if [[ -f "/usr/bin/pip3" ]]; then
	echo " pip3 installed"
	# sudo pip3 install pylint
else
	sudo apt install python3-pip
fi

install clang-format apt -y

#==================================================================
#      			      PRODUCTIVITY
echo '----- PRODUCTIVITY -------------------------'


if [[ -f "/usr/bin/dropbox" ]]; then
	echo " dropbox installed"
else
	echo " install dropbox"
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
	echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu cosmic main" | sudo tee /etc/apt/sources.list.d/dropbox.list
	sudo apt update
	sudo apt install python3-gpg dropbox -y
fi


# sudo apt install texlive-full
if [[ -f "/usr/bin/pdflatex" ]]; then
	echo " latex installed"
else
	install texlive-full apt -y
fi


#==================================================================
#      			      COMMUNICATION
echo '----- COMMUNICATION -------------------------'

install chromium snap
install skype snap --classic


if [[ -f "/usr/bin/teams" ]]; then
	echo " teams installed"
else
	echo " install teams"
	curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee /etc/apt/sources.list.d/teams.list
	sudo apt update
	sudo apt install teams
fi


#==================================================================
#      			      MEDIA
echo '----- MEDIA --------------------------------'

install vlc snap
install spotify snap

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


