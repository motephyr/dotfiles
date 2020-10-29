#!/bin/sh

DOTFILES=~/dotfiles
BACKUPFILES=dotfiles_backup

echo "Linking .vimrc & install vim-plug"

mv .vimrc $DOTFILES/$BACKUPFILES/vimrc.bk

ln -s $DOTFILES/vimrc .vimrc

echo "Files are linked."

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installed vim-plug for neovim"

echo "=================================================="
echo "Need install rg. check https://github.com/BurntSushi/ripgrep#installation"
echo "=================================================="
