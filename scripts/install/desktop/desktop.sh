#!/usr/bin/env bash

. ../utils/common-script.sh

installDesktopTools() {
  flatpak install -y \
    com.brave.Browser app.zen_browser.zen md.obsidian.Obsidian com.bitwarden.desktop
  "$ESCALATION_TOOL" dnf install -y \
    jetbrains-mono-fonts \
    xdg-user-dirs \
    kvantum \
    qt5ct \
    qt6ct \
    nwg-look \
    playerctl \
    pamixer \
    brightnessctl \
    pavucontrol
}

checkEnv
checkEscalationTool
installDesktopTools
