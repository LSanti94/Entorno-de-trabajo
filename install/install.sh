#!/bin/bash
set -e

USUARIO_REAL=${SUDO_USER:-$USER}
HOME_USUARIO=$(eval echo "~$USUARIO_REAL")

AM="\033[1;33m"
RO="\033[1;31m"
VE="\033[1;32m"
CL="\e[0m"

# ==========================
# VALIDACIONES INICIALES
# ==========================
if [ "$EUID" -ne 0 ]; then
  echo -e "$RO Este script debe ejecutarse con sudo$CL"
  exit 1
fi

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

paquete_instalado() {
  dpkg -l | grep -q "^ii  $1 "
}

# ==========================
# ROOT
# ==========================
instalar_root() {
  echo -e "$AM Instalando paquetes del sistema...$CL"

  apt update

  PAQUETES=(
    htop wget curl git zip unzip
    i3 i3status i3lock dmenu feh compton
    vim vim-gui-common vim-runtime
    sudo lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
    terminator firefox-esr scrub
    cmatrix network-manager pulseaudio bluez
    zsh zsh-syntax-highlighting zsh-autosuggestions
  )

  for pkg in "${PAQUETES[@]}"; do
    if paquete_instalado "$pkg"; then
      echo -e "$VE ✔ $pkg ya instalado$CL"
    else
      echo -e "$AM Instalando $pkg...$CL"
      apt install -y "$pkg"
    fi
  done

  pulseaudio --start || true

  mkdir -p /tmp/paquetes && cd /tmp/paquetes

  instalar_deb() {
    URL=$1
    ARCHIVO=$(basename "$URL")

    if ! command_exists "${ARCHIVO%%-*}"; then
      wget -q "$URL"
      dpkg -i "$ARCHIVO" || apt -f install -y
      rm -f "$ARCHIVO"
    else
      echo -e "$VE ✔ $(basename "$ARCHIVO") ya instalado$CL"
    fi
  }

  instalar_deb https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
  instalar_deb https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb

  FONT_DIR="/usr/local/share/fonts"
  if [ ! -d "$FONT_DIR/Hack" ]; then
    mkdir -p "$FONT_DIR"
    cd "$FONT_DIR"
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip -q Hack.zip
    rm Hack.zip
  else
    echo -e "$VE ✔ Hack Nerd Font ya existe$CL"
  fi

  ZSH_SUDO="/usr/share/zsh-sudo"
  if [ ! -f "$ZSH_SUDO/sudo.plugin.zsh" ]; then
    mkdir -p "$ZSH_SUDO"
    cd "$ZSH_SUDO"
    wget -q https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
    chmod +x sudo.plugin.zsh
    chown -R "$USUARIO_REAL:$USUARIO_REAL" /usr/share/zsh-*
  fi
}

# ==========================
# USUARIO
# ==========================
instalar_usuario() {
  echo -e "$AM Configurando Zsh para $USUARIO_REAL ...$CL"

  sudo -u "$USUARIO_REAL" bash <<EOF
    if [ ! -d "$HOME_USUARIO/.oh-my-zsh" ]; then
      sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
    else
      echo "✔ oh-my-zsh ya instalado"
    fi

    if [ ! -d "$HOME_USUARIO/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        $HOME_USUARIO/.oh-my-zsh/custom/themes/powerlevel10k
    else
      echo "✔ powerlevel10k ya existe"
    fi

    if [ ! -d "$HOME_USUARIO/.fzf" ]; then
      git clone --depth 1 https://github.com/junegunn/fzf.git $HOME_USUARIO/.fzf
      $HOME_USUARIO/.fzf/install --all
    else
      echo "✔ fzf ya existe"
    fi

    chsh -s \$(which zsh)
EOF
}

# ==========================
# ROOT ZSH
# ==========================
instalar_root_zsh() {
  echo -e "$AM Configurando Zsh para root...$CL"

  if [ ! -d "/root/.oh-my-zsh" ]; then
    sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
  fi

  if [ ! -d "/root/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
      /root/.oh-my-zsh/custom/themes/powerlevel10k
  fi

  ln -sf "$HOME_USUARIO/.zshrc" /root/.zshrc
  chsh -s "$(which zsh)"
}

# ==========================
# EJECUCIÓN
# ==========================
echo -e "$VE Iniciando instalación con validaciones...$CL"

instalar_root
instalar_usuario
instalar_root_zsh

echo -e "$VE Instalación completada con éxito ✔$CL"
