#!/usr/bin/env bash
. bash_macros.sh || exit 1;

# General Instalations 

$exist vim   || $install vim
$exist vifm  || $install vifm
$exist git   || $install git
$exist curl  || $install curl
$exist mutt  || $install mutt
$exist ctags || $install ctags
$exist tmux  || $install tmux
$exist make  || $install make
$exist tree  || $install tree

$exist newsboat || echo "i dont know hot to install newboat"
