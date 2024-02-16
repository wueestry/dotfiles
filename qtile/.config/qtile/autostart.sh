#!/usr/bin/env bash

lxsession &
picom --daemon &
nm-applet

xargs xwallpaper --stretch < ~/.config/qtile/assets/wallpaper.png
