#!/usr/bin/env bash

#
# Hold usefull paths
#

###########
## PATHS ##
###########

PATH+=":/usr/local/bin/"
PATH+=":/usr/bin/"
PATH+=":/bin/"
PATH+=":/usr/lib/mit/sbin/"
PATH+=":${HOME:-}/.vimpkg/bin/"
PATH+=":${HOME:-}/.cargo/bin/"
PATH+=":${HOME:-}/.local/bin/"
PATH+=":${HOME:-}/Documents/scripts/"
PATH+=":${HOME:-}/Documents/_/"
PATH+=":/usr/local/haskell/ghc-8.4.2-x86_64/bin/"

############
## OTHERS ##
############

EDITOR=vim
BROWSER=firefox

##########
## Lang ##
##########

[[ ${LANG:-} = '' ]] && export LANG="en_US.UTF-8"
