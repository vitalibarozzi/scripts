#!/usr/bin/env bash
# To backup home folder to extern drive.

# To backup using rsync
function bkp
{
    [[ -z "$1" ]] && { echo "Error: No media for backup specified." >&2; sleep 1; return 1; } || true
    
    declare -r _path="/media"
    declare -r _media="${1:-}";
    declare -r media="${_path:-}/${USERNAME:-}/${_media:-}/"
    declare -r target="${media:-}/backup";
    declare -r args="--times --stats --links --partial --progress --human-readable --preallocate --recursive --perms --owner --devices --specials --group --delete --delete-excluded"
    declare -r rsync="sudo rsync"

    echo "Backuping [${media}/]..."
    if [[ -d "${media:-}" ]];
    then

        # Ensure folder exists
        until [[ -d "${target:-}" ]];
        do
            echo "Creating backup folder...";
            mkdir "${target:-}";
        done
        
        ${rsync:-} ${args:-} "${HOME}/Documents" "${target:-}";
        ${rsync:-} ${args:-} "${HOME}/Music"     "${target:-}";
        ${rsync:-} ${args:-} "${HOME}/Pictures"  "${target:-}";
        ${rsync:-} ${args:-} "${HOME}/Videos"    "${target:-}";
        return 0;
    else
        echo "Error: No media for backup found at '${media:-}/'." >&2;
        return 1;
    fi
} && declare -rf bkp;

