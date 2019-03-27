
#!/usr/bin/env bash
# Agda installation stuff

declare -r install="sudo apt --yes install"
declare -r exist="command -v"

$install agda
$install agda-bin
$install agda-mode
$install agda-stdlib
$install libghc-agda-dev
