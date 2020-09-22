#!/bin/bash
# hann@ieee.org
# http://hann.work


WORKSPACE="/home/$USER/dev_setup"

echo "VS code extentions ---------"
list_extensions="$(code --list-extensions)"
if [[ $list_extensions == "" ]]; then
	echo " install extentions for vs code"

	code --install-extension ms-vscode.cpptools
	code --install-extension ms-python.python
	code --install-extension xaver.clang-format
	code --install-extension ms-vscode.theme-predawnkit
	# code --uninstall-extension ms-vscode.theme-predawnkit
fi
code --list-extensions

echo " setting up"
cp -rf $WORKSPACE/ubuntu/config/Code/settings.json $HOME/.config/Code/User/