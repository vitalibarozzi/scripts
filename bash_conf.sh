# Desc:    General Configurations

# History ====================================================================

declare -g  HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
declare -g     HISTSIZE=100
declare -g HISTFILESIZE=200

shopt -s histappend   # append to the history file, don't overwrite it

# Others =====================================================================

declare -g EDITOR=vim
declare -g BROWSER=firefox

# Run stuff ==================================================================

shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

