#!/usr/bin/env bash

. ../utils/common-script.sh

installFlatpak() {
  "$ESCALATION_TOOL" dnf install flatpak -y 
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

checkEnv
checkEscalationTool
installFlatpak
