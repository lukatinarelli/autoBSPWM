#!/usr/bin/env bash

# ────────────────────────────────────────────────
# 🚀 autoBSPWM Installer
# by lukatinarelli
# Este script instala y configura un entorno completo con BSPWM, sxhkd, Polybar, etc.
# ────────────────────────────────────────────────


# ────────────────────────────────────────────────
# 🎨 Colores
# ────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# ────────────────────────────────────────────────
# 🚫 Comprobar que no se ejecuta como root
# ────────────────────────────────────────────────
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}❌ No ejecutes este script como root.${NC}"
    echo "Ejecuta como usuario normal; se pedirán permisos sudo cuando sea necesario."
    exit 1
fi


# ────────────────────────────────────────────────
# 📂 Variables Globales
# ────────────────────────────────────────────────
ruta="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$HOME/github"


# ────────────────────────────────────────────────
# 🧠 Detección del sistema
# ────────────────────────────────────────────────
if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$ID
else
    distro="desconocido"
fi

echo -e "${CYAN}──────────────────────────────────────────────${NC}"
echo -e "🧠 Detectado sistema: ${YELLOW}$NAME${NC}"
echo -e "${CYAN}──────────────────────────────────────────────${NC}"
sleep 1


# ────────────────────────────────────────────────
# 🛠️ Instalación de TODAS las dependencias
# ────────────────────────────────────────────────
echo -e "${GREEN}📦 Instalando todas las dependencias necesarias...${NC}"

case "$distro" in
    ubuntu|debian|kali|parrot)
        sudo apt update
        sudo apt install -y build-essential git vim wget curl unzip \
            xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev \
            libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev \
            libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev \
            libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev \
            cmake cmake-data pkg-config python3-sphinx libcairo2-dev \
            libuv1-dev libgfshare-dev libpulse-dev libnl-genl-3-dev libmpdclient-dev \
            libcurl4-openssl-dev libxcb-image0-dev libxcb-composite0-dev \
            meson ninja-build libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev \
            libxcb-render-util0-dev libxcb-render0-dev libxcb-present-dev \
            libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev \
            libgl1-mesa-dev libpcre2-dev libpcre3-dev libev-dev uthash-dev \
            xcb-proto libx11-xcb-dev python3-xcbgen libepoxy-dev \
            rofi papirus-icon-theme
        ;;
    arch|manjaro|endeavouros)
        sudo pacman -Sy --noconfirm --needed base-devel git vim wget curl unzip \
            libxcb xcb-util xcb-util-wm xcb-util-keysyms xcb-util-xrm xcb-util-cursor \
            cmake python-sphinx libuv cairo libpulse libmpdclient libcurl-compat \
            meson ninja libev uthash libconfig pcre2 xcb-proto python-xcbgen libepoxy \
            rofi papirus-icon-theme
        ;;
    fedora)
        sudo dnf makecache
        sudo dnf install -y @development-tools git vim wget curl unzip \
            libxcb-devel xcb-util-devel xcb-util-wm-devel xcb-util-keysyms-devel \
            alsa-lib-devel xcb-util-xrm-devel xcb-util-cursor-devel \
            cmake gcc-c++ cairo-devel libuv-devel pulseaudio-libs-devel \
            libmpdclient-devel libcurl-devel wireless-tools-devel \
            meson ninja-build libev-devel libconfig-devel libX11-devel \
            libXext-devel pcre-devel pixman-devel uthash-devel mesa-libGL-devel dbus-devel \
            xcb-proto libX11-xcb libepoxy-devel rofi papirus-icon-theme
        ;;
    *)
        echo -e "${RED}❌ Distro no reconocida.${NC}"
        echo -e "${YELLOW} Distros soportadas: Ubuntu, Debian, Kali, Parrot, Arch, Manjaro, EndeavourOS, Fedora.${NC}"
        exit 1
        ;;
esac

echo -e "${GREEN}✅ Todas las dependencias instaladas.${NC}"
echo


