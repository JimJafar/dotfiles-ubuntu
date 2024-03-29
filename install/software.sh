#!/usr/bin/env bash

# atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

# climate
sudo apt install curl
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/adtac/climate/master/install)"

# shutter (screenshot + editor like Skitch)
# ppa did not have a release for zesty at the time of writing
# sudo add-apt-repository -y ppa:shutter/ppa
# sudo apt update
sudo apt install shutter

# Skype
# make sure you have 'apt-transport-https' installed
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
sudo apt-get update
sudo apt-get install skypeforlinux -y

# gpaste (clipboard manager)
# sudo apt install gpaste
# sudo apt install gnome-shell-extensions-gpaste
# sudo killall -3 gnome-shell # restart gnome-shell so the shell extension shows up in tweak tool

# meld
sudo apt install meld

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# typora markdown editor
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
# sudo add-apt-repository 'deb https://typora.io ./linux/'
# sudo apt-get update
# sudo apt-get install typora

# get rid of the irritating CTRL+SHIFT+U shortcut for entering unicode characters
# sudo -s
# echo -e '[desktop/gnome/interface]\nshow_unicode_menu=false' > /etc/dconf/db/ibus.d/01-remove-ctrl-shift-u
# dconf update
# exit
# killall ibus-engine-simple
# ibus-engine-simple

# Enable Ledger Nano S: http://support.ledgerwallet.com/knowledge_base/topics/ledger-wallet-is-not-recognized-on-linux
wget -q -O - https://www.ledgerwallet.com/support/add_udev_rules.sh | sudo bash

# zsh stuff
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# FontAwesome
sudo apt install fonts-font-awesome

# i3
sudo apt install i3
sudo apt install i3blocks
sudo apt install compton
sudo apt install rofi
sudo apt install feh
sudo apt install arandr
sudo apt install lxappearance
