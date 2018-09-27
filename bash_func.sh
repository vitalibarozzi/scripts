# ============================================================================
#
# Descrition : Usefull bash functions and "macros"
# Author     : J. V. Vitali Barozzi
# License    : MIT
#
# ============================================================================

# Flags ======================================================================
declare -r _wall="set -euo pipefail"

# Macros =====================================================================
declare -r panic="echo PANIC! >&2; exit 13;"
declare -r exist="command -v"

# Debian Apt =================================================================
declare -r install="sudo apt --yes install"
declare -r remove="sudo apt --yes remove"

# Functions ==================================================================

# ======================================== #
# Will run file according to its extension #
# ======================================== #
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

# ============================== #
# To go back a number of folders #
# ============================== #
function up {
    declare -ri num="${1:-}";
    for ((i=0; i<"${num:-}"; i++)) {
        cd ..;
    };
} && declare -rf up;

# =========== #
# Simple loop #
# =========== #
function loop {
    
    declare -r expr=${1:-} # what to eval
    
    while true;
    do
        eval "${expr:-}";
        sleep 0.1;
    done
} && declare -rf loop;

# =============== #
# Turn screen off #
# =============== #
function soff {
    xset dpms force off
} && declare -rf soff;

# ===================== #
# To backup using rsync #
# ===================== #
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

# ================= #
# Create new prompt #
# ================= #
function exitstatus {

    declare -r EXITSTATUS="$?"
    declare -r BOLD="\[\033[1m\]"
    declare -r RED="\[\033[0;31m\]"
    declare -r GREEN="\[\e[0;32m\]"
    declare -r BLUE="\[\e[34m\]"
    declare -r OFF="\[\033[m\]"

    declare -r HOST="\h"
    declare -r USER="\u"
    declare -r DIR="\w"
    declare -r NEWLINE="\n"
    declare -r DATE="\d"
    declare -r TIME="\t"

    declare -r PROMPT="\n${GREEN}${USER}@${HOST}${OFF}: [${BLUE}\w${OFF}]"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
        PS1="${PROMPT} \n[${GREEN}✔️${OFF}] "
    else
        PS1="${PROMPT} \n[${RED}✗${OFF}] {ERROR: ${RED}${EXITSTATUS}${OFF}} "
    fi

    PS2="${BOLD}>${OFF} "
} && declare -rf exitstatus && declare -rg PROMPT_COMMAND=exitstatus

# =========================== #
# To delete swap files of vim #
# =========================== #
function swpkill {
    rm -rf ${HOME:-}/.vim/files/swap/*.swp
    rm -rf ${HOME:-}/.vim/files/swap/*.swo
} && declare -rf swpkill;

