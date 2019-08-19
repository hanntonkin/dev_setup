# Development Environment Setup

A collection of my favorite settings.

## 0 - Git

+ [SSH to Github](https://help.github.com/en/articles/connecting-to-github-with-ssh)
```
sudo apt install -y git
git clone git@github.com:hanntonkin/dev_setup.git
<!-- . dev_setup/ubuntu/setup_git.sh -->
```

## 1 -  Ubuntu

Tested on Ubuntu 16.04 LTS.

```
sudo ./dev_setup/ubuntu/setup.sh
```

* System tools: Terminator, OpenSSH, Vim
<!--
+ [Terminator]() with a lot of great features compared to the default terminal.

+ [Zsh]()

+ [OpenSSH]()

+ [Vim]() for fast editing when ssh to.
+ [Mark my works]() for markdown editing
 -->

* ROS Kinetic
```
. dev_setup/ros/install_ros.sh
```


## 2 - MacOS

```
./dev_setup/osx/macos_setup.sh
```

* Tools: homebrew, iTerm2
* Productivity: Sublime, Latex, Mendeley, Dropbox, Spectacle, Macdown, MS office
* Communication: Chrome, Skype, Slack, WhatsApp, MS Outlook
* Settings: system, finder, autocorrection, iTerm2 (minimal, Lucario)

## 3 - Editor [Sublime Text](https://www.sublimetext.com/)

   <!--  + Install Sublime 3: *sudo ./dev_setup/ubuntu/install_sublime_text.sh*
    + Package Control: Command Palette (ctrl/cmd + shift + p), Install Package Control
    + Install packages: Command Palette, Install Package: Predawn, Material Theme, BracketHighlighter, Anaconda, clang-format
    + Setting: *sudo ./dev_setup/ubuntu/setup_sublime.sh*
 -->
 + Themes: Predawn, Material Theme
 + Python: BracketHighlighter, Anaconda
 + C++: [Clang Format](https://xiaoyuliu.github.io/2018/03/30/20180330-clang-format/)
