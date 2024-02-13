#!/usr/bin/env bash

cd ~/.local/share

sudo apt install python3-pip python3-venv python3-cffi python3-cairocffi libpangocairo-1.0-0 xserver-xorg python3-xcffib libwlroots-dev

python3 -m venv qtile_env
cd qtile_env

git clone https://github.com/qtile/qtile.git
git clone https://github.com/elParaguayo/qtile-extras.git

bin/pip install qtile/.
bin/pip install qtile-extras/.

cd

ln -Sn .local/share/qtile_env/bin/qtile .local/bin/qtile

mkdir -p /usr/share/xsessions
ln -Sn .config/qtile/qtile.desktop /usr/share/xsessions/qtile.desktop
