#!/usr/bin/env bash

pkill waybar && hyprctl dispatch exec waybar || hyprctl dispatch exec waybar
