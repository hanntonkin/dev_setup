#!/usr/bin/env bash
#Development environment setup on Mac
# hann@ieee.org
# REF
# 1) make printingout more clean
#


#get admin power
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#==================================================================
#      			      INSTALL APPs
#==================================================================

#Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install mas
mas signin





#==================================================================
#      			      SETTINGS
#==================================================================
# more here ~/osx.sh — Originally from https://mths.be/osx


# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true





