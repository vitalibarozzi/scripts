# ============================================================================
#
# Desc:    Serves as entrance. Will source other files
# Author:  J. V. Vitali Barozzi
# License: MIT
#
# ============================================================================

RC="Documents/dev_utils/scripts"
EXT=".sh"

# Load externals =============================================================

. "${HOME:-}/${RC:-}/bash_conf${EXT:-}"
. "${HOME:-}/${RC:-}/bash_func${EXT:-}"
. "${HOME:-}/${RC:-}/bash_path${EXT:-}" 
. "${HOME:-}/${RC:-}/bash_alias${EXT:-}"

