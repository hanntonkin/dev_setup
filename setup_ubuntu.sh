#!/bin/bash
#Development environment setup in ubuntu
# TODO
# 1) check software installed before install them
# 2) make printingout more clean
#

#==================================================================
#      			      FUNCTIONS

# Detect the architecture
if [[ "$(uname -m)" = "x86_64" ]]; then
  ARCHITECTURE="x64"
else
  ARCHITECTURE="x32"
fi

function print_out()
{
	printf "\n$@\n"
	#exit 2
}



#==================================================================
#      			      MAIN FUNCTION
print_out '------------------------------------------'
print_out ' Install git, curl, terminator '


#TOOLS
sudo apt install -y curl

sudo apt-get install -y terminator
# write force_color_prompt=yes to .bashrc


#Text editor (VIM + Sublime)
sudo apt-get install -y vim

DIR='/opt/sublime_text'
if [ -d $DIR ]; 
  then 
	echo "Sublime Text 3 installed";
  else
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	echo "Sublime Text 3 installed";
#install sublime https://gist.github.com/simonewebdesign/8507139
fi

sudo apt autoremove -y


#==================================================================
#      			      REFERENCES

#touch exists.file
#if [ -f exists.file ] ; then echo "yes" ; else echo "no" ; fi

