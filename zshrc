#!/usr/bin/zsh

export LC_ALL="en_US.UTF-8"
export EDITOR='vim'

setopt interactivecomments
setopt HIST_IGNORE_SPACE

source ~/dotfiles/paths.zsh
source ~/dotfiles/variables.zsh
source ~/dotfiles/aliases.zsh
source ~/dotfiles/functions.zsh

set -o vi
bindkey -v
