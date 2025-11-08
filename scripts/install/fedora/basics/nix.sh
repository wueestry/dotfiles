#!/usr/bin/env bash

. ../utils/common-script.sh

installNix() {
  curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate --no-confirm
  exec $SHELL -l
  if [ ! -d "$HOME/.dotfiles/result" ]; then
    cd ~/.dotfiles
    nix build .#homeConfigurations."ryan".activationPackage
    ./result/activate
    exec $SHELL -l
    home-manager switch --flake .
  fi
}

checkEnv
checkEscalationTool
installNix
