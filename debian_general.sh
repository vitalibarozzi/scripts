# General Instalations 

# Imports
. bash_func.sh || { echo "Problem importing."; sleep 5; exit 1; }

# Flags
$_wall

# Stuff
$exist vim   || $install vim
$exist vifm  || $install vifm
$exist git   || $install git
$exist curl  || $install curl
$exist mutt  || $install mutt
$exist ctags || $install ctags
$exist tmux  || $install tmux
$exist make  || $install make
