#!/bin/bash

# Counts BSPWM windows in monocle mode

layout=$(bspc query -T -d | jq -r .layout)

if [ $layout = "monocle" ]; then
    window_count=$(bspc query -N -d $somedesktop -n .window.\!hidden | wc -l)
    if [ $window_count -ne 0 ]; then
        echo $window_count
    else
        echo ""
    fi
else
    echo ""
fi
