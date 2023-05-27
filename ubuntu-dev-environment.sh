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

#setting greeter monitor infos
sudo cp ~/.config/monitors.xml ~gdm/.config/

# first lets update everything
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y

# adding repositories
sudo apt-add-repository ppa:graphics-drivers/ppa -y

#first let's install some stuff to make another stuff work or to controll system
sudo apt-get update && sudo apt install curl -y && sudo apt-get install git zsh vim htop filezilla mc -y
sudo apt-get install ttf-mscorefonts-installer ubuntu-restricted-extras libavcodec-extra libav-tools -y

#python
sudo apt-get install python3.9 pip3 python3-mysql.connector -y

#updater stuff
wget -qO- https://raw.githubusercontent.com/hfabio/updater-stuff/master/install.sh | bash

# then the IDE, browser and stuffs ---------------------------------------------
# VSCODE
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
# github desktop
wget https://github.com/shiftkey/desktop/releases/download/release-2.4.1-linux1/GitHubDesktop-linux-2.4.1-linux1.deb -O /tmp/github_desktop.deb
# TeamViewer
wget -c https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O /tmp/teamviewer.deb
# google chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google_chrome.deb
# discord
wget https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb -O /tmp/discord.deb

# now installing .deb stuff ----------------------------------------------------
clear_and_print 'now installing .deb stuff'
sudo chmod 775 /tmp/*.deb
sudo dpkg -i /tmp/*.deb || sudo apt-get --fix-broken install -y && sudo dpkg -i /tmp/*.deb

# now installing no important stuff like games or music ------------------------
clear_and_print 'now installing no important stuff like games or music'
# removing stuff and adding ppas------------------
sudo apt-get autoremove gimp gimp-plugin-registry
sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt update
# end removing stuff and adding ppas------------------

# gimp
sudo apt-get update
sudo apt-get install gimp -y

# gnome-tweaks
sudo apt install gnome-tweaks -y

# font cascadia
sudo wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/Cascadia.ttf -O /usr/share/fonts/truetype/Cascadia.ttf
sudo wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaMono.ttf -O /usr/share/fonts/truetype/CascadiaMono.ttf
sudo wget https://github.com/microsoft/cascadia-code/releases/download/v1911.21/CascadiaMonoPL.ttf -O /usr/share/fonts/truetype/CascadiaMonoPL.ttf

# font menlo for terminal fix
sudo wget https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf -O /usr/share/fonts/truetype/Menlo\ for\ Powerline.ttf

# then the languages/compilers -------------------------------------------------
clear_and_print 'installing dev stuff'

# installing docker
clear_and_print 'installing docker'
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "Docker and docker compose successfully installed"
docker --version
docker-compose --version

clear_and_print 'installing nvm'

#nvm install
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

#-------------------------------------------------------------------------------
# finishing  -------------------------------------------------------------------
clear_and_print 'Finishing with another update and then autoclean autoremove'
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoclean -y && sudo apt-get autoremove -y

# lets install
clear_and_print 'Lets install zsh with configurated theme\nPay attention, you will need to insert your password here...'
sudo apt-get install fonts-powerline -y
wget https://raw.githubusercontent.com/Viniciusalopes/zsh-magic-install/master/zsh-magic-install -O /tmp/zsh-magic-install.sh
sudo chmod 775 /tmp/zsh-magic-install.sh
/tmp/zsh-magic-install.sh
echo 'pay attention to change the theme and add zinit like here https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/'
