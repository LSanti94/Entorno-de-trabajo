#!/bin/bash
#como root
#!/bin/bash

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

## Instalación powerlevel10k
echo -e "$AM 1) Instalación powerlevel10k$VE"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/themes/powerlevel10k

## Enlace simbólico para root
echo -e "$AM 3) Enlace simbólico para root$VE"
sudo ln -s -f /home/cloud-devops/.zshrc /root/.zshrc && sudo chsh -s $(which zsh)

echo -e "$VE Proceso completado$CL"