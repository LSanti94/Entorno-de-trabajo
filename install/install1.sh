#!/bin/bash
echo "Ejecutar script con el usuario root o super usuario"
sleep 5
for i in {5..0}; do echo -n "$i." && sleep 1; done
echo -e "\033[1mComenzando en breve........\n\033[0m"
sleep 3
echo -e "\n\n"

# Instalar y actualizar paquetes con sudo
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    htop wget curl git zip unzip \
    i3 i3status i3lock dmenu feh compton \
    vim vim-gui-common vim-runtime \
    sudo lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
    terminator firefox-esr scrub \
    cmatrix network-manager pulseaudio bluez && sudo pulseaudio --start

# Descargar e instalar programas adicionales con sudo
mkdir -p ~/Descargas && cd ~/Descargas
sudo wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && sudo dpkg -i *.deb && sudo rm -fr *.deb

sudo wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && sudo dpkg -i *.deb && sudo rm -fr *.deb

cd /usr/local/share/fonts && sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
sudo unzip Hack.zip && sudo rm -fr Hack.zip

cd ~/Descargas && sudo wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && sudo dpkg -i *.deb && sudo rm -fr *.deb

# Instalar complementos de zsh con sudo
sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions
sudo mkdir -p /usr/share/zsh-sudo && cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo chmod +x sudo.plugin.zsh && cd /usr/share/ && sudo chown cloud-devops:cloud-devops -R zsh-*

# Instalar FZF con sudo
cd /root/ && sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Instalar Zsh
sudo apt install -y zsh
