#!/usr/bin/env bash
#Development environment setup on Mac
# hann@ieee.org
# REF
# 1) make printingout more clean
#


#get admin power
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "DEVELOPMENT TOOLs -------------------------"
echo ""
#Homebrew
if [ -d '/usr/local/Homebrew' ]; then
	echo "Homebrew installed";
else
	# echo "Homebrew not found";
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# brew install mas
	# mas not working now ~~ from 13+
	# find app: brew search
fi



# make Jekyll work locally



# https://medium.freecodecamp.org/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38
# https://medium.com/@mrkdsgn/install-zsh-and-oh-my-zsh-on-osx-10-11-el-capitan-cfaa0ebb97dc
#iTerm2
if [ -d '/Applications/iTerm.app' ]; then
	echo "iTerm2 installed";
else
	# echo "iTerm2 not found";
	brew cask install iterm2
fi


#zsh
if [ -L '/usr/local/bin/zsh' ]; then
	echo "Zsh installed";
else
	echo "Zsh not found";
	brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	# sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
	brew install tree


	#install powerfont
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts

	# bring in my custom dotfile
	cp -f zshrc ~/.zshrc
	source ~/.zshrc 
	# Set iterm profile color to solarized dark
	# Open ITerm2 > Preferences > Profiles > Text > Change Font and set it to something that has “for Powerline”. I’m choosing “Meslo LG DZ for Powerline” font.

	
fi



#setup github for mac
# setup also .gitignore .gitconfig

# Docker
# brew install docker
# brew install boot2docker

echo ""
echo "PRODUCTIVITY ------------------------------"
echo ""

# Sublime
if [ -d '/Applications/Sublime Text.app' ]; then
	echo "Sublime installed";
else
	echo "Try to install sublime now";
	# brew cask install --appdir="/Applications" sublime-text
	# sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
fi

#Latex
if [ -d '/Library/TeX' ]; then
	echo "Latex installed?";
else
	echo "Latex not found?";
	# next time tryz
	# brew cask install mactex-no-gui
fi

#skim

#open -a "/Applications/App Store.app"
# Word, excel, powerpoint => mas not working now
# Matlab

# Mendeley Desktop.app
# brew cask install mendeley



#macdown
if [ -d '/Applications/Macdown.app' ]; then
	echo "Macdown installed";
else
	# echo "Macdown not found";
	brew cask install --appdir="/Applications" macdown
	
fi


#Dropbox

echo ""
echo "COMMUNICATION -----------------------------"
echo ""

# brew cask install --appdir="/Applications" slack
# whatsapp


#Chrome
if [ -d '/Applications/Google Chrome.app' ]; then
	echo "Chrome installed";
else
	# echo "Chrome not found";
	brew cask install google-chrome
fi

#Skype
if [ -d '/Applications/Skype.app' ]; then
	echo "Skype installed";
else
	echo "Skype not found";
	brew cask install --appdir="/Applications" skype
fi


echo ""
echo "MEDIA -------------------------------------"
echo ""

# VLC
#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape




echo ""
echo "SETTINGS ----------------------------------"
echo ""

#-------------------------------------------------
#Base system
# more here ~/osx.sh — Originally from https://mths.be/osx

# # Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

# sudo scutil --set HostName "hanns-mac"
# sudo scutil --set ComputerName "Hann's Mac"
# sudo scutil --set LocalHostName "hanns-mac"






