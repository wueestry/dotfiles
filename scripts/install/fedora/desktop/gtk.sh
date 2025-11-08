#!/usr/bin/env bash

. ../utils/common-script.sh

installCatppuccinGTK() {
  curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
  python3 install.py mocha sky --link
  rm install.py

  sudo flatpak override --filesystem=$HOME/.local/share/themes
  # Change to suite your flavor / accent combination
  export FLAVOR="mocha"
  export ACCENT="sky"

  # Set the theme
  sudo flatpak override --env=GTK_THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"
}

checkEnv
checkEscalationTool
installCatppuccinGTK
