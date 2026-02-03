<!DOCTYPE html>
<html>
<body>
<h1>Entorno de Trabajo Automatizado 🛠️</h1>
<p>
Script en <strong>bash</strong> para convertir una instalación mínima de Linux
en un <strong>entorno de trabajo personalizado y profesional</strong>.
Incluye herramientas como <strong>i3wm</strong>, <strong>powerlevel10k</strong>
y utilidades esenciales.
</p>
<h2>🚀 Características</h2>
<ul>
  <li>Automatiza la instalación de paquetes esenciales.</li>
  <li>Configura entorno gráfico y consola.</li>
  <li>Soporta múltiples distribuciones basadas en Debian.</li>
  <li>Instalación guiada paso a paso.</li>
</ul>
<h2>🧪 Distribuciones probadas</h2>
<ul>
  <li>Kali Linux</li>
  <li>Parrot OS</li>
  <li>Ubuntu</li>
  <li>Debian</li>
  <li>Xubuntu</li>
  <li>Lubuntu</li>
</ul>
<h2>🧰 Requisitos</h2>
<ul>
  <li>Instalación limpia de Linux (recomendado).</li>
  <li>Conexión a internet.</li>
  <li>Usuario con permisos de <strong>root</strong>.</li>
</ul>

<h2>📥 Instalación Mejorar</h2>

<pre>
git clone https://github.com/LSanti94/Entorno-de-trabajo.git
cd Entorno-de-trabajo/install
sudo bash install.sh
</pre>

<h2>⚙️ Configuración posterior</h2>
<ul>
  <li>Cambiar shell a zsh:
    <pre>chsh -s $(which zsh)</pre>
  </li>
  <li>Configurar powerlevel10k según tus preferencias.</li>
</ul>

<h2>⌨️ Atajos de teclado</h2>

<table border="1" cellpadding="5">
  <tr>
    <th>Atajo</th>
    <th>Acción</th>
  </tr>
  <tr>
    <td>Mod + Enter</td>
    <td>Abrir Terminal</td>
  </tr>
  <tr>
    <td>Mod + Shift + espacio</td>
    <td>Ventana flotante</td>
  </tr>
  <tr>
    <td>Mod + Shift + espacio</td>
    <td>Vuelve a su sitio</td>
  </tr>
  <tr>
    <td>Mod + clic</td>
    <td>Clic derecho para agrandar y achicar la ventana</td>
  </tr>
  <tr>
    <td>Mod + Shift + q</td>
    <td>Cerrar ventana flotante</td>
  </tr>
  <tr>
    <td>Mod + v</td>
    <td>Próxima ventana en abrir será verticalmente</td>
  </tr>
  <tr>
    <td>Mod + h</td>
    <td>Próxima ventana en abrir será horizontal</td>
  </tr>
  <tr>
    <td>Mod + f</td>
    <td>Poner una ventana en pantalla completa</td>
  </tr>
  <tr>
    <td>Mod + s</td>
    <td>Maximizar ventanas en vertical</td>
  </tr>
  <tr>
    <td>Mod + w</td>
    <td>Maximizar ventanas en horizontal o pestañas</td>
  </tr>
  <tr>
    <td>Mod + e</td>
    <td>Restaurar disposición anterior de ventanas</td>
  </tr>
  <tr>
    <td>Mod + Shift + e</td>
    <td>Cerrar sesión</td>
  </tr>
  <tr>
    <td>Mod + Shift + b</td>
    <td>Bloquear la computadora o laptop</td>
  </tr>
  <tr>
    <td>Mod + r</td>
    <td>Agrandar o achicar la ventana con flechas</td>
  </tr>
  <tr>
    <td>Mod + Shift + f</td>
    <td>Firefox</td>
  </tr>
</table>

<p><em>(Mod es la tecla Windows/Super)</em></p>

<h2>📥 Instalación manual</h2>

<p>
Se recomienda realizar la instalación en una ISO nueva (preferiblemente minimal).
Si estás usando una máquina virtual, crea un <strong>snapshot</strong> antes de continuar.
Todos los pasos deben ejecutarse como <strong>root</strong>, salvo donde se indique lo contrario.
</p>

<h3>1) Instalación de entorno gráfico y herramientas básicas</h3>
<pre><code>
apt update && apt upgrade -y
apt install -y htop wget curl git zip unzip
apt install -y i3 i3status i3lock dmenu feh compton
apt install -y vim vim-gui-common vim-runtime
apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
apt install -y terminator firefox-esr scrub cmatrix
</code></pre>

<h3>2) Instalación de lsd</h3>
<pre><code>
mkdir ~/Descargas && cd ~/Descargas
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb
dpkg -i *.deb
rm -f *.deb
</code></pre>

<h3>3) Instalación de bat</h3>
<pre><code>
cd ~/Descargas
wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb
dpkg -i *.deb
rm -f *.deb
</code></pre>

<h3>4) Instalación de fuente Hack Nerd Font</h3>
<pre><code>
cd /usr/local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
rm -f Hack.zip
fc-cache -fv
</code></pre>

<h3>5) Instalación de fzf (root)</h3>
<pre><code>
git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
/root/.fzf/install
</code></pre>

<h3>6) Zsh + Oh My Zsh + Powerlevel10k (usuario)</h3>
<p><strong>Instalar zsh como root:</strong></p>
<pre><code>
apt install -y zsh
</code></pre>

<p><strong>Como usuario normal:</strong></p>
<pre><code>
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
</code></pre>

<p>
Editar el archivo <code>~/.zshrc</code> y cambiar:
</p>
<pre><code>
ZSH_THEME="powerlevel10k/powerlevel10k"
</code></pre>

<h3>7) Instalación de fzf (usuario)</h3>
<pre><code>
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
</code></pre>

<h3>8) Powerlevel10k para root</h3>
<pre><code>
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
</code></pre>

<p>Borrar configuración previa de root:</p>
<pre><code>
rm -f /root/.zshrc
ln -s /home/ls/.zshrc /root/.zshrc
</code></pre>

<h2>🖼 Vista final del entorno</h2>

<p>Ejemplo del entorno configurado luego de finalizar la instalación:</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/LSanti94/Entorno-de-trabajo/main/Vista%20Final/Fondo%20de%20pantalla.JPG" 
       alt="Fondo de pantalla del entorno configurado" width="800">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/LSanti94/Entorno-de-trabajo/main/Vista%20Final/Descripci%C3%B3n2.JPG" 
       alt="Descripción del entorno de trabajo" width="800">
</p>

<h2>👤 Autor</h2>
<p>
  <strong>LSanti94</strong><br>
  GitHub: 
  <a href="https://github.com/LSanti94" target="_blank" rel="noopener noreferrer">
    https://github.com/LSanti94
  </a>
</p>

<h2>🙌 Créditos</h2>
<p>Inspirado en los siguientes creadores de contenido:</p>

<ul>
  <li>
    <a href="https://www.youtube.com/watch?v=66IAhBI0bCM"
       target="_blank"
       rel="noopener noreferrer nofollow">
       ✔️ s4vitar
    </a>
  </li>
  <li>
    <a href="https://www.youtube.com/watch?v=Bw5sDLOvN20"
       target="_blank"
       rel="noopener noreferrer nofollow">
       ✔️ Gerry Studios
    </a>
  </li>
  <li>
    <a href="https://www.youtube.com/watch?v=5qNDJu1ek-A&t=623s"
       target="_blank"
       rel="noopener noreferrer nofollow">
       ✔️ Lupita Code
    </a>
  </li>
</ul>
</body>
</html>
