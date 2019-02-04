#!/usr/bin/env bash
# To backup home folder to extern drive.

# To backup using rsync
# bkp : FilePath -> IO ()
function bkp
{
    declare -r _path="/media"
    declare -r _media="${1:-}";
    declare -r media="${_path:-}/${USERNAME:-}/${_media:-}/"
    declare -r target="${media:-}/backup";
    declare -r args="--delete --times --stats --links --human-readable --recursive --perms --group"
    declare -r rsync="rsync"
    declare -r noMediaSpec="Error: No media for backup specified."
    declare -r noMediaFound="Error: No media for backup found at '${media:-}/'."

    [[ -z "$1" ]] && { echo ${noMediaSpec} >&2; sleep 1; return 1; } || true
    
    echo "Backuping [${media}/]..."
    if [[ -d "${media:-}" ]];
    then
        # Ensure folder exists
        until [[ -d "${target:-}" ]] && sleep 1;
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
        echo ${noMediaFound} >&2;
        return 1;
    fi
} && declare -rf bkp;

