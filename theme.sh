#!/bin/bash

# Ruta al directorio del tema (donde está este script)
ruta="$(cd "$(dirname "$0")" && pwd)"
carpeta="$ruta/config"

# Asegurar que exista la carpeta del tema
if [ ! -d "$carpeta/.config" ]; then
    echo "❌ No se encontró la carpeta $carpeta/.config"
    exit 1
fi

echo "🔄 Aplicando configuración del entorno..."

# Backup por seguridad
backup_dir="$HOME/.backup_config_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"
echo "🧷 Creando backup en $backup_dir"

cp -rv ~/.config "$backup_dir/" 2>/dev/null
cp -rv ~/.local "$backup_dir/" 2>/dev/null
cp -v ~/.bashrc "$backup_dir/" 2>/dev/null
cp -v ~/.zshrc "$backup_dir/" 2>/dev/null

# Aplicar configuraciones nuevas
echo "📦 Copiando archivos de configuración..."
cp -rv "$carpeta/.config" ~/
cp -rv "$carpeta/.local" ~/
cp -v "$carpeta/.bashrc" ~/
cp -v "$carpeta/.zshrc" ~/

# Recargar fuentes, si corresponde
fc-cache -fv

# Mensaje final
echo "✅ Tema aplicado correctamente."
notify-send "✅ Tema aplicado correctamente"
