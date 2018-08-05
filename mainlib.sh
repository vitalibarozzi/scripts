#!/usr/bin/env bash

#######################################
# Serves as entrance to the structure #
# Will source the other files         #
#######################################

RC="/.local/lib/bash/"
EXT=".sh"

####################
## Load externals ##
####################

. "${HOME:-}${RC:-}/pathlib${EXT:-}" 
. "${HOME:-}${RC:-}/aliaslib${EXT:-}"
. "${HOME:-}${RC:-}/funclib${EXT:-}"

#############
## History ##
#############

declare -g  HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
declare -g     HISTSIZE=1000
declare -g HISTFILESIZE=2000

shopt -s histappend   # append to the history file, don't overwrite it

###############
## Run stuff ##
###############

shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

############
## Prompt ##
############

function exitstatus {

    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[0;31m\]"
    GREEN="\[\e[0;32m\]"
    BLUE="\[\e[34m\]"
    OFF="\[\033[m\]"

    HOST="\h"
    USER="\u"
    DIR="\w"
    NEWLINE="\n"
    DATE="\d"
    TIME="\t"

    PROMPT="\n${TIME} ${DATE} \n${RED}${USER}@${HOST}:[${BLUE}\w${RED}]"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
        PS1="${PROMPT} \n${GREEN}${EXITSTATUS}${OFF} "
    else
        PS1="${PROMPT} \n${GREEN}${EXITSTATUS}${OFF} "
    fi

    PS2="${BOLD}>${OFF} "
} && PROMPT_COMMAND=exitstatus