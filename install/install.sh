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

if [ -f ~/.config/terminator/config ]; then
  mv ~/.config/terminator/config ~/.config/terminator/config.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.terminator ~/.config/terminator/config

sh ~/dotfiles-ubuntu/install/templates.sh

echo "i3"

if [ ! -d ~/.config/i3 ]; then
  mkdir ~/.config/i3
fi
if [ -f ~/.config/i3/config ]; then
  mv ~/.config/i3/config ~/.config/i3/config.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/i3/config ~/.config/i3

if [ -f ~/.config/i3/i3blocks.conf ]; then
  mv ~/.config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/i3/i3blocks.conf ~/.config/i3

if [ ! -f ~/lock-i3.sh ]; then
  ln -s ~/dotfiles-ubuntu/scripts/lock-i3.sh ~/lock-i3.sh
fi

# gtk

if [ -f ~/.gtkrc-2.0 ]; then
  mv ~/.gtkrc-2.0 ~/.gtkrc-2.0.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/.gtkrc-2.0 ~/.gtkrc-2.0

if [ -f ~/.config/gtk-3.0/settings.ini ]; then
  mv ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/

# natural scrolling

if [ ! -f ~/natural-scrolling.sh ]; then
  ln -s ~/dotfiles-ubuntu/scripts/natural-scrolling.sh ~/natural-scrolling.sh
fi

# screen layouts

if [ -d ~/.screenlayout ]; then
  mv ~/.screenlayout ~/.screenlayout.pre-dotfiles-bak
fi
ln -s ~/dotfiles-ubuntu/config/screenlayout ~/.screenlayout

echo "changing default shell to zsh"
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh jim

echo "DONE"
