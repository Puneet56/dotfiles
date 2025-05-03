#!/usr/bin/env bash

set -e

if [[ $# -eq 1 ]]; then
  selected=$1
else
  # List detailed session information
  selected=$(tmux list-sessions -F "#{session_name}: #{session_windows} windows" | sort | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

# Extract the session name (everything before the first ":")
session_name=$(echo "$selected" | cut -d':' -f1)

# Switch to the selected session
tmux switch-client -t "$session_name"
