#!/usr/bin/env bash

. ../utils/common-script.sh

installTermTools() {
  "$ESCALATION_TOOL" dnf install \
    wget curl unzip fd fzf ripgrep zoxide bat jd btop wl-clipboard man tldr less whois kitty

  nix profile add nixpkgs#atuin nixpkgs#eza

  # Install JetBrainsMono Nerd Font
  wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip &&
    cd ~/.local/share/fonts &&
    unzip JetBrainsMono.zip &&
    rm JetBrainsMono.zip &&
    fc-cache -fv
}

checkEnv
checkEscalationTool
installTermTools
