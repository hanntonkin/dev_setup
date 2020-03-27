#!/bin/bash
#Development environment setup in ubuntu
# TODO
# 1) make printingout more clean
#


WORKSPACE="/home/$USER/dev_setup/ubuntu"

sudo cp -f $WORKSPACE/dotfiles/bashrc ~/.bashrc
sudo cp -f $WORKSPACE/dotfiles/bash_aliases ~/.bash_aliases
source ~/.bashrc
