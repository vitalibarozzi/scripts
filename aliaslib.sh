#!/usr/bin/env bash

##########################################
# Hold aliases for common used commands ##
##########################################

alias ls='ls --color=always --group-directories-first --almost-all --human-readable --sort=extension -l'

#########
## Git ##
#########

alias   diff='git diff'
alias  clone='git clone'
alias branch='git branch'
alias    add='git add'
alias status='git status'
alias commit='git commit -m'
alias    log='git log'
alias   push='git push'

################
## Quick Ones ##
################

alias c="clear";
alias e="exit \$?";
alias s="sudo";

#############
## Haskell ##
#############

alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo -dsuppress-coercions -dsuppress-type-applications -dsuppress-uniques -dsuppress-module-prefixes"
