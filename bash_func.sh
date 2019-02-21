#!/usr/bin/env bash
# Usefull bash functions

# ----------------------------------------------------------
# Update personal configurations
function update
{
    (cd ${HOME}/Documents/configs/ &>/dev/null && make);
} && declare -rf update;

# ----------------------------------------------------------
# To go back a number of folders
function up
{
    declare -ri num="${1:-}";
    for ((i=0; i<"${num:-}"; i++)) {
        cd ..;
    };
} && declare -rf up;

# ----------------------------------------------------------
# Simple loop
function loop
{
    declare -r cmd=${1:-} # what to eval
    
    while true;
    do
        eval "${cmd:-}";
        sleep 0.1;
    done
} && declare -rf loop;

# ----------------------------------------------------------
function wait_
{
    declare -r FILENAME="${1:-}"
    declare -r COMMAND="${2:-}"
    
    inotifywait -e modify ${FILENAME} | while read file; do
        eval "${COMMAND}"
    done

    wait_ "${1}" "${2}"
} && declare -rf wait;

# ----------------------------------------------------------
# Turn screen off
function soff
{
    xset dpms force off
} && declare -rf soff;

# ----------------------------------------------------------
# Create new prompt
function parse_git_branch
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# ----------------------------------------------------------
function exitstatus
{
    declare -r EXITSTATUS="$?"
    declare -r BOLD="\[\033[1m\]"
    declare -r RED="\[\033[0;31m\]"
    declare -r GREEN="\[\e[0;32m\]"
    declare -r BLUE="\[\e[34m\]"
    declare -r OFF="\[\033[m\]"

    declare -r BGGREEN="\[\e[0;32m\]"
    
    declare -r HOST="\h"
    declare -r USER="\u"
    declare -r DIR="\w"
    declare -r NEWLINE="\n"
    declare -r DATE="\d"
    declare -r TIME="\t"

    declare -r BAR="${GREEN}${USER}${OFF} ${BLUE}\w${OFF}${BOLD}$(parse_git_branch)${OFF}"
    declare -r PROMPTU="┏━"
    declare -r PROMPTD="┗━"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
        PS1="\n${GREEN}${PROMPTU}${OFF} ${BAR}\n${GREEN}${PROMPTD}${OFF} "
    else
        PS1="\n${RED}${PROMPTU}${OFF} Exit code ${RED}${BOLD}${EXITSTATUS}${OFF} at ${BOLD}${TIME}${OFF} of ${BOLD}${DATE}${OFF}\n${RED}${PROMPTD}${OFF} "
    fi

    PS2="${BOLD}>${OFF} "
} && declare -rf exitstatus && declare -rg PROMPT_COMMAND=exitstatus

# ----------------------------------------------------------
# To delete swap files of vim
function swpkill
{
    rm -rf ${HOME:-}/.vim/files/swap/*.swp
    rm -rf ${HOME:-}/.vim/files/swap/*.swo
} && declare -rf swpkill;
