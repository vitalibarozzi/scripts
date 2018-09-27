# ============================================================================
#
# Desc:    Library of usefull paths
# Author:  J. V. Vitali Barozzi
# License: MIT
#
# ============================================================================

# Default ==================================================================== 

PATH+=":/bin/"
PATH+=":/usr/local/bin/"
PATH+=":/usr/bin/"
PATH+=":/usr/lib/mit/sbin/"

# Binaries =================================================================== 

PATH+=":${HOME:-}/.local/bin/"
PATH+=":${HOME:-}/.cargo/bin/"
PATH+=":${HOME:-}/.cabal/bin/"
PATH+=":${HOME:-}/Documents/utils/scripts"

# Scripts ==================================================================== 

PATH+=":${HOME:-}/Documents/utils/scripts"
