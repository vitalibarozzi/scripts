#!/usr/bin/env bash
# To backup home folder to extern drive.

declare -r _path="/media"

[[ -z "$1" ]] && {
    echo "Error: No media for backup specified." >&2;
    sleep 1; 
    exit 1;
} && declare -r _media="${1:-}";

echo "Backuping [${_path}/${USERNAME}/${_media}/]..."
[[ -d "${_path}/${USERNAME}/${_media}/" ]] && {
    until [[ -d "${_path}/${USERNAME}/${_media}/backup/" ]];
    do
        echo "Creating backup folder...";
        mkdir "${_path}/${USERNAME}/${_media}/backup/";
    done
    declare -r target="${_path}/${USERNAME}/${_media}/backup/" || exit 1;
    sudo rsync --times --stats --links --partial --progress --human-readable --preallocate --recursive --checksum --perms --owner --devices --specials --group --delete --delete-excluded "${HOME}/Documents" "${target}" || return 1;
    exit 0;
} || {
    echo "Error: No media for backup found." >&2;
    sleep 1;
    exit 1;
}
