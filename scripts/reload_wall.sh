#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/images/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one using fd
WALLPAPER=$(fd --search-path "$WALLPAPER_DIR" --type f --exclude "$(basename "$CURRENT_WALL")" --exclude ".git" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
