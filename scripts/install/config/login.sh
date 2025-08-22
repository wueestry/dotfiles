#!/usr/bin/env bash

. ../utils/common-script.sh

installPlymouth() {
  "$ESCALATION_TOOL" dnf install plymouth
}

checkEnv
checkEscalationTool
installPlymouth
