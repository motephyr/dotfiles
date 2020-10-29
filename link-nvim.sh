#!/bin/sh

DOTFILES=~/dotfiles
BACKUPFILES=dotfiles_backup

echo "Linking .vimrc & install vim-plug"

mv ~/.vimrc $DOTFILES/$BACKUPFILES/vimrc.bk

ln -s $DOTFILES/.config/nvim/init.vim ~/.vimrc

echo "Files are linked."

sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installed vim-plug for neovim"

echo "=================================================="
echo "Need install rg. check https://github.com/BurntSushi/ripgrep#installation"
echo "Add alias vi=\"~/nvim.appimage\" to ~/.bashrc or ~/.zshrc"
echo "source ~/.bashrc"
echo "=================================================="
