#!/usr/bin/env bash

. ../utils/common-script.sh

installBluetoothTools() {
  "$ESCALATION_TOOL" dnf install \
	  bluez blueman
  
  "$ESCALATION_TOOL" systemctl enable --now bluetooth.service
}

checkEnv
checkEscalationTool
installBluetoothTools
