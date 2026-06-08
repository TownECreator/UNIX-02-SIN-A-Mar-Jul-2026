# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.
FROM kalilinux/kali-rolling:latest

#--------------------------------------------------------------------
    # Detailed Comments made by Paula Cevallos
#--------------------------------------------------------------------
# This instruction initializes the Docker build process by selecting the foundational "base image." 
# In containerization, a base image serves as the initial pre-packaged file system snapshot and core 
# operating system layout Where all the subsequien configurations will be installed and/or developed. Besides, we specifically 
# use 'kalilinux/kali-rolling' because it is a Linux distribution tailored explicitly for offensive 
# security, pen-testing, and security auditing, and since we are developing the BHB Book, it fits like a glove. It also comes natively equipped with specialized network 
# utilities and security repositories that would take hours to configure manually. This ties closely into 
# Black Hat Bash Chapter 3 ("Setting Up a Hacking Lab"), where the authors emphasize the necessity of 
# isolating your scripting experiments inside a dedicated Kali-Docker testing sandbox to safely run 
# security binaries without risking the integrity or exposing the host machine's operating system environment 
# (Lab Environments - BHB Ch. 3).

# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color

#--------------------------------------------------------------------------
    #Detailed description by Paula Cevallos
#--------------------------------------------------------------------------
#These lines, in short, define persistent environment variables, DEBIAN_FRONTEND=noninteractive forces apt-get to assume default
#responses so that the processes run smoothly and uninterrupted, and overall makes it more efficient.
#LANG and LC_all are environment variables that set the systems "locale", meaning language,
#character encoding and cultural formatting rules (date, time and currency), in addition to that, UTF-8 (8-bit Unicode Transformation Format) is the encoding standard
#used to translate human text into binary (computer's language), in this case, it's used for the spanish language.
#Finally, TERM=xterm-256color informs the terminal that our console environment will support the full 256-bit ANSI
#escape colour rendering schemas. These command lines relate heavily to chapter 1 of Black Hat Bash Creative Scripting - Environmental Setup, subchapter
#"Checking Environment Variables", as we talk about how the envornment variables scripted in the dockerfile serve the purpose of being a "direction map"
#in the sense of programs using their specifications to know the location of the home directory, default shell, among others (Environment Variables- BHB, ch.1).


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections

#---------------------------------------------------------------------
    #Detailed Description by Paula Cevallos
#-----------------------------------------------------------------------
# This line is all about avoiding annoying popup windows during the build. When you install Wireshark 
# or Tshark, the installer usually stops and displays a prompt asking if non-root users should be allowed 
# to capture network packets. Since Docker builds are totally automated and unattended (headless), any 
# interactive prompt like that would freeze the build forever because there's no human to click "OK". 
# To bypass this, we use a shell pipe (|) to take the output string from 'echo' and feed it straight into the 
# standard input (stdin) of 'debconf-set-selections' (BHB Ch. 1). This pre-seeds the installer's database 
# with our answer ("false") before it even asks, making the installation smooth and fully automated (BHB Ch. 3).
# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \

#---------------------------------------------------------------------
#   Detailed Description by Paula Cevallos
#------------------------------------------------------------------
# This section is all about the difference between 'update' and 'install'. 'apt-get update' doesn't 
# actually install any software; it just refreshes our local list of available packages from the internet 
# catalogs. On the other hand, 'apt-get install' is what actually downloads and installs the binaries onto our container's system.
# Inside this command, we use two essential flags: the '-y' flag which automatically answers "yes" 
# to installer confirmation prompts so the script doesn't pause, and the '--no-install-recommends' 
# flag which stops apt from grabbing non-essential extra packages, saving us hundreds of megabytes of disk space.
# You might wonder why we throw everything into ONE big RUN statement instead of splitting it up into multiple steps. 
# Every single time Docker sees a 'RUN' command, it creates a brand new filesystem layer. If we used multiple RUN steps, 
# our final image size would balloon because temporary files get permanently locked into those intermediate layers. 
# By grouping everything together, we can clean up the package installation cache at the very end of the exact same step 
# before the layer freezes, keeping our image super tiny and efficient (BHB Ch. 3).
# To chain these lines together, we use the logical AND operator (&&) so that a tool only tries to install if the 
# previous one finished successfully with an exit status code of 0 (BHB Ch. 1). We also use trailing backslashes (\) 
# at the end of the lines, which is just a shell syntax trick telling Docker that our single command continues onto 
# the next line so the file stays clean and readable.
# Moreover, here is what our core installed tools are actually used for in our hacking labs:
# gawk, sed, & grep: These are our fundamental text-processing utilities! As highlighted in Black Hat Bash Chapter 2, they let us read files, filter strings, search for text patterns, and stream-edit configurations on the fly using regular expressions.
# shellcheck: A static code linter that automatically scans our custom Bash scripts to find bugs, syntax mistakes, or missing bracket spaces before we run them.
# nmap: The classic network recon tool used for discovering active hosts and scanning open ports (BHB Ch. 3).
# tcpdump & tshark: Command-line network packet sniffers. We use them to capture, log, and analyze raw network traffic streams passing through live interfaces (BHB Ch. 3).
# tor & proxychains4: Anonymity and security utilities. They let us route our shell connections through encrypted proxy relays to mask our terminal identity during testing labs (BHB Ch. 3).
# jq: A command-line JSON processor that easily slices, filters, and reads structured API and data outputs.
# man-db: Restores the built-in system documentation manuals. Standard Docker images strip out manual pages to save space, but we need them so we can run commands like 'man bash' or 'man grep' to look up tool behavior (BHB Ch. 1).
 
# --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.

# Prompt del curso para bash
RUN chsh -s /usr/bin/zsh root

# ===== Prompt institucional para los y las estudiantes del curso =====
RUN cat >> /root/.zshrc <<'EOF'

#Valida si un comando fue ejecutado correctamente

PROMPT='%F{cyan}[PauDome-Cevallos]%f %F{yellow}%1~%f %(?.%F{green}✓.%F{red}✗ %?)%f %# '
EOF
CMD ["/bin/zsh"]




