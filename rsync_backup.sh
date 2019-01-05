#!/usr/bin/env bash
# To backup home folder to extern drive.

# To backup using rsync
function bkp
{
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
        
        declare -r args="--times --stats --links --partial --progress --human-readable --preallocate --recursive --perms --owner --devices --specials --group --delete --delete-excluded"
        declare -r rsync="sudo rsync"

        ${rsync:-} ${args:-} "${HOME}/Documents" "${target:-}";
        sleep 3;
        ${rsync:-} ${args:-} "${HOME}/Music"     "${target:-}";
        sleep 3;
        ${rsync:-} ${args:-} "${HOME}/Pictures"  "${target:-}";
        sleep 3;
        ${rsync:-} ${args:-} "${HOME}/Videos"    "${target:-}";
        sleep 3;
        return 0;
    else
        echo "Error: No media for backup found." >&2;
        sleep 1;
        return 1;
    fi
} && declare -rf bkp;

