#!/bin/bash

# Power menu options with emojis
options="❌ Shutdown\n🔄 Reboot\n🚪 Logout"

# Use Fuzzel to display the options
choice=$(echo -e "$options" | fuzzel --dmenu)

# Perform the selected action
case "$choice" in
"❌ Shutdown")
  systemctl poweroff
  ;;
"🔄 Reboot")
  systemctl reboot
  ;;
"🚪 Logout")
  hyprctl dispatch exit
  # Replace with your actual logout command
  # Examples for different window managers/desktop environments:
  # Openbox: openbox --exit
  # i3/Sway: i3-msg exit or swaymsg exit
  # GNOME: gnome-session-quit
  # KDE: qdbus org.kde.ksmserver /KSMServer logout 0 0 0
  # Add the command that applies to your setup
  exit
  ;;
esac
