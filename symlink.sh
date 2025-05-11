#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Function to create a symlink after removing existing file/dir if necessary
create_symlink() {
  local target="$1"
  local link_name="$2"

  # If the link already exists, remove it
  if [ -L "$link_name" ]; then
    echo "Removing existing symlink: $link_name"
    rm "$link_name"
  elif [ -d "$link_name" ]; then
    # If it's a directory, remove the directory
    echo "Removing existing directory: $link_name"
    rm -rf "$link_name"
  fi

  # Create the symlink
  echo "Creating symlink: $link_name -> $target"
  ln -sf "$target" "$link_name"
}

create_symlink "$DOTFILES_DIR/scripts" "$HOME/scripts"
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"

create_symlink "$DOTFILES_DIR/keyd" "$CONFIG_DIR/keyd"
create_symlink "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"
create_symlink "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
create_symlink "$DOTFILES_DIR/fuzzel" "$CONFIG_DIR/fuzzel"

create_symlink "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"
create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
