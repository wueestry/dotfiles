#!/usr/bin/env bash

systemctl --user start pipewire pipewire-pulse
systemctl --user enable pipewire pipewire-pulse
