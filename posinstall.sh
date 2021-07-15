!/usr/bin/env bash

PPA_LUTRIS="ppa:lutris-team/lutris"
PPA_OBS_STUDIO="ppa:obsproject/obs-studio"
PPA_TIMESHIFT="ppa:teejee2008/timeshift"
PPA_DIODON="ppa:diodon-team/stable"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_CODE="https://az764295.vo.msecnd.net/stable/91899dcef7b8110878ea59626991a18c8a6a1b3e/code_1.47.3-1595520028_amd64.deb"
URL_DBEAVEAR="https://download.dbeaver.com/community/7.3.1/dbeaver-ce_7.3.1_amd64.deb"
URL_MICRO="https://github-production-release-asset-2e65be.s3.amazonaws.com/53632140/84bb8680-07fb-11eb-8971-a0397105dc9b?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210112T175215Z&X-Amz-Expires=300&X-Amz-Signature=36c2a9ce7bd5741621353681f914ce1f207199acb4088bb10ced58e0c8b03c2b&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=53632140&response-content-disposition=attachment%3B%20filename%3Dmicro-2.0.8-amd64.deb&response-content-type=application%2Foctet-stream"
URL_GITKRAKEN="https://release.axocdn.com/linux/gitkraken-amd64.deb"
URL_EDGE="https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-beta/microsoft-edge-beta_92.0.902.45-1_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock


## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

## GtkMenuShells // GtkMenuItems ##
sudo apt install appmenu-gtk2-module

## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e suporte a Snap, Flatpak e extensão gnome##
sudo add-apt-repository "$PPA_LUTRIS" -y
sudo apt-add-repository "$PPA_OBS_STUDIO" -y
sudo apt install snapd -y 
sudo apt install flatpak -y 
sudo apt install chrome-gnome-shell -y 
sudo add-apt-repository ppa:caffeine-developers/ppa

sudo apt update -y

mkdir "$DIRETORIO_DOWNLOADS"

wget -c "$URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_CODE" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DBEAVEAR" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MICRO" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GITKRAKEN" -P "$DIRETORIO_DOWNLOADS" 

sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo snap install sublime-text --classic
sudo snap install mailspring
sudo snap install telegram-desktop
sudo snap install discord --classic

sudo apt-get install gnome-sushi -y
sudo apt-get install gnome-tweak-tool -y
sudo apt-get install git -y 
sudo apt-get install gparted -y 
sudo apt-get install obs-studio -y 
sudo apt-get install lutris -y
sudo apt-get install flameshot -y 
sudo apt-get install filezilla -y 
sudo apt-get install zsh -y
sudo apt-get install transmission -y 
sudo apt-get install apt-transport-https curl -y
sudo apt-get install tilix -y 
sudo apt-get install libre-office -y
sudo apt-get install vim -y
sudo apt-get install gimp -y
sudo apt-get install inkscape -y
sudo apt-get install slimbookbattery -y
sudo apt-get install gnome-boxes -y 
sudo apt-get install firefox -y 
sudo apt-get install python3 -y
sudo apt-get install openrazer-meta -y
sudo apt-get install polychromatic -y 
sudo apt-get install neofetch -y
sudo apt-get install virtualbox -y
sudo apt-get install piper -y
sudo apt-get install caffeine -y
sudo apt-get install gitg -y
sudo apt-get install timeshift -y
sudo apt-get install diodon -y

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

## Finalização, atualização e limpeza##
flatpak update -y
sudo rm /var/cache/fontconfig/*
sudo rm ~/.cache/fontconfig/*
sudo apt-get -f install 
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

