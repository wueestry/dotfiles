#!/usr/bin/env bash

. ../utils/common-script.sh

installTermTools() {
  "$ESCALATION_TOOL" dnf install \
    cargo clang

  nix profile add nixpkgs#lazygit
}

checkEnv
checkEscalationTool
installTermTools
