#!/usr/bin/env bash
# To remove stuff i dont like from Debian

declare -r remove="sudo apt --yes remove"

$remove gnome-calendar
$remove gnome-terminal
$remove gnome-weather
$remove gnome-clocks
$remove gnome-contacts
$remove gnome-tetravex
$remove gnome-chess
$remove gnome-sudoku
$remove gnome-klotski
$remove gnome-dictionary
$remove gnome-maps
$remove gnome-mines
$remove gnome-robots
$remove gnome-nibbles
$remove gnome-mahjongg
$remove gnome-taquin

$remove khmerconverter
$remove libreoffice-help-km
$remove task-khmer-desktop
$remove task-khmer
$remove fonts-khmeros

$remove mozc-data
$remove mozc-server
$remove mozc-utils-gui
$remove uim-mozc

$remove synaptic
$remove scim
$remove mlterm
$remove tali
$remove evolution
$remove thunderbird
$remove brasero
$remove goldendict
$remove four-in-a-row
$remove anthy
$remove kasumi
$remove libhdate1
$remove xiterm+thai
$remove iagno
$remove swell-foop
$remove five-or-more
$remove hitori
$remove shotwell
$remove lightsoff
$remove quadrapassel
$remove rhythmbox
$remove polari

sudo apt --yes autoremove
