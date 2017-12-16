#!/usr/bin/env bash

echo "git config"

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.gitconfig ~/.gitconfig

echo "bash aliases"

if [ -f ~/.bash_aliases ]; then
  mv ~/.bash_aliases ~/.bash_aliases-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.bash_aliases ~/.bash_aliases

echo "zshrc"

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.zshrc ~/.zshrc

echo "motd"

if [ -d ~/.motd.d ]; then
  if [ ! -L ~/.motd.d ]; then
    mv ~/.motd.d ~/.motd.d-pre-dotfiles-bak
  else
    rm ~/.motd.d
  fi
fi
ln -s ~/dotfiles-ubuntu/config/.motd.d ~/

echo "file templates"

sh ~/dotfiles-ubuntu/install/templates.sh

echo "changing default shell to zsh"
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh jim

echo "DONE"
