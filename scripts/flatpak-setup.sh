#! /usr/bin/env bash

sudo apt install flatpak -y

# Add flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Use GTK theme for flatpak apps
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons

sudo flatpak override --env=GTK_THEME=Catppuccin-Mocha-Standard-Sky-Dark
sudo flatpak override --env=ICON_THEME=Papirus-Dark
