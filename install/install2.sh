#!/bin/bash
#usuario
echo "Despues del paso 2 ejecutar de nuevo el script pero el paso 3 que te resta"
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
        echo -e "   $RO 1)  $VE Instalción fzf"
        echo -e "   $RO 2)  $VE Instalación ohmyzsh"
        echo -e "   $RO 3)  $VE powerlevel10k"
        echo -e "   $RO 0)  $VE Volver atrás$CL"
        echo ""

    read -p "  → " OPCION
    case $OPCION in

        1)  ## Instalción fzf"
            clear
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            read -p "Pulsa una tecla para continuar" input
            continue;;

        2)  ## Instalación ohmyzsh
            clear
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            read -p "Pulsa una tecla para continuar" input
            continue;;

        3)  ## Themas powerlevel10k
            clear
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
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

