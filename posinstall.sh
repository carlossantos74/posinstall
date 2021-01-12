!/usr/bin/env bash

echo "---------------------Iniciando----------------------"

# ----------------------------- VARIÁVEIS ----------------------------- #

echo "---------------------------Pegando Variáveis----------------------"

PPA_PHP_MY_ADMIN= "ppa:phpmyadmin/ppa"
PPA_LUTRIS="ppa:lutris-team/lutris"
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
PPA_OBS_STUDIO="ppa:obsproject/obs-studio"
PPA_SIMPLE_BATTERY="ppa:slimbook/slimbook"
PPA_OPEN_RAZER="ppa:openrazer/stable"
PPA_POLYCHROMATIC=" ppa:polychromatic/stable"


URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_CLIQ="https://downloads.zohocdn.com/chat-desktop/linux/cliq_1.4.6_amd64.deb"
URL_CODE="https://az764295.vo.msecnd.net/stable/91899dcef7b8110878ea59626991a18c8a6a1b3e/code_1.47.3-1595520028_amd64.deb"
URL_DBEAVEAR="https://download.dbeaver.com/community/7.3.1/dbeaver-ce_7.3.1_amd64.deb"
URL_MICRO="https://github-production-release-asset-2e65be.s3.amazonaws.com/53632140/84bb8680-07fb-11eb-8971-a0397105dc9b?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210112T175215Z&X-Amz-Expires=300&X-Amz-Signature=36c2a9ce7bd5741621353681f914ce1f207199acb4088bb10ced58e0c8b03c2b&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=53632140&response-content-disposition=attachment%3B%20filename%3Dmicro-2.0.8-amd64.deb&response-content-type=application%2Foctet-stream"
URL_GITKRAKEN="https://release.axocdn.com/linux/gitkraken-amd64.deb"


DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

# ---------------------------------------------------------------------- #

echo "---------------------Preparando os requisitos para a Instalaçao----------------------"

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
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
sudo apt-add-repository "$PPA_OBS_STUDIO" -y
sudo apt-add-repository "$PPA_PHP_MY_ADMIN" -y
sudo apt-add-repository "$PPA_SIMPLE_BATTERY"
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"
sudo apt install snapd -y 
sudo apt install flatpak -y 
sudo apt install chrome-gnome-shell -y 
sudo add-apt-repository ppa:caffeine-developers/ppa

# ---------------------------------------------------------------------- #

echo "---------------------Iniciando Instalaçao----------------------"

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y

## Criação do diretório de downloads ##

mkdir "$DIRETORIO_DOWNLOADS"

## Download e instalaçao de programas externos ##

wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_CLIQ"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_CODE"     -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_DBEAVEAR" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MICRO" -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GITKRAKEN" -P "$DIRETORIO_DOWNLOADS" 

## ------------------- Instalando pacotes .deb baixados na sessão anterior ----------------- ##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## ----------------------------- Instalando pacotes Snap ------------------------------------##
sudo snap install sublime-text --classic
sudo snap install mailspring
sudo snap install telegram-desktop
sudo snap install datagrip --classic
sudo snap install discord --classic 
sudo snap install atom --classic 
sudo snap install figma-linux

## ------------------------- Instalando programas do repositorio ----------------------------##
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



#------------------------------ Node JS -------------------------------------# 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs


#----------------------------- spotify -------------------------------------# 
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get install spotify-client -y 

#----------------------------- Insomnia -------------------------------------# 

# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get install insomnia -y

#----------------------------- Brave Browser -------------------------------------# 

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get install brave-browser -y


# ----------------------------- TOUCHPAD ----------------------------- #

sudo gpasswd -a $USER input
sudo apt-get install xdotool wmctrl

git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo ./libinput-gestures-setup install

libinput-gestures-setup start
libinput-gestures-setup autostart

git clone https://gitlab.com/cunidev/gestures
cd gestures
sudo python3 setup.py install



# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #

## Finalização, atualização e limpeza##

flatpak update -y
sudo rm /var/cache/fontconfig/*
sudo rm ~/.cache/fontconfig/*
sudo apt-get -f install 
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

echo "---------------------FINALIZADO----------------------"

# ---------------------------------------------------------------------- #
