#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-4"
theme='style'

# ## Run
rofi \
    -modi "greenclip: greenclip print" \
    -show greenclip -run-command '{cmd}' \
    -theme ${dir}/${theme}.rasi \
