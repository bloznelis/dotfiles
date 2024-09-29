#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-4"
theme='style'

## Run
rofi \
    -modi "clipboard: greenclip print" \
    -show clipboard -run-command '{cmd}' \
    -theme ${dir}/${theme}.rasi

