#!/usr/bin/env bash
# Usefull bash functions

# Update personal configurations
function update {
    pushd ${HOME}/Documents/configs/ &>/dev/null && make
    popd &>/dev/null
}

# To go back a number of folders
function up {
    declare -ri num="${1:-}";
    for ((i=0; i<"${num:-}"; i++)) {
        cd ..;
    };
} && declare -rf up;

# Simple loop
function loop {
    
    declare -r cmd=${1:-} # what to eval
    
    while true;
    do
        eval "${cmd:-}";
        sleep 0.1;
    done
} && declare -rf loop;

function wait_ {

    declare -r FILENAME="${1:-}"
    declare -r COMMAND="${2:-}"
    
    inotifywait -e modify ${FILENAME} | while read file; do
        eval "${COMMAND}"
    done

    wait_ "${1}" "${2}"
}

# Turn screen off
function soff {
    xset dpms force off
} && declare -rf soff;

# To backup using rsync
function bkp {
    
    [[ -z "$1" ]] && { echo "Error: No media for backup specified." >&2; sleep 1; return 1; } || true
    
    declare -r _path="/media"
    declare -r _media="${1:-}";
    
    echo "Backuping [${_path}/${USERNAME}/${_media}/]..."
    if [[ -d "${_path}/${USERNAME}/${_media}/" ]];
    then
        until [[ -d "${_path}/${USERNAME}/${_media}/backup/" ]];
        do
            echo "Creating backup folder...";
            mkdir "${_path}/${USERNAME}/${_media}/backup/";
        done
        
        declare -r target="${_path}/${USERNAME}/${_media}/backup/" || return 1;
        
        # old one
        #sudo rsync -ahPu --perms --exclude-from=${HOME}/.rsyncignore --delete --delete-excluded "${HOME}" "${target}" || return 1;
        
        # new one
        sudo rsync -ahPu --perms --delete --delete-excluded "${HOME}/Documents" "${target}" || return 1;
        
        return 0;
    else
        echo "Error: No media for backup found." >&2;
        sleep 1;
        return 1;
    fi
} && declare -rf bkp;

# Create new prompt
parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function exitstatus {

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

    declare -r BAR="${GREEN}${USER}@${HOST}${OFF} ${BLUE}\w${OFF}${BOLD}$(parse_git_branch)${OFF}"
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

# To delete swap files of vim
function swpkill {
    rm -rf ${HOME:-}/.vim/files/swap/*.swp
    rm -rf ${HOME:-}/.vim/files/swap/*.swo
} && declare -rf swpkill;
