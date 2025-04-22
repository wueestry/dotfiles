#/usr/env bash

echo "This script sets zsh as the default shell"

{ # If distro is based on debian/ubuntu
  sudo apt install zsh
  chsh -s $(which zsh)
} || { # If distro is based on fedora
  sudo dnf install zsh
  sudo chsh $USER
}

# Install starship
curl -sS https://starship.rs/install.sh | sh
