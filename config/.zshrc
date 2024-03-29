# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jim/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# zsh-syntax-highlighting must be last!
plugins=(git npm aws zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export EDITOR=nano

# Powerline
# . /home/jim/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cdmxb="cd ~/code/maritimexchange-backend/"
alias cdmx="cd ~/code/maritimexchange/"
alias mux=tmuxinator
alias muxmx="mux start mx"
alias muxkillmx="tmux kill-session -t mx"
alias mx="terminator --layout mx"
alias sqhi="sudo cp /etc/pulse/daemon-hi.conf /etc/pulse/daemon.conf && pulseaudio -k && pulseaudio --start"
alias sqdefault="sudo cp /etc/pulse/daemon-default.conf /etc/pulse/daemon.conf && pulseaudio -k && pulseaudio --start"
alias c="tput reset"
alias fixAltDirectionKeys="sudo kbd_mode -s"
alias disconnectWiFi="nmcli d disconnect wlp2s0"
alias pixeluvo="cd /home/jim/.local/share/Steam/steamapps/common/Pixeluvo/ && ./pixeluvo"
alias screenSingle1080="sh ~/.screenlayout/single-1080.sh"
alias screenDual1080="sh ~/.screenlayout/dual-1080.sh"
alias naturalScrolling="sh ~/dotfiles-ubuntu/scripts/natural-scrolling.sh"
alias vpnMXup="nmcli con up jim-mx-vpn"
alias vpnMXdown="nmcli con down jim-mx-vpn"
alias vpnSanup="nmcli con up sangwinenet"
alias vpnSandown="nmcli con down sangwinenet"

# BASH completion
source /etc/bash_completion.d/climate_completion

# Script to allow opening terminator with continuous commands
# Enter custom commands in ~/.config/terminator/config like this:
# env INIT_CMD="cd bla; npm start" zsh
echo $INIT_CMD
if [ ! -z "$INIT_CMD" ]; then
    OLD_IFS=$IFS
    setopt shwordsplit
    IFS=';'
    for cmd in $INIT_CMD; do
        print -s "$cmd"  # add to history
        eval $cmd
    done
    unset INIT_CMD
    IFS=$OLD_IFS
fi

# MOTD
if [[ -d ~/.motd.d ]]; then
    for motd in ~/.motd.d/*; do
      if [ ! -d "$motd" ]; then
        zsh $motd
      fi
    done
fi