# ────────────────────────────────────────────────
# 📂 Preparar directorio de repositorios
# ────────────────────────────────────────────────
if [ ! -d "$REPO_DIR" ]; then
    mkdir -p "$REPO_DIR"
    echo -e "${CYAN}📂 Directorio de repositorios creado en: $REPO_DIR${NC}"
else
    echo -e "${CYAN}📂 Usando directorio de repositorios: $REPO_DIR${NC}"
fi
cd "$REPO_DIR" || exit


# ────────────────────────────────────────────────
# 🪟 Instalar BSPWM y SXHKD
# ────────────────────────────────────────────────
echo -e "${GREEN}🪟 Instalando BSPWM y SXHKD...${NC}"

# Clonar BSPWM
if [ ! -d "bspwm" ]; then
    git clone https://github.com/baskerville/bspwm.git
else
    echo -e "${YELLOW}⚠️  Repo BSPWM ya existe, actualizando...${NC}"
    cd bspwm && git pull && cd ..
fi

# Clonar SXHKD
if [ ! -d "sxhkd" ]; then
    git clone https://github.com/baskerville/sxhkd.git
else
    echo -e "${YELLOW}⚠️  Repo SXHKD ya existe, actualizando...${NC}"
    cd sxhkd && git pull && cd ..
fi

# Compilar e instalar BSPWM
cd bspwm
make clean
make
sudo make install
cd ..

# Compilar e instalar SXHKD
cd sxhkd
make clean
make
sudo make install
cd ..

# Crear entrada de sesión
if [ ! -f /usr/share/xsessions/bspwm.desktop ]; then
    echo -e "${CYAN}🧩 Creando entrada de sesión para BSPWM...${NC}"
    sudo tee /usr/share/xsessions/bspwm.desktop > /dev/null <<EOF
[Desktop Entry]
Name=BSPWM
Comment=Binary Space Partitioning Window Manager
Exec=bspwm
TryExec=bspwm
Type=Application
EOF
fi

sudo ldconfig

echo -e "${GREEN}✅ BSPWM y SXHKD instalados.${NC}"
echo


# ────────────────────────────────────────────────
# ⚙️ Configuración inicial de BSPWM y SXHKD
# ────────────────────────────────────────────────
echo -e "${GREEN}⚙️ Configurando BSPWM y SXHKD...${NC}"

mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd

cd "$ruta" || exit

