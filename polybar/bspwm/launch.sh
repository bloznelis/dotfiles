#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c $HOME/.config/polybar/bspwm/config.ini main >> /tmp/polybar.log 2>&1 &
polybar -c $HOME/.config/polybar/bspwm/config.ini side-monitor >> /tmp/polybar-2.log 2>&1 &
disown

echo "Bars launched..."
