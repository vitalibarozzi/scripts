#!/usr/bin/env bash

###################################
# Collection of usefull functions #
###################################

# will run file according to its extension
function run {
    
    declare -r extension="${1##*.}"
    declare -r args="${2:-}"
    
    case $extension in
        
        "hs") runhaskell "${1:-}" "$args";;
        "sh") bash       "${1:-}" "$args";;
        "js") node       "${1:-}" "$args";;
        "py") python3    "${1:-}" "$args";;
        
        *)    echo "${1:-} is not a recognized extension.";;
    esac
} &&  declare -rf run;

# To go back a number of folders
function up {

    declare -r num="${1:-}";

    for ((i=0; i<"${num:-}"; i++)) {
        cd ..;
    };
} && declare -rf up;

# Simple loop
function loop {
    
    declare -r expr=${1:-} # what to eval
    
    while true;
    do
        eval "${expr:-}";
        sleep 0.1;
    done
} && declare -rf loop;

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

#########
## Vim ##
#########

# to delete swap files
function swpkill {
    rm -rf ${HOME:-}/.vim/files/swap/*.swp
    rm -rf ${HOME:-}/.vim/files/swap/*.swo
} && declare -rf swpkill;