if [ -d "config/bspwm" ] && [ -d "config/sxhkd" ]; then
    cp -rf config/bspwm/* ~/.config/bspwm/
    cp -rf config/sxhkd/* ~/.config/sxhkd/
else
    echo -e "${RED}❌ Error: No se encontraron configs en $ruta/config/${NC}"
    exit 1
fi

chmod +x ~/.config/bspwm/bspwmrc || true
chmod +x ~/.config/sxhkd/sxhkdrc || true

echo -e "${GREEN}✅ Configs copiados.${NC}"
echo


# ────────────────────────────────────────────────
# 🎛️ Instalación de Polybar
# ────────────────────────────────────────────────
echo -e "${GREEN}🎛️ Compilando Polybar...${NC}"

cd "$REPO_DIR" || exit

# Clonar Polybar
if [ ! -d "polybar" ]; then
    echo -e "${GREEN}⬇️ Clonando Polybar...${NC}"
    git clone --recursive https://github.com/polybar/polybar
else
    echo -e "${YELLOW}⚠️  Repo Polybar ya existe, actualizando...${NC}"
    cd polybar && git pull && cd ..
fi

cd polybar || exit

# Limpiar build anterior si existe
if [ -d "build" ]; then
    rm -rf build
fi
mkdir build
cd build || exit

echo -e "${GREEN}🔨 Compilando...${NC}"
cmake ..
make -j$(nproc)

echo -e "${GREEN}💾 Instalando...${NC}"
sudo make install

# Configuración de Polybar
cd "$ruta" || exit
echo -e "${GREEN}📂 Copiando configuración de Polybar...${NC}"
mkdir -p ~/.config/polybar

if [ -d "config/polybar" ]; then
    cp -rf config/polybar/* ~/.config/polybar/
    [ -f ~/.config/polybar/launch.sh ] && chmod +x ~/.config/polybar/launch.sh
else
    echo -e "${YELLOW}⚠️ No se encontró config de Polybar.${NC}"
fi

echo -e "${GREEN}✅ Polybar lista.${NC}"
echo


# ────────────────────────────────────────────────
# 🎨 Instalación de Picom (Compositor)
# ────────────────────────────────────────────────
echo -e "${GREEN}🎨 Compilando Picom...${NC}"

cd "$REPO_DIR" || exit

# Clonar Picom
if [ ! -d "picom" ]; then
    echo -e "${GREEN}⬇️ Clonando Picom...${NC}"
    git clone https://github.com/yshui/picom.git
else
    echo -e "${YELLOW}⚠️  Repo Picom ya existe, actualizando...${NC}"
    cd picom && git pull && cd ..
fi

cd picom || exit

# Limpiar compilación previa si existe
if [ -d "build" ]; then
    rm -rf build
fi

# Configurar y compilar con Meson/Ninja
echo -e "${GREEN}🔨 Configurando build...${NC}"
meson setup --buildtype=release build

echo -e "${GREEN}🔨 Compilando...${NC}"
ninja -C build

echo -e "${GREEN}💾 Instalando...${NC}"
sudo ninja -C build install

# Copiar configuración
cd "$ruta" || exit
echo -e "${GREEN}📂 Copiando configuración de Picom...${NC}"
mkdir -p ~/.config/picom

if [ -d "config/picom" ]; then
    cp -rf config/picom/* ~/.config/picom/
else
    echo -e "${YELLOW}⚠️ No se encontró config de Picom.${NC}"
fi

echo -e "${GREEN}✅ Picom instalado y configurado.${NC}"
echo


# ────────────────────────────────────────────────
# 🚀 Instalación de Rofi (Launcher)
# ────────────────────────────────────────────────
echo -e "${GREEN}🎨 Descargando temas extra para Rofi...${NC}"
cd "$REPO_DIR" || exit

if [ ! -d "rofi-themes-collection" ]; then
    git clone https://github.com/newmanls/rofi-themes-collection.git
else
    echo -e "${YELLOW}⚠️  Colección de temas ya existe, actualizando...${NC}"
    cd rofi-themes-collection && git pull && cd ..
fi

mkdir -p ~/.config/rofi/themes

echo -e "${CYAN}   Instalando colección de temas...${NC}"
cp -rf "$REPO_DIR/rofi-themes-collection/themes/"* ~/.config/rofi/themes/

echo -e "${CYAN}   Copiando tu configuración personal...${NC}"
cd "$ruta" || exit

if [ -d "config/rofi" ]; then
    cp -rf config/rofi/* ~/.config/rofi/
    
    if [ -f "rofi/nord.rasi" ]; then
        cp "rofi/nord.rasi" ~/.config/rofi/themes/
    fi
else
    echo -e "${YELLOW}⚠️ No se encontró carpeta config/rofi en tu repositorio.${NC}"
fi

echo -e "${GREEN}✅ Rofi instalado y configurado.${NC}"
echo


# ────────────────────────────────────────────────
# 🐱 Instalación de Kitty Terminal
# ────────────────────────────────────────────────
echo -e "${GREEN}🐱 Instalando Kitty Terminal...${NC}"

if dpkg -l | grep -q kitty; then
    sudo apt remove -y kitty
fi
rm -rf ~/.local/kitty.app

echo -e "${CYAN}   Descargando última versión oficial...${NC}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

mkdir -p ~/.local/bin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

echo -e "${CYAN}   Configurando acceso directo e iconos...${NC}"
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop

echo -e "${GREEN}📂 Copiando configuración de Kitty...${NC}"
mkdir -p ~/.config/kitty

cd "$ruta" || exit
if [ -f "config/kitty/kitty.conf" ]; then
    cp "config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
else
    echo -e "${YELLOW}⚠️ No se encontró config/kitty/kitty.conf en tu repositorio.${NC}"
fi

echo -e "${GREEN}✅ Kitty instalada y configurada.${NC}"
echo
