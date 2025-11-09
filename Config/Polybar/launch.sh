#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar ethernet_bar -c ~/.config/polybar/current.ini &
polybar vpn_bar -c ~/.config/polybar/current.ini &
sleep 0.5

## Right bar
#polybar top -c ~/.config/polybar/current.ini &
polybar target_to_hack -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &
sleep 0.1
## Center bar

polybar primary -c ~/.config/polybar/workspace.ini &
sleep 0.5

# Bajar todas al fondo

for bar in primary secondary top right; do
    xdo below -t $(xdo id -a root) $(xdo id -n $bar)
done
