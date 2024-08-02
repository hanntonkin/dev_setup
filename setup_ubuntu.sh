#!/bin/bash
# hann@ieee.org

function install {
    app=$1; method=$2; opt=$3
    if [[  -f "/usr/bin/${app}" ]] || [[  -f "/snap/bin/${app}" ]]; then
        echo " $app installed"
    else
        echo " install $app"
        sudo $method install $app $opt
    fi
}

WORKSPACE=$(pwd)
install sublime-text snap --classic
install obsidian snap --classic
install code snap --classic


#----
list_extensions="$(code --list-extensions)"
if [[ $list_extensions == "" ]]; then
	code --install-extension ms-vscode.cpptools
	code --install-extension xaver.clang-format
	code --install-extension ms-python.python
	code --install-extension ms-vscode.theme-predawnkit
	code --install-extension ms-vscode-remote.vscode-remote-extensionpack
	#code --install-extension james-yu.latex-workshop
	#code --uninstall-extension ms-vscode.theme-predawnkit
fi
