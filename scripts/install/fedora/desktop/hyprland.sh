#!/usr/bin/env bash

. ../utils/common-script.sh

installHyprland() {
  "$ESCALATION_TOOL" dnf install -y \
    hyprland \
    hyprcursor \
    rofi-wayland \
    waybar \
    network-manager-applet \
    pipewire-alsa \
    pipewire-utils \
    wlogout \
    wl-clipboard

  "$ESCALATION_TOOL" dnf remove -y \
    wofi

}

checkEnv
checkEscalationTool
installHyprland
