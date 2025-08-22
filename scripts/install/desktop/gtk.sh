#!/usr/bin/env bash

. ../utils/common-script.sh

installCatppuccinGTK() {
  curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
  python3 install.py mocha sky --link
  rm install.py
}

checkEnv
checkEscalationTool
installCatppuccinGTK
