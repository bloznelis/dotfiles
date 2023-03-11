#!/bin/bash

# Counts BSPWM windows 
count ()
{
    window_count=$(bspc query -N -d $somedesktop -n .window.\!hidden | wc -l)
    if [ $window_count -ne 0 ]; then
        echo "[$window_count]"
    else
        echo ""
    fi
}

# Initial count
count 

# Subscribe to count changes
bspc subscribe desktop_focus node_add node_remove 2> /dev/null | while read line; do
    count
done
