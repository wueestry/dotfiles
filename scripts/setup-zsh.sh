#!/usr/bin/env bash

echo "This script sets zsh as the default shell"

if command -v apt &>/dev/null; then
  # If distro is based on debian/ubuntu
  sudo apt install zsh
  chsh -s $(which zsh)
elif command -v dnf &>/dev/null; then
  # If distro is based on fedora
  sudo dnf install zsh
  sudo chsh $USER
elif command -v pacman &>/dev/null; then
  # If distro is based on arch
  sudo pacman -Sy zsh
  chsh -s $(which zsh)
else
  echo "Distro unkown. Do installation manually."
fi

# Install starship
curl -sS https://starship.rs/install.sh | sh
