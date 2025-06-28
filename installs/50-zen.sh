#/usr/bin/env bash

set -xe

# TODO: change it to env variable
cd ~/dotfiles/softwares/
wget https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz
tar -xf zen.linux-x86_64.tar.xz
# cd keyd
# make && sudo make install
# sudo systemctl enable --now keyd
