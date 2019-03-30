#!/usr/bin/env bash
# Library of usefull paths

# Helpers
DOCS="${HOME:-}/Documents"

# Default 
PATH+=":/bin/"
PATH+=":/usr/local/bin/"
PATH+=":/usr/bin/"
PATH+=":/usr/lib/mit/sbin/"

# Others 
PATH+=":${HOME:-}/.local/bin/"
PATH+=":${HOME:-}/.cargo/bin/"
PATH+=":${HOME:-}/.cabal/bin/"
PATH+=":${DOCS:-}/executables/scripts"
PATH+=":${DOCS:-}/executables/binaries"

# Haskell
PATH+=":${HOME:-}/.ghcup/bin/"

