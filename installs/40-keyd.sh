#/usr/bin/env bash

set -xe

# TODO: change it to env variable
cd ~/dotfiles/softwares/
git clone --depth 1 --branch v2.5.0 https://github.com/rvaiya/keyd
# cd keyd
# make && sudo make install
# sudo systemctl enable --now keyd
