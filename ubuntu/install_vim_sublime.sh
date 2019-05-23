#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd


git clone https://github.com/flazz/vim-colorschemes

mv -f vim-colorschemes/colors/ .vim

rm -rf vim-colorschemes

cp -f ~/dev_setup/dotfiles/vimrc $HOME/.vimrc

cd ~/.vim/bundle/YouCompleteMe

echo "================================"

echo "Extra steps: "

echo "1) open vim and run  :PluginInstall"

echo "2) cd ~/.vim/bundle/YouCompleteMe   and run ./install.py (install cmake and python-dev if needed) "
