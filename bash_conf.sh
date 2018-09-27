# ============================================================================
#
# Desc:    General Configurations
# Author:  J. V. Vitali Barozzi
# License: MIT
#
# ============================================================================

# History ====================================================================

declare -g  HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
declare -g     HISTSIZE=1000
declare -g HISTFILESIZE=2000

shopt -s histappend   # append to the history file, don't overwrite it

# Others =====================================================================

declare -g EDITOR=vim
declare -g BROWSER=firefox

# Run stuff ==================================================================

shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

