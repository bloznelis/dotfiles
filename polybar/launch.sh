#!/usr/bin/env bash

killall -q polybar

# Launch bars
echo "------" >> /tmp/polybar.log

polybar -c /home/lukas/.config/polybar/config.ini main >> /tmp/polybar.log 2>&1 &
polybar -c /home/lukas/.config/polybar/config.ini side-monitor >> /tmp/polybar-2.log 2>&1 &

echo "Bars launched."
