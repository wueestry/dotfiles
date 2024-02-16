#!/usr/bin/env bash

sudo apt install nala -y

sudo nala upgrade -y

sudo apt purge snapd -y

sudo nala install kitty xterm python3-venv python3-pip python3-cffi python3-cairocffi libpangocairo-1.0.0 xserver-xorg python3-xcffib -y

sudo nala install rofi stow build-essential libx11-dev libxft-dev policykit-1-gnome
