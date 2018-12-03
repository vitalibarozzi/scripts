#!/usr/bin/env bash
declare -r install="sudo apt --yes install"
declare -r exist="command -v"

# Haskell
$exist gpp              || $install g++
$exist gcc              || $install gcc
$exist haskell-platform || $install haskell-platform
$exist hlint            || $install hlint
$exist hoogle           || $install hoogle
$exist ghc-mod          || $install ghc-mod
$exist stylish-haskell  || $install stylish-haskell
$exist ghcid            || $install ghcid

# TODO fix the exist part, wich have no executable to test using command -v
$exist libc6-dev        || $install libc6-dev
$exist libgmp-dev       || $install libgmp-dev
$exist gnupg            || $install gnupg
$exist libffi-dev       || $install libffi-dev
$exist zlib1g-dev       || $install zlib1g-dev
