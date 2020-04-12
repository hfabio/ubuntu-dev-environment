#!/bin/bash
# function to clear screen and print a message before next step
clear_and_print()
{
  clear
  echo $1
}

#making useful directories
clear_and_print 'creating folders'
mkdir ~/PWAs
mkdir ~/Projetos
mkdir ~/ISOs

clear_and_print 'removing lockers'
# removing locks from SO
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock ;
sudo dpkg --add-architecture i386
sudo dpkg --configure -a

# first lets update everything
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y

# adding repositories
sudo apt-add-repository ppa:graphics-drivers/ppa -y

#first let's install some stuff to make another stuff work or to controll system
sudo apt-get update && sudo apt install curl -y && sudo apt-get install git zsh vim htop filezilla -y
sudo apt-get install ttf-mscorefonts-installer ubuntu-restricted-extras libavcodec-extra libav-tools -y

# then the languages/compilers -------------------------------------------------
clear_and_print 'installing dev stuff'
# php
sudo apt-get install apache2 php7.2 php-mysql php-xdebug -y

# mysql
sudo apt-get install mysql-server-5.7 mysql-client-5.7 mysql-workbench mysql-workbench-data -y

# nodejs 12.16.2
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.profile
nvm install 12.16.2
#-------------------------------------------------------------------------------
#curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
#sudo apt-get install nodejs -y

# npm
#sudo apt-get install npm -y
#-------------------------------------------------------------------------------

#yarn
sudo npm i -g yarn

#python
sudo apt-get install python3.7 pip3 python3-mysql.connector -y

# then the IDE, browser and stuffs ---------------------------------------------
# VSCODE
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
# TeamViewer
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O /tmp/teamviewer.deb
# google chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google_chrome.deb
# Insync
wget https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.1.2.40785-bionic_amd64.deb -O /tmp/insync_3.1.2.deb
# Dropbox
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb -O /tmp/dropbox.deb
# skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb -O /tmp/skypeforlinux.deb
# discord
wget https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb -O /tmp/discord.deb
# 4k video downloader
wget https://dl.4kdownload.com/app/4kvideodownloader_4.9.2-1_amd64.deb -O /tmp/4kvideodownloader.deb
# create-react-app
sudo npm i -g create-react-app

# now installing .deb stuff ----------------------------------------------------
clear_and_print 'now installing .deb stuff'
sudo chmod 775 /tmp/*.deb
sudo dpkg -i /tmp/*.deb || sudo apt-get --fix-broken install -y && sudo dpkg -i /tmp/*.deb

# now installing no important stuff like games or music ------------------------
clear_and_print 'now installing no important stuff like games or music'
# removing stuff and adding ppas------------------
sudo apt-get autoremove gimp gimp-plugin-registry
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo add-apt-repository ppa:kritalime/ppa -y
sudo add-apt-repository ppa:kdenlive/kdenlive-stable -y
sudo add-apt-repository ppa:lutris-team/lutris -y
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key -y
sudo apt update
# end removing stuff and adding ppas------------------

# Nativifier (to create PWAs)
sudo npm i -g nativefier

# gimp
sudo apt-get update
sudo apt-get install gimp -y

# gnome-tweaks
sudo apt install gnome-tweaks -y

# font cascadia
sudo wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf -O /usr/share/fonts/truetype/Cascadia.ttf

# Steam
sudo apt install steam-installer steam-devices steam:i386 -y

# Wine
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

# Lutris
sudo apt-get install lutris libvulkan1 libvulkan1:i386 -y

# krita e kdenlive
sudo apt-get install krita kdenlive -y

# finishing  -------------------------------------------------------------------
clear_and_print 'Finishing with another update and then autoclean autoremove'
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y

# lets install
clear_and_print 'Lets install zsh with configurated theme'
sudo apt-get install fonts-powerline -y
wget https://raw.githubusercontent.com/Viniciusalopes/zsh-magic-install/master/zsh-magic-install -O /tmp/zsh-magic-install.sh
sudo chmod 775 /tmp/zsh-magic-install.sh
sudo /tmp/zsh-magic-install.sh