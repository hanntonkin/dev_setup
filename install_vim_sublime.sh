#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd


git clone https://github.com/flazz/vim-colorschemes

mv -f vim-colorschemes/colors/ .vim

rm -rf vim-colorschemes

cp -f ~/dev_setup/dotfiles/vimrc $HOME/.vimrc
echo "open vim and run  :PluginInstall"

echo "cd ~/.vim/bundle/YouCompleteMe   python install.py"
