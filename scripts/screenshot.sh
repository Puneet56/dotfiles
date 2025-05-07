#!/bin/bash

# Define the screenshots directory
SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

# Ensure the screenshots directory exists
mkdir -p "$SCREENSHOTS_DIR"

# Define the base filename
FILENAME_BASE="$(date +%Y-%m-%d_%H-%M-%S)"

# Function to send a notification
send_notification() {
  notify-send "Screenshot Taken" "$1"
}

# Function to copy image to clipboard
copy_to_clipboard() {
  if command -v wl-copy &>/dev/null; then
    wl-copy <"$1"
    send_notification "Screenshot copied to clipboard."
  elif command -v xclip &>/dev/null; then
    xclip -selection clipboard -t image/png <"$1"
    send_notification "Screenshot copied to clipboard."
  else
    echo "Warning: Neither wl-copy nor xclip found. Cannot copy to clipboard."
    send_notification "Could not copy screenshot to clipboard (clipboard utility not found)."
  fi
}

# Check the argument
case "$1" in
"area")
  # Capture a selected area
  if slurp | grim -g - "$SCREENSHOTS_DIR/area-$FILENAME_BASE.png"; then
    SCREENSHOT_PATH="$SCREENSHOTS_DIR/area-$FILENAME_BASE.png"
    send_notification "Area screenshot saved to: $SCREENSHOT_PATH"
    copy_to_clipboard "$SCREENSHOT_PATH"
  else
    send_notification "Screenshot cancelled or failed."
  fi
  ;;
"full")
  # Capture the full screen
  if grim "$SCREENSHOTS_DIR/full-$FILENAME_BASE.png"; then
    SCREENSHOT_PATH="$SCREENSHOTS_DIR/full-$FILENAME_BASE.png"
    send_notification "Full screenshot saved to: $SCREENSHOT_PATH"
    copy_to_clipboard "$SCREENSHOT_PATH"
  else
    send_notification "Screenshot failed."
  fi
  ;;
*)
  echo "Usage: $0 [area|full]"
  exit 1
  ;;
esac

exit 0
