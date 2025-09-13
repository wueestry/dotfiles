#!/usr/bin/env bash

. ../utils/common-script.sh

installStow(){
  "$ESCALATION_TOOL" dnf install \
     stow
  cd ~/.dotfiles 
  stow btop gtk-3.0 kitty neovim qtct rofi starship zsh git hyprland kvantum nwg tmux waybar wlogout
}

checkEnv
checkEscalationTool
installStow
