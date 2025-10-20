#!/usr/bin/env bash

# ────────────────────────────────────────────────
# 🚀 autoBSPWM Installer
# by lukatinarelli
# Este script instala y configura un entorno completo con BSPWM, Polybar, sxhkd, etc.
# ────────────────────────────────────────────────


# ────────────────────────────────────────────────
# 🎨 Colores
# ────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # sin color


# ────────────────────────────────────────────────
# 🚫 Comprobar que no se ejecuta como root
# ────────────────────────────────────────────────
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}❌ No ejecutes este script como root.${NC}"
    echo "Ejecuta como usuario normal; se pedirán permisos sudo cuando sea necesario."
    exit 1
fi


# ────────────────────────────────────────────────
# 📂 Guardar ruta del repositorio
# ────────────────────────────────────────────────
ruta="$(cd "$(dirname "$0")" && pwd)"


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
echo -e "🧠  Detectado sistema: ${YELLOW}$NAME${NC}"
echo -e "${CYAN}──────────────────────────────────────────────${NC}"
sleep 1


# ────────────────────────────────────────────────
# 🛠️ Instalación de dependencias base
# ────────────────────────────────────────────────
echo -e "${GREEN}📦 Instalando dependencias base...${NC}"

case "$distro" in
    ubuntu|debian|kali|parrot)
        sudo apt update
        sudo apt install -y build-essential git vim \
            libxcb-util0-dev libxcb-ewmh-dev libxcb-icccm4-dev \
            libxcb-randr0-dev libxcb-xinerama0-dev libx11-xcb-dev \
            libxcb-xkb-dev libxcb-cursor-dev libxcb-keysyms1-dev libxkbcommon-dev
        ;;
    arch|manjaro|endeavouros)
        sudo pacman -Sy --noconfirm --needed base-devel git vim \
            xcb-util xcb-util-wm xcb-util-keysyms xcb-util-cursor xcb-util-xrm
        ;;
    fedora)
        sudo dnf install -y @development-tools git vim \
            libxcb libxcb-devel xcb-util-devel xcb-util-wm-devel
        ;;
    *)
        echo -e "${RED}❌ Distro no reconocida o no soportada automáticamente.${NC}"
        echo "Puedes editar el script para añadir soporte manualmente."
        exit 1
        ;;
esac

echo -e "${GREEN}✅ Dependencias base instaladas correctamente.${NC}"
echo


# ────────────────────────────────────────────────
# 🪟 Instalar BSPWM y SXHKD
# ────────────────────────────────────────────────
echo -e "${GREEN}🪟 Instalando BSPWM y SXHKD...${NC}"

# Crear carpeta si no existe
mkdir -p ~/github
cd ~/github

# Clonar repositorios solo si no existen
if [ ! -d "bspwm" ]; then
    git clone https://github.com/baskerville/bspwm.git
else
    echo -e "${YELLOW}⚠️  Repositorio BSPWM ya existe, se omite clonación.${NC}"
fi

if [ ! -d "sxhkd" ]; then
    git clone https://github.com/baskerville/sxhkd.git
else
    echo -e "${YELLOW}⚠️  Repositorio SXHKD ya existe, se omite clonación.${NC}"
fi

# Compilar e instalar BSPWM
cd bspwm
make clean
make
sudo make install

# Compilar e instalar SXHKD
cd ../sxhkd
make clean
make
sudo make install

# Crear entrada de sesión si no existe
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

echo -e "${GREEN}✅ BSPWM y SXHKD instalados correctamente.${NC}"
echo


# ────────────────────────────────────────────────
# ⚙️ Configuración inicial de BSPWM y SXHKD
# ────────────────────────────────────────────────
echo -e "${GREEN}⚙️ Configurando BSPWM y SXHKD...${NC}"



# Copiar configuraciones base
cp -rf "$ruta/config/bspwm/" ~/.config/
cp -rf "$ruta/config/sxhkd/" ~/.config/

# Dar permisos
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/*.sh
chmod +x ~/.config/sxhkd/sxhkdrc

echo -e "${GREEN}✅ Configuraciones base copiadas correctamente.${NC}"
echo
