<!DOCTYPE html>
<html>
<body>
<h1>Entorno-de-trabajo</h1>
<p>Lo que consiste este script en bash que permita convertir una distribución de Linux exactamente Debian en un entorno de trabajo profesional de manera automatizada, podemos personalizarlo, el limite vendria a ser tu imaginación, en este caso utilizamos powerlevel10k, el compton, entre otras herramientas, por lo cual podemos mejorar lo que se les va a mostrar en la que los usuarios podran elegir sus propias personalizaciónes según la preferencia de cada uno, sencillo manejo guiado para que los uusarios se puedan guiar como moverse mediante las ventanas, tratando de dejar el mouse, trabajando mas con el teclado en la cual estare incluyendo, referencias gracias a estas personas e podido construir mi entorno de trabajo que son los siguientes enlaces:</p>
<li><a href="https://www.youtube.com/watch?v=66IAhBI0bCM"r1="nofollow">✔️s4vitar</a></li>
<li><a href="https://www.youtube.com/watch?v=Bw5sDLOvN20"r1="nofollow">✔️Gerry Studios</a></li>
<li><a href="https://www.youtube.com/watch?v=5qNDJu1ek-A&t=623s"r1="nofollow">✔️Lupita Code</a></li>
<h2>Testeado en las siguientes distribuciones de Linux:</h2>
<li>
✔️ Kali Linux ✔️ Parrot ✔️ Ubuntu ✔️ Debian ✔️Xubuntu ✔️ Lubuntu
</li>
<h2>Instalación detallada:</h2>
<p>Se recomienda hacer la instalación en una nueva ISO, si es posible minimal. Si esto no es posible, si está usando una VM, clonela o realice un snapshot del estado actual de la VM. Tenemos que comenzar la instalación con usuario root.</p2>
<p><strong>1)</strong> Instlaciones de login, interfaz de ventana, editor de texto y dependencias: </p><pre><code>apt update && apt upgrade -y && apt install -y htop && apt install -y wget curl git && apt install -y zip unzip && apt install -y i3 i3status i3lock dmenu feh compton && apt install -y vim vim-gui-common vim-runtime && apt install -y lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings && apt install -y terminator && apt install -y firefox-esr && apt install -y scrub && apt install -y cmatrix</code></pre>

<p><strong>2)</strong> instalación lsd </p><pre><code>mkdir ~/Descargass && cd ~/Descargass && wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_amd64.deb && export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && dpkg -i *.deb && rm -fr *.deb</code></pre>

<p><strong>3)</strong> Instalación bat </p><pre><code>cd ~/Descargass ; wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb ; export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin && dpkg -i *.deb ; rm -fr *.deb</code></pre>

<p><strong>4)</strong> Instalar tipo de letra Hack </p><pre><code>cd /usr/local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip Hack.zip && rm -fr Hack.zip</pre></code>

<p><strong>5)</strong> Instalar fzf </p><pre><code>cd /root/ && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf</code></pre>

<p><strong>6)</strong> zsh + ohmyzsh + powerlevel10k solo instalar con root el zsh el resto con tu susuario</p><pre><code>apt install -y zsh</code>
<code>sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"</code>
<code>git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k</code></pre>
<p>Colocar <code>ZSH_THEME="powerlevel10k/powerlevel10k</code> en <code>~/.zshrc</code></p>
  
<p><strong>7)</strong> Instalar fzf en el usuario </p><pre><code>git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf</code></pre>

<p><strong>9)</strong> powerlevel10k con root </p><pre><code>git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k</code></pre>
<p>Borrar el <code>.zshrc</code> del root el comando es el siguiente: <code>rm -fr /root/.zshrc</code></p>
<p>Crear un enlace simbolico<code>ln -s -f /home/ls/.zshrc .zshrc</code></p>
<h2>Visualización como podria quedar</h2>
<p>

<a><img src="https://raw.githubusercontent.com/LSanti94/Entorno-de-trabajo/main/Vista%20Final/Fondo%20de%20pantalla.JPG"></a>
<a><img src="https://raw.githubusercontent.com/LSanti94/Entorno-de-trabajo/main/Vista%20Final/Descripci%C3%B3n2.JPG"></a>
<a href="" title="Entorno-de-trabajo"></a>
<h2>Atajos de teclado</h2>
<table>
<thead>
<tr>
<th>Teclado</th>
<th>Acción</th>
</tr>
</thead>
<tr>
  <td><code>Mod</code> + <code>Enter</code></td>
  <td>Abrir Terminal</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code> + <code>espacio</code></td>
  <td>ventana flotante</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code> + <code>espacio</code></td>
  <td>vuelve a su sitio</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>clic</code></td>
  <td>Clic derecho para agrandar y achicar la ventana</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code> + <code>q</code></td>
  <td>Cerrar ventana flotante</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>v</code></td>
  <td>Proxima ventana en abrir sera verticalmente</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>h</code></td>
  <td>Proxima ventana en abrir sera horizontal</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>f</code></td>
  <td>Poner una ventana en pantalla completa</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>s</code></td>
  <td>Maximizar las ventanas lo cual se colocan vertical</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>w</code></td>
  <td>Maximizar las ventanas lo cual se colocan horizontal o en pestañas</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>e</code></td>
  <td>Se colocan las ventanas como estaban anteriormente</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code> + <code>e</code></td>
  <td>Cerrar sesión</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code> + <code>b</code></td>
  <td>Bloquear la computadora o laptop</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>r</code></td>
  <td>Agrandar o achicar la ventana cuando tienes mas de una ventana con las flechas</td>
</tr>
<tr>
  <td><code>Mod</code> + <code>Shift</code>+ <code>f</code></td>
  <td>Firefox</td>
</tr>
</table>
<h2>Créditos</h2>
<ul>
<li>Autor: LSanti94</li>
<li>Inspirado por las siguientes personas y youtubers: 💻leviswings 💻s4vitar 💻Gerry 💻Lupita</li>
</ul>
</body>
</html>
