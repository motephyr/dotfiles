#!/bin/sh

DOTFILES=~/dotfiles
BACKUPFILES=dotfiles_backup

echo "Linking .vimrc & install vim-plug"

mv ~/.vimrc $DOTFILES/$BACKUPFILES/vimrc.bk

ln -s $DOTFILES/vimrc ~/.vimrc
ln -s $DOTFILES/.config/nvim ~/.config/nvim

sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Installed vim-plug for neovim"


echo "alias vi=\"~/nvim.appimage\"" >> ~/.bashrc
echo "Add alias vi=\"~/nvim.appimage\" to ~/.bashrc or ~/.zshrc"

source ~/.bashrc
echo "source ~/.bashrc"

echo "=================================================="
echo "Need install rg. check https://github.com/BurntSushi/ripgrep#installation"
echo "=================================================="
