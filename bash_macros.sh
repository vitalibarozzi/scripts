#!/usr/bin/env bash

# Flags
declare -r _strict="set -euo pipefail"

# Macros
declare -r exist="command -v"

# Debian 
declare -r install="sudo apt --yes install"
declare -r remove="sudo apt --yes remove"
declare -r autoremove="sudo apt --yes autoremove"

