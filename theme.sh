#!/bin/bash

ruta=$(pwd)

opciones() {
    zenity --list --title="Selecciona una opción" \
           --column="Elige una opción" \
           "Pacman" "Parrot" "S4vi" "Cinnamoroll" "Pink" "ZLCube" "Legion"
}

aplicar_theme() {
    nombre=$1
    carpeta="$ruta/Themes/$nombre"

    if [ ! -d "$carpeta" ]; then
        zenity --error --text="El tema $nombre no existe en $carpeta"
        exit 1
    fi

    # Dar permisos
    chmod +x "$carpeta/.p10k.zsh" "$carpeta/.p10k.zsh-root"
    find "$carpeta/Config" -type f -exec chmod +x {} \;

    # Scripts globales
    sudo chmod +x /usr/local/bin/whichSystem.py
    sudo chmod +x /usr/local/bin/screenshot

    # Limpiar configuraciones anteriores
    rm -rf ~/.p10k.zsh ~/.config/bspwm ~/.config/bin ~/.config/picom \
           ~/.config/polybar ~/.config/rofi ~/.config/Wallpaper ~/.config/kitty \
           ~/.config/wallpapers
    sudo rm -rf /root/.p10k.zsh

    # Copiar archivos nuevos
    cp -v "$carpeta/.p10k.zsh" ~/.p10k.zsh
    sudo cp -v "$carpeta/.p10k.zsh-root" /root/.p10k.zsh
    cp -rv "$carpeta/Config/"* ~/.config/

    # Wallpapers y neofetch si existen
    if [[ "$nombre" == "Cinnamoroll" ]]; then
        mkdir -p ~/Wallpaper ~/.fonts
        cp -v "$ruta/cin2.jpg" ~/Wallpaper/
        cp -v "$ruta/fonts/fontello.ttf" ~/.fonts/
        fc-cache
        cp -v "$ruta/cnn" ~/.cnn
    fi

    echo "$nombre theme instalado"
    rofi-theme-selector
    # No usar 'kill -9 -1'. Si se requiere reinicio, usar 'reboot' opcionalmente.
}

# Menú principal
selected_option=$(opciones)

case "$selected_option" in
    "Pacman") aplicar_theme "Pacman" ;;
    "Parrot") aplicar_theme "Parrot" ;;
    "S4vi") aplicar_theme "S4vi" ;;
    "Cinnamoroll") aplicar_theme "cin" ;;  # carpeta especial: "cin"
    "Pink") aplicar_theme "Pink" ;;
    "ZLCube") aplicar_theme "ZLCube" ;;
    "Legion") aplicar_theme "Legion" ;;
    *) zenity --error --text="Opción no válida o cancelada" ;;
esac
