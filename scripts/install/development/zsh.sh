#!/usr/bin/env bash

. ../utils/common-script.sh

installZsh() {
  "$ESCALATION_TOOL" dnf install \
    zsh
  sudo chsh $USER

  nix profile install nixpkgs#starship
}

checkEnv
checkEscalationTool
installZsh
