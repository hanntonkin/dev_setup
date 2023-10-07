#!/usr/bin/env bash
# Development environment setup on Mac
# hann@ieee.org
# TODO
# 1) make printingout more clean
# 2) what is missing? word, exel, powerpoint, matlab, keynote?


#get admin power
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "DEVELOPMENT TOOLs -------------------------"
# Homebrew
if [ -d '/opt/homebrew' ]; then
	echo "Homebrew";
else
	# echo "Homebrew not found";
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# brew install mas
	# mas not working now ~~ from 13+
	# find app: brew search
fi


# https://medium.freecodecamp.org/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38
# https://medium.com/@mrkdsgn/install-zsh-and-oh-my-zsh-on-osx-10-11-el-capitan-cfaa0ebb97dc

# iTerm2
if [ -d '/Applications/iTerm.app' ]; then
	echo "iTerm2";
else
	echo "iTerm2 not found";
	brew install --appdir="/Applications" iterm2

	# theme minimal
	# Install the Solarized Dark theme for iTerm
	#open "${HOME}/dev_setup/osx/themes/Solarized_Dark.itermcolors"

	# Don’t display the annoying prompt when quitting iTerm
	defaults write com.googlecode.iterm2 PromptOnQuit -bool false
fi





# setup github for mac
# setup also .gitignore .gitconfig

# Docker
# brew install docker
# brew install boot2docker

# brew cask install virtualbox

echo ""
echo "PRODUCTIVITY ------------------------------"

# Sublime
if [ -d '/Applications/Sublime Text.app' ]; then
	echo "Sublime";
else
	echo "Try to install sublime now";
	brew install --appdir="/Applications" sublime-text
	#sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
	# ~/Library/Application Support/Sublime Text 3/Packages/User
fi

# Microsoft Office
if [ -d '/Applications/Microsoft Word.app' ]; then
    echo "Microsoft Word";
else
    echo "Microsoft Word not found?";
fi

if [ -d '/Applications/Microsoft Excel.app' ]; then
    echo "Microsoft Excel";
else
    echo "Microsoft Excel not found?";
fi

if [ -d '/Applications/Microsoft OneNote.app' ]; then
    echo "Microsoft OneNote";
else
    echo "Microsoft OneNote not found?";
fi

# Latex
if [ -d '/Library/TeX' ]; then
	echo "Latex";
else
	echo "Latex not found?";
	# next time try
	# brew cask install mactex-no-gui
fi

#skim

#open -a "/Applications/App Store.app"
# Word, excel, powerpoint => mas not working now
# Matlab

#Mendeley
if [ -d '/Applications/Mendeley Desktop.app' ]; then
	echo "Mendeley";
else
	echo "Mendeley not found?";
	brew install --appdir="/Applications" mendeley
fi



#macdown
if [ -d '/Applications/Macdown.app' ]; then
	echo "Macdown";
else
	echo "Macdown not found?";
	#brew install --appdir="/Applications" macdown

fi


#Dropbox
if [ -d '/Applications/Dropbox.app' ]; then
	echo "Dropbox";
else
	echo "Dropbox not found?";
	brew install --appdir="/Applications" dropbox

fi


#Spectacle
# if [ -d '/Applications/Spectacle.app' ]; then
# 	echo "Spectacle";
# else
# 	echo "Spectacle not found?";
# 	brew install --appdir="/Applications" spectacle
# fi

if [ -d '/Applications/Rectangle.app' ]; then
	echo "rectangle";
else
	echo "rectangle not found?";
	brew install --cask rectangle
fi


echo ""
echo "COMMUNICATION -----------------------------"



#Chrome
if [ -d '/Applications/Google Chrome.app' ]; then
	echo "Chrome";
else
	echo "Chrome not found";
	brew install --appdir="/Applications" google-chrome
fi


if [ -d '/Applications/Microsoft Outlook.app' ]; then
    echo "Microsoft Outlook";
else
    echo "Microsoft Outlook not found?";
fi




#Skype
if [ -d '/Applications/Skype.app' ]; then
	echo "Skype";
else
	echo "Skype not found";
	#brew install --appdir="/Applications" skype
fi

#Slack
if [ -d '/Applications/Slack.app' ]; then
	echo "Slack";
else
	echo "Slack not found";
	#brew install --appdir="/Applications" slack
fi

#WhatsApp
if [ -d '/Applications/WhatsApp.app' ]; then
	echo "WhatsApp";
else
	echo "WhatsApp not found";
	brew install --appdir="/Applications" whatsapp
fi

# echo ""
# echo "MEDIA -------------------------------------"

# VLC
#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape




echo ""
echo "SETTINGS ----------------------------------"

#-------------------------------------------------
#Base system
# more here ~/osx.sh — Originally from https://mths.be/osx

echo "Disable the bootup sound"
sudo nvram SystemAudioVolume=" "

echo "Automatically hide Dock"
defaults write com.apple.dock autohide -bool true

echo "Change name to tonkin"
sudo scutil --set HostName "tonkin"
sudo scutil --set ComputerName "Hann's Mac"
sudo scutil --set LocalHostName "tonkin"



echo "Set Home as the default location"
# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"



echo "Adjust Autocorrection"                                                          #

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false



echo "Adjust Finder"
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true


# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true


echo "Setup git"
git config --global user.email "hann@ieee.org"
git config --global user.name "hanntonkin"


