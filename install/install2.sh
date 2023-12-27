#!/bin/bash

echo "Ejecutar sin ser root"

############################
##     INSTRUCCIONES      ##
############################
## Gestiona tareas del servidor apache

############################
##       CONSTANTES       ##
############################
AM="\033[1;33m"  ## Color Amarillo
RO="\033[1;31m"  ## Color Rojo
VE="\033[1;32m"  ## Color Verde
CL="\e[0m"       ## Limpiar colores

# Instalación ohmyzsh
echo -e "$AM 2) Tema powerlevel10k$VE"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && chsh -s $(which zsh) || true

## Tema powerlevel10k
echo -e "$AM 2) Tema powerlevel10k$VE"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## Instalación fzf
echo -e "$AM 1) Instalación fzf$VE"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

echo -e "$VE Proceso completado$CL"