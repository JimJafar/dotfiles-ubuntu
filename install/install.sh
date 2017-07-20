#!/usr/bin/env bash

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.gitconfig ~/.gitconfig

if [ -f ~/.bash_aliases ]; then
  mv ~/.bash_aliases ~/.bash_aliases-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.bash_aliases ~/.bash_aliases

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc-pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.zshrc ~/.zshrc
