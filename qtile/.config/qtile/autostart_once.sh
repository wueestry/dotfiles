#!/bin/bash

# Apply wallpaper using wal
nitrogen --restore &&

# Start picom
picom --config ~/.config/picom/picom.conf &
