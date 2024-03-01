#!/usr/bin/env bash

ctp_version="v0.7.1"
if [ ! -e ~/.themes/Catppuccin-Mocha-Standard-Sky-Dark ]; then
  mkdir -p ~/.themes
  curl -L https://github.com/catppuccin/gtk/releases/download/$ctp_version/Catppuccin-Mocha-Standard-Sky-Dark.zip -o ~/.themes/catppuccin.zip
  unzip ~/.themes/catppuccin.zip -d ~/.themes/
  rm -rf ~/.themes/catppuccin.zip; 
  mkdir -p "$HOME/.config/gtk-4.0"
  THEME_DIR="$HOME/.themes/Catppuccin-Mocha-Standard-Sky-Dark"
  ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
  ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
  ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
fi
