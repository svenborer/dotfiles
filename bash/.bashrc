#!/bin/bash

[[ $- != *i* ]] && return

. ~/.bash_aliases

BLUE=$'\[\e[34m\]'
RED=$'\[\e[31m\]'
YELLOW=$'\[\e[33m\]'
GREEN=$'\[\e[32m\]'
GREY=$'\[\e[37m\]'
RESET=$'\[\e[0m\]'

export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=20000
export PROMPT_COMMAND='history -w; history -a'

shopt -s histappend

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1 && cd $(echo $1 | sed 's/.tar.bz2//')    ;;
           *.tar.gz)    tar xvzf $1 && cd $(echo $1 | sed 's/.tar.gz//')    ;;
           *.bz2)       bunzip2 $1 && cd $(echo $1 | sed 's/.bz2//')    ;;
           *.rar)       unrar x $1 && cd $(echo $1 | sed 's/.rar//')    ;;
           *.gz)        gunzip $1 && cd $(echo $1 | sed 's/.gz//')    ;;
           *.tar)       tar xvf $1 && cd $(echo $1 | sed 's/.tar//')    ;;
           *.tbz2)      tar xvjf $1 && cd $(echo $1 | sed 's/.tbz2//')    ;;
           *.tgz)       tar xvzf $1 && cd $(echo $1 | sed 's/.tgz//')    ;;
           *.zip)       unzip $1 && cd $(echo $1 | sed 's/.zip//')    ;;
           *.Z)         uncompress $1 && cd $(echo $1 | sed 's/.Z//')    ;;
           *.7z)        7z x $1 && cd $(echo $1 | sed 's/.7z//')    ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

showGitBranch() {
    git status 2> /dev/null | head -1 | awk '{ print $3 }'
}

CHAR='>'

export PS1="${GREY}\t ${GREEN}\u${GREY}@${GREEN}\h ${RED}\w ${BLUE}\$(showGitBranch)${RESET}\n ${CHAR} "
