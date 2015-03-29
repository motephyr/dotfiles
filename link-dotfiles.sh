#!/bin/sh

DOTFILES=~/dotfiles
BACKUPFILES=dotfiles_backup

cd


echo "Linking Zsh files..."
# mv .zshrc $DOTFILES/$BACKUPFILES/zshrc.bk
# mv .zshenv $DOTFILES/$BACKUPFILES/zshenv.bk
# ln -s $DOTFILES/zshrc .zshrc
# ln -s $DOTFILES/zshenv .zshenv
# source ~/.zshrc
# source ~/.zshenv

echo "Linking Git files..."
mv .gitignore_global $DOTFILES/$BACKUPFILES/gitignore_global.bk
mv .gitconfig $DOTFILES/$BACKUPFILES/gitconfig.bk
cp $DOTFILES/gitconfig.template $DOTFILES/gitconfig
ln -s $DOTFILES/gitignore_global .gitignore_global
ln -s $DOTFILES/gitconfig .gitconfig

echo "Linking Rails .gemrc & .irbrc & .pryrc & .vimrc"
mv .gemrc $DOTFILES/$BACKUPFILES/gemrc.bk
mv .irbrc $DOTFILES/$BACKUPFILES/irbrc.bk
mv .pryrc $DOTFILES/$BACKUPFILES/pryrc.bk
mv .vimrc $DOTFILES/$BACKUPFILES/vimrc.bk
ln -s $DOTFILES/gemrc .gemrc
ln -s $DOTFILES/irbrc .irbrc
ln -s $DOTFILES/pryrc .pryrc
ln -s $DOTFILES/vimrc .vimrc

echo "Linking .agignore"
mv .agignore $DOTFILES/$BACKUPFILES/agignore.bk
ln -s $DOTFILES/agignore .agignore

echo "=================================================="
echo "All the files are linked."
echo "Remember to edit the user info in .gitconfig, then you're ready to rock!"
echo "=================================================="
