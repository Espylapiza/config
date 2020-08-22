#!/bin/bash
sudo sed -i -e "s_/bin/bash_/bin/zsh" /etc/passwd

gist_url="https://gist.githubusercontent.com/Espylapiza/e2d3143a7d6e48f122447134261c865e/raw/b345b0a2f0a76ef601f66be0d60efc2cad48c2a6"

wget "$gist_url/.vimrc" -O ~/.vimrc
wget "$gist_url/.tmux.conf" -O ~/.tmux.conf
