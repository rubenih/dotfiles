#!/bin/bash

COUNT=$(swaync-client -C 2>/dev/null)
DND=$(swaync-client -D 2>/dev/null)

# defaults
ICON="󰂚"
CLASS="none"

# detecta DND
if [[ "$DND" == "true" ]]; then
  ICON="󰂠"
  CLASS="dnd"
else
  if [[ "$COUNT" -gt 0 ]]; then
    ICON="󰂛"
    CLASS="notif"
  fi
fi

# salida JSON para Waybar
echo "{\"text\":\"$ICON $COUNT\",\"class\":\"$CLASS\"}"
