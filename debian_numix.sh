#!/usr/bin/env bash
# To install numix icon theme and gtk

declare -r install="sudo apt --yes install"

$install numix-icon-theme
$install numix-gtk-theme
