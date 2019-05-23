#!/bin/bash
#==================================================================
#      			      SUBLIME

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