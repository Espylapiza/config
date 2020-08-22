#!/bin/bash
sudo apt install curl zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

wget "$url/.vimrc" -O ~/.vimrc
wget "$url/.tmux.conf" -O ~/.tmux.conf
