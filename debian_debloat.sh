# Imports
. bash_func.sh || { echo "Problem importing."; sleep 5; exit 1; }

$_wall

$remove gnome-calendar
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

$remove tali
$remove evolution
$remove thunderbird
$remove brasero
$remove cheese
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

sudo apt autoremove
