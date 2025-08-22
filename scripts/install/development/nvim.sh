#!/usr/bin/env bash

. ../utils/common-script.sh

installTermTools() {
  "$ESCALATION_TOOL" dnf install \
	  neovim luarocks
}

checkEnv
checkEscalationTool
installTermTools
