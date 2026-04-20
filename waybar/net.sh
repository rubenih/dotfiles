#!/bin/bash

IFACE=$(ip route | awk '/default/ {print $5; exit}')
FILE="/tmp/waybar_net_history"

[ -z "$IFACE" ] && echo "no net" && exit

RX1=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

RX=$(( (RX2 - RX1) / 1024 ))
TX=$(( (TX2 - TX1) / 1024 ))

# guardar histórico
echo "$RX" >> "$FILE"
tail -n 10 "$FILE" > "${FILE}.tmp" && mv "${FILE}.tmp" "$FILE"

# bloques unicode
BLOCKS=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

# convertir histórico a gráfico
GRAPH=""
for v in $(cat "$FILE"); do
  if (( v < 50 )); then i=0
  elif (( v < 200 )); then i=1
  elif (( v < 500 )); then i=2
  elif (( v < 1000 )); then i=3
  elif (( v < 2000 )); then i=4
  elif (( v < 5000 )); then i=5
  elif (( v < 10000 )); then i=6
  else i=7
  fi
  GRAPH+="${BLOCKS[$i]}"
done

echo "↓ $GRAPH ${RX}KB/s ↑ ${TX}KB/s"
