#!/bin/sh

# Detecta interfaz por la ruta hacia 8.8.8.8
iface=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')

# Si no hay interfaz (por ejemplo, Wi-Fi apagado), mostrar "No IP"
if [ -z "$iface" ]; then
    echo "%{F#2495e7} %{F#ff0000}No IP%{u-}"
    exit 0
fi

# Busca dirección IP
ip_addr=$(ip -4 addr show "$iface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

# Mostrar resultado
if [ -n "$ip_addr" ]; then
    echo "%{F#2495e7} %{F#ffffff}$ip_addr%{u-}"
else
    echo "%{F#2495e7} %{F#ff0000}No IP%{u-}"
fi
