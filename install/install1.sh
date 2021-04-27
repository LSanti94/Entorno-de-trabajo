#!/bin/bash
#root1
echo "Ejecutar script con el usuario root o super usuario"
sleep 5
for i in {5..0};do echo -n "$i." && sleep 1; done
echo -e "\033[1mComenzando en breve........\n\033[0m"
sleep 3
echo ""
echo ""

apt update && apt upgrade -y && apt install -y htop && apt install -y wget curl git && apt install -y zip unzip && apt install -y i3 i3status i3lock dmenu feh compton && apt install -y vim vim-gui-common vim-runtime && apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings && apt install -y terminator && apt install -y firefox-esr && apt install -y scrub

mkdir ~/Descargass && cd ~/Descargass && wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb && export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && dpkg -i *.deb && rm -fr *.deb

cd ~/Descargass ; wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb ; export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && dpkg -i *.deb ; rm -fr *.deb

cd /usr/local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip Hack.zip && rm -fr Hack.zip

cd ~/Descargass ; wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb ; export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && dpkg -i *.deb ; rm -fr *.deb

apt install -y zsh-syntax-highlighting zsh-autosuggestions && mkdir /usr/share/zsh-sudo && cd /usr/share/zsh-sudo && wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh ; chmod +x sudo.plugin.zsh && cd  /usr/share/ && chown ls:ls -R zsh-*

cd /root/ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

apt install -y zsh
