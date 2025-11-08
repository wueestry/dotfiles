#!/usr/bin/env bash

. ../utils/common-script.sh

installCoprRepos() {
  "$ESCALATION_TOOL" dnf copr enable -y solopasha/hyprland 
  "$ESCALATION_TOOL" dnf copr enable -y tofik/nwg-shell
}


checkEnv
checkEscalationTool
installCoprRepos
