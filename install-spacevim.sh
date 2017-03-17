#!/bin/bash

## TODO: Set script executables and make the script portable.

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update

sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip software-properties-common

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# You may not want to trust blindly. Encourage you to audit the script.
curl -sLf https://spacevim.org/install.sh | bash

exit 0
