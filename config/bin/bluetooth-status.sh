#!/bin/bash

# Verifica si el adaptador Bluetooth está encendido
powered=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ "$powered" == "yes" ]]; then
    icon="" # Bluetooth encendido
    # ¿Hay algún dispositivo conectado?
    connected=$(bluetoothctl info | grep "Connected: yes")
    if [[ -n "$connected" ]]; then
        echo "%{A1:bluetoothctl power off &:}%{A3:blueman-manager &:}${icon}%{A}%{A}"
    else
        echo "%{A1:bluetoothctl power off &:}%{A3:blueman-manager &:}${icon}%{A}%{A}"
    fi
else
    icon="" # Bluetooth apagado
    echo "%{A1:bluetoothctl power on &:}%{A3:blueman-manager &:}${icon}%{A}%{A}"
fi
