#!/usr/bin/zsh

export EDITOR='vim'

export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin/:$PATH"
eval "$(pyenv init -)"

autoload -U colors && colors

source ~/dotfiles/paths.zsh
source ~/dotfiles/variables.zsh
source ~/dotfiles/aliases.zsh
source ~/dotfiles/functions.zsh

set -o vi

PS1="(%{$fg[yellow]%}%n%{$reset_color%}: %{$fg[cyan]%}%~%{$reset_color%}) $ "
