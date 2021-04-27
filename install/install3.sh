#!/bin/bash
#como root
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

while :
    do
        clear

        echo ""
        echo -e "             $AM Apache2 $RO"
        echo ""
        echo -e "   $RO 1)  $VE Instalacion powerlevel10k"
        echo -e "   $RO 2)  $VE borrar .zshrc"
        echo -e "   $RO 3)  $VE enlace simbolico"
        echo -e "   $RO 0)  $VE Volver atrás$CL"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  ## Instalción powerlevel10"
            clear
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            read -p "Pulsa una tecla para continuar" input
            continue;;

        2)  ## Borrar zshrc root"
            clear
            rm -fr /root/.zshrc
            read -p "Pulsa una tecla para continuar" input
            continue;;
        3)  ## Instalción enlace simbolico"
            clear
            cd
            ln -s -f /home/ls/.zshrc .zshrc
            read -p "Pulsa una tecla para continuar" input
            continue;;
        0)  ## Volver Atrás
            clear
            break;;

        *)  ## Cualquier otra opción que no sea las anteriores
            clear
            echo ""
            echo -e "$RO La opción elegida no es válida$AM introduce otra"
            read -p "Pulsa una tecla para continuar" input;;
    esac
done
