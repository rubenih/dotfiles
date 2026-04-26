#!/bin/bash

# Lista de perfiles para mostrar en el menú
options="performance\nbalanced\npower-saver"

# Lanzar wofi en modo dmenu
chosen=$(echo -e "$options" | wofi --dmenu --width 300 --height 200 --cache-file /dev/null --prompt "Selecciona perfil de energía:")

# Si el usuario eligió algo, aplicarlo
if [ ! -z "$chosen" ]; then
    powerprofilesctl set "$chosen"
    notify-send "Energía" "Perfil cambiado a: $chosen" -i power-profile-$chosen
fi
