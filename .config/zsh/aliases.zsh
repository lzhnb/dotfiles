#!/usr/bin/env bash

## Colorize the ls output ##
alias ls="ls -G"

## Use a long listing format ##
alias ll="ls -la"

## Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

## Colorize the grep command output for ease of use (good for log files)##
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

## mv, rm, cp
alias mv="mv -v"
alias rm="rm -i -v"
alias cp="cp -v"

## use local bin
[[ ! -f "$HOME/.local/bin/tmux" ]] || alias tmux="$HOME/.local/bin/tmux"
[[ ! -f "$HOME/.local/bin/vim" ]] || alias vim="$HOME/.local/bin/vim"
[[ ! -f "$HOME/.local/bin/nvim" ]] || alias nvim="$HOME/.local/bin/nvim"


