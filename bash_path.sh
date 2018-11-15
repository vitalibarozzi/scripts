#!/usr/bin/env bash

# Library of usefull paths

# Default 
PATH+=":/bin/"
PATH+=":/usr/local/bin/"
PATH+=":/usr/bin/"
PATH+=":/usr/lib/mit/sbin/"

# Others 
PATH+=":${HOME:-}/.local/bin/"
PATH+=":${HOME:-}/.cargo/bin/"
PATH+=":${HOME:-}/.cabal/bin/"
PATH+=":${HOME:-}/Documents/scripts"
