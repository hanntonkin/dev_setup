# Development Environment Setup

A collection of my favorite settings.

```
sudo apt install -y git
git clone git@github.com:hanntonkin/dev_setup.git
```

## 1 -  Ubuntu

Most of my work are on Ubuntu 16.04. Install here

```
sudo ./dev_setup/ubuntu/setup.sh
```

* System tools

+ [Terminator]() with a lot of great features compared to the default terminal.

+ [Zsh]()

+ [OpenSSH]()

+ [Vim]() for fast editing when ssh to.
+ [Mark my works]() for markdown editing


* ROS

Install ROS kinetic
```
. dev_setup/ros/install_ros.sh
```
* Git and [github ssh](https://help.github.com/articles/connecting-to-github-with-ssh/)

```
. dev_setup/ubuntu/setup_git.sh
```


## 2 - MacOS

```
./dev_setup/macos_setup.sh
```

* MS office
* Matlab
* Spectacle for controlling the windows

## [Sublime Text](https://www.sublimetext.com/) as the main text editor.

    + Install Sublime 3: *sudo ./dev_setup/ubuntu/install_sublime_text.sh*
    + Package Control: Command Palette (ctrl/cmd + shift + p), Install Package Control
    + Install packages: Command Palette, Install Package: Predawn, Material Theme, BracketHighlighter, Anaconda, clang-format
    + Setting: *sudo ./dev_setup/ubuntu/setup_sublime.sh*
