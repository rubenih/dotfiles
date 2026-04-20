#!/bin/bash

IFACE="wg0"

STATE=$(ip link show $IFACE 2>/dev/null | grep -q "state UP" && echo "up" || echo "down")

# toggle
if [[ "$1" == "toggle" ]]; then
  if [[ "$STATE" == "up" ]]; then
    sudo wg-quick down $IFACE
  else
    sudo wg-quick up $IFACE
  fi
  exit 0
fi

# output para waybar
if [[ "$STATE" == "up" ]]; then
  echo "{\"text\":\"󰌘 ON\",\"class\":\"on\"}"
else
  echo "{\"text\":\"󰌘 OFF\",\"class\":\"off\"}"
fi
