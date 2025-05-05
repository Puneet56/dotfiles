#!/bin/bash

current_state=$(hyprctl getoption input:touchpad:tap-to-click | awk 'NR==1 {print $NF}')

if [ "$current_state" = "1" ]; then
  notify-send "Mouse mode" "Tap to click disabled"
  hyprctl keyword input:touchpad:tap-to-click false
else
  notify-send "Mouse mode" "Tap to click enabled"
  hyprctl keyword input:touchpad:tap-to-click true
fi
