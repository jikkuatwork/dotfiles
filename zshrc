#!/usr/bin/zsh

export EDITOR='vim'
autoload -U colors && colors

source ~/dotfiles/paths.zsh
source ~/dotfiles/variables.zsh
source ~/dotfiles/aliases.zsh
source ~/dotfiles/functions.zsh

set -o vi
PS1="(%m, %n: %~) $ "
PS1="(%{$fg[yellow]%}%n%{$reset_color%}: %{$fg[cyan]%}%~%{$reset_color%}) $ "
