#!/usr/bin/env bash
. bash_macros.sh || exit 1;

# Elm Instalation
function node_force_install() {
    $exist curl || { $install curl && $install software-properties-common; }
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt-get install -y nodejs
    sudo apt-get install gcc g++ make
    $exist nodejs || { echo couldnt find node; exit 1; }
    $exist npm    || { echo couldnt find npm ; exit 1; }
}

# Installer
function elm_force_install() {
    declare -r elmbins="binaries-for-linux.tar.gz"
    wget "https://github.com/elm/compiler/releases/download/0.19.0/binaries-for-linux.tar.gz"
    tar xzf $elmbins && { rm -rf $elmbins || true; }
    sudo mv elm /usr/local/bin/
}

function spades_force_install() {
    sudo npm -g install git+https://github.com/rogeriochaves/spades.git
}

# Elm
$exist nodejs || node_force_install
$exist npm    || node_force_install
$exist elm    || elm_force_install
#$exist elm-generate || spades_force_install

