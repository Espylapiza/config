#!/bin/bash

# or replace it with gist url
url="https://raw.githubusercontent.com/Espylapiza/config/master"

if [ "$EUID" -eq 0 ]
    then echo "Please do not run as root."
    exit 1
fi

if [[ "$(command -v apt-get)" ]]; then
    INSTALL_COMMAND="sudo apt-get install -y"
elif [[ "$(command -v pacman)" ]]; then
    INSTALL_COMMAND="sudo pacman -S"
elif [[ "$(command -v brew)" ]]; then
    INSTALL_COMMAND="brew install"
else
    echo "Error: The package manager is supported."
    exit 1
fi

if [[ "$(command -v apt-get)" ]]; then
    sudo add-apt-repository -y ppa:x4121/ripgrep
    sudo apt update
fi

$INSTALL_COMMAND curl git neovim zsh ripgrep

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

sudo cp /etc/passwd /etc/passwd.bak
sudo sed -i -e "s_/bin/bash_/bin/zsh_" /etc/passwd

mkdir -p ~/.config/nvim
mv -f ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
cp "./~/.config/nvim/init.vim" ~/.config/nvim/init.vim

mv -f ~/.tmux.conf ~/.tmux.conf.bak
cp "./~/.tmux.conf" ~/.tmux.conf

mv -f ~/.zshrc ~/.zshrc.bak
cp "./~/.zshrc" ~/.zshrc

mkdir -p ~/.ssh
mv -f ~/.ssh/config ~/.ssh/config.bak
cp "./~/.ssh/config" ~/.ssh/config

if [[ "$OSTYPE == "darwin*"" ]]; then
    mkdir -p ~/.config/iterm2
    mv -f ~/.config/iterm2/com.googlecode.iterm2.plist ~/.config/iterm2/com.googlecode.iterm2.plist.bak
    cp "./~/.config/iterm2/com.googlecode.iterm2.plist" ~/.config/iterm2/com.googlecode.iterm2.plist
fi
