#!/usr/bin/zsh

autoload -U colors && colors

# Vim
export EDITOR='vim'

# Shortcuts
source ~/dotfiles/paths.zsh
source ~/dotfiles/variables.zsh
source ~/dotfiles/aliases.zsh
source ~/dotfiles/functions.zsh

# CLI Vim mode
set -o vi

# Prompt
PS1="(%{$fg[yellow]%}%n%{$reset_color%}: %{$fg[cyan]%}%~%{$reset_color%}) $ "

# Python
export PYENV_ROOT="$HOME/.pyenv"
PATH="$PYENV_ROOT/bin/:$PATH"
eval "$(pyenv init -)"

# Ruby
source /usr/local/share/chruby/chruby.sh
chruby 3.2.0

# Node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
