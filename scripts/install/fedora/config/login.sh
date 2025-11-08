#!/usr/bin/env bash

. ../utils/common-script.sh

installPlymouth() {
  "$ESCALATION_TOOL" dnf install plymouth plymouth-plugin-script
  if [ "$(plymouth-set-default-theme)" != "omarchy" ]; then
    "$ESCALATION_TOOL" cp -r "$HOME/.dotfiles/default/plymouth" /usr/share/plymouth/themes/omarchy/
    "$ESCALATION_TOOL" plymouth-set-default-theme -R omarchy
  fi
  "$ESCALATION_TOOL" systemctl set-default graphical.target
  "$ESCALATION_TOOL" dnf install tuigreet
  "$ESCALATION_TOOL" cp -r "$HOME/.dotfiles/default/greetd" /etc/greetd
  "$ESCALATION_TOOL" systemctl enable greetd
}

checkEnv
checkEscalationTool
installPlymouth
