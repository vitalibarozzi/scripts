#!/usr/bin/env bash
# To sync my reading file to kindle 

# To sync kindle files
function ksync
{
    declare -r _path="/media"
    declare -r _media="Kindle";
    declare -r media="${_path:-}/${USERNAME:-}/${_media:-}"
    declare -r docs="${media:-}/documents/"
    declare -r args="--times --stats --links --partial --progress --human-readable --recursive --perms --owner --devices --specials --group"
    declare -r rsync="sudo rsync"
    
    echo "Kindle: [${media:-}]..."
    if [[ -d "${media:-}" ]];
    then
        
        # Ensure folder exists
        until [[ -d "${docs:-}" ]];
        do
            echo "Creating documents folder in Kindle...";
            mkdir "${docs:-}";
        done
        
        # Down pdrs
        ${rsync:-} ${args:-} --include="*.pdr" "${docs:-}" "${HOME}/Documents/leitura/";

        # Up *
        ${rsync:-} ${args:-} --include="*" "${HOME}/Documents/leitura/" "${docs:-}";

        return 0;
    else
        echo "Error: Kindle not found at '${media:-}'." >&2;
        return 1;
    fi
} && declare -rf ksync;

