#!/usr/bin/env bash

#
# Collection of usefull functions
#

# will run file according to its extension
run() {
    extension="${1##*.}"
    args="${2:-}"

    case $extension in

        "hs") runhaskell "${1:-}" "$args";;
        "sh") bash       "${1:-}" "$args";;
        "js") node       "${1:-}" "$args";;
        "py") python3    "${1:-}" "$args";;

        *)    echo "${1:-} is not a recognized extension.";;
    esac
}

# To go back a number of folders
up() {
    for ((i=0; i<"$1"; i++)) { cd ..; };
}

# Simple loop
loop() {
    declare -r expr=${1:-} # what to eval
    while true;
    do
        eval "${expr:-}";
        sleep 0.1;
    done
};

# Turn screen off
soff() {
    xset dpms force off
}

# To backup using rsync
bkp() {

    [[ -z "$1" ]] && { echo "No media for backup specified." >&2; sleep 1; return 1; } || true

    declare -r _path="/media/"
    declare -r _media="${1:-}";
    
    if [[ -d "${_path}/${USER}/${_media}/" ]];
    then
        until [[ -d "${_path}/${USER}/${_media}/backup/" ]];
        do
            echo "Creating backup folder...";
            mkdir "${_path}/${USER}/${_media}/backup/"; 
        done

        declare -r target="${_path}/${USER}/${_media}/backup/" || return 1;
        
        # old one
        #sudo rsync -ahPu --perms --exclude-from=${HOME}/.rsyncignore --delete --delete-excluded "${HOME}" "${target}" || return 1;
        
        # new one
        sudo rsync -ahPu --perms --delete --delete-excluded "${HOME}/Documents" "${target}" || return 1;
        
        return 0;
    else
        echo "[x] No media for backup found." >&2;
	    sleep 1;
	    return 1;
    fi
};

#########
## Vim ##
#########

swpkill() {
    rm -rf ${HOME:-}/.vim/files/swap/*.swp
    rm -rf ${HOME:-}/.vim/files/swap/*.swo
}
