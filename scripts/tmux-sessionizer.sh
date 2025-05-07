#!/usr/bin/env bash

# Check if a session is passed as an argument, otherwise use fzf to select one
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(fd . ~/ ~/projects/ ~/software/ --min-depth 1 --max-depth 1 --type d | fzf)
fi

# Exit if no selection is made
if [[ -z $selected ]]; then
  exit 0
fi

# Generate a session name
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# If not in tmux and no tmux is running, start a new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected" \; \
    send-keys "cd $selected && nvim ." C-m \; \
    new-window -d -c "$selected"
  exit 0
fi

# Create a new session if it does not exist
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected" \; \
    send-keys "cd $selected && nvim ." C-m \; \
    new-window -d -c "$selected"
fi

# Attach to the session
tmux switch-client -t "$selected_name"
