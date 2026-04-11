#!/usr/bin/env bash

sudo systemctl enable libvirtd.socket
sudo systemctl start libvirtd.socket

groupadd libvirt
sudo usermod -aG libvirt $USER

sudo virsh net-start default
sudo virsh net-autostart default
