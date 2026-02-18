#!/bin/bash

[[ $- != *i* ]] && return

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTTIMEFORMAT="%d/%m/%y %H:%M:%S "
export HISTCONTROL=ignorespace
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias ls='ls --color=auto'
alias ll='ls -la'
alias gd='git diff'
alias gds='git diff --staged'
alias k=kubectl

[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

[[ -f "$HOME/.bash_functions" ]] && source ~/.bash_functions
[[ -f "$HOME/.bash_functions_work" ]] && source ~/.bash_functions_work

alias mp="source miniprompt"
mp
