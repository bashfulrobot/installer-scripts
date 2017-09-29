#!/bin/bash

## Simply used to setup my terminal w/ fish shell

# Dependencies
sudo apt install fish git -y


cd ~/Documents/projects
curl -L https://get.oh-my.fish > install.sh
less install.sh
fish install.sh --path=~/.local/share/omf --config=~/.config/omf
rm -f install.sh
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/UbuntuMono.zip
sudo unzip UbuntuMono.zip -d /usr/local/share/fonts/
sudo fc-cache -fv
rm -r UbuntuMono.zip
fish omf install bobthefish
fish omf theme bobthefish
fish set -U theme_color_scheme solarized-light
fish set -U theme_nerd_fonts yes
echo "Change your terminal to use the proper nerd font..."
chsh -s /usr/bin/fish

