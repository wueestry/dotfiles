#!/usr/bin/env bash

. ../utils/common-script.sh

installNix() {
  curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate --no-confirm
}

checkEnv
checkEscalationTool
installNix
