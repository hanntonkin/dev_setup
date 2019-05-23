#!/bin/bash
#Development environment setup in ubuntu
# TODO
# 1) make printingout more clean
#


WORKSPACE="/home/$USER/dev_setup"

#==================================================================
#      			      FUNCTIONS


#==================================================================
#      			      SYSTEM TOOLS
echo '----- SYSTEM TOOLS -------------------------'

if [ -f '/usr/bin/curl' ]; then
	echo "Curl installed";
else
	sudo apt-get install -y curl
fi

if [ -L '/usr/bin/terminator' ]; then
	echo "Terminator installed";

else
	sudo apt-get install -y terminator
	sudo cp -f $WORKSPACE/dotfiles/bashrc ~/.bashrc
fi
# write force_color_prompt=yes to .bashrc

#https://thishosting.rocks/how-to-enable-ssh-on-ubuntu/
#https://scotch.io/tutorials/how-to-create-an-ssh-shortcut
sudo apt-get install openssh-server -y
# setup config file


#==================================================================
#      			      PRODUCTIVITY
echo '----- PRODUCTIVITY -------------------------'

if [ -L '/usr/bin/vim' ]; then
	echo "Vim installed";
else
	sudo apt-get install -y vim
fi


# if [ -f '~/.zshrc']; then
# 	echo "zsh installed";
# else
# 	#sudo apt install -y git-core zsh;
# 	#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
# 	# sudo apt install fonts-powerline;

# 	cd ~/.oh-my-zsh/custom/plugins
# 	git clone https://github.com/zsh-users/zsh-syntax-highlighting
# 	git clone https://github.com/zsh-users/zsh-autosuggestions


# 	# bring in my custom dotfile
# 	cp -f ~/dev_setup/dotfiles/zshrc_ubuntu ~/.zshrc
# 	source ~/.zshrc
# fi




if [ -d '/opt/sublime_text' ];
  then
	echo '-- Sublime Text 3 installed -----';
  else
  	echo '-- Install Sublime Text -----'
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	cp /usr/share/applications/sublime_text.desktop ~/.local/share/applications/
	#install sublime https://gist.github.com/simonewebdesign/8507139
	#curl -L git.io/sublimetext | sh
fi

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

if [ -f '/usr/bin/google-chrome' ]; then
	echo "Mark-my-words installed";
else
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	sudo apt-get update
	sudo apt-get install -y google-chrome-stable
fi






#==================================================================
#      			      COMMUNICATION
echo '----- SETTINGS -------------------------'

# remove icon from launcher
#gsettings get com.canonical.Unity.Launcher favorites
#['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://firefox.desktop', 'application://libreoffice-writer.desktop', 'application://libreoffice-calc.desktop', 'application://libreoffice-impress.desktop', 'application://org.gnome.Software.desktop', 'application://ubuntu-amazon-default.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']
gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://terminator.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"

sources ~/.bashrc


sudo apt autoremove -y


#==================================================================
#      			      REFERENCES

#touch exists.file
#if [ -f exists.file ] ; then echo "yes" ; else echo "no" ; fi


# # Detect the architecture
# if [[ "$(uname -m)" = "x86_64" ]]; then
#   ARCHITECTURE="x64"
# else
#   ARCHITECTURE="x32"
# fi

# function print_out()
# {
# 	printf "\n$@\n"
# 	#exit 2
# }

