#!/usr/bin/env sh

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo install -Dm755 $SCRIPTPATH/../sway/.config/sway/nvidia-setup/sway-nvidia.sh "/usr/local/bin/sway-nvidia"
sudo install -Dm644 $SCRIPTPATH/../sway/.config/sway/nvidia-setup/sway-nvidia.desktop "/usr/share/wayland-sessions/sway-nvidia.desktop"
sudo install -Dm644 $SCRIPTPATH/../sway/.config/sway/nvidia-setup/wlroots-env-nvidia.sh "/usr/local/share/wlroots-nvidia/wlroots-env-nvidia.sh"
