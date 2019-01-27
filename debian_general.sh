#!/usr/bin/env bash
# General Instalations 

declare -r exist="command -v"
declare -r install="sudo apt --yes install"

$exist make     || $install make
$exist vim      || $install vim
$exist vifm     || $install vifm
$exist screen   || $install screen
$exist ctags    || $install ctags
$exist curl     || $install curl
$exist mutt     || $install mutt
$exist git      || $install git

$exist konsole  || $install konsole
$exist tree     || $install tree
$exist cmus     || $install cmus
$exist newsboat || { echo "i dont know hot to install newsboat" >&2; }
