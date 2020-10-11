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
sudo apt install flatpak 0y 
sudo apt install chrome-gnome-shell -y 
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


#------------------------------ Node JS -------------------------------------# 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs


#----------------------------- sportify -------------------------------------# 
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
