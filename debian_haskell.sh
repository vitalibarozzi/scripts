# Haskell Instalation

# Imports
. bash_func.sh || { echo "Problem importing."; sleep 5; exit 1; }

$_wall

# Haskell
$exist gpp              || $install g++
$exist gcc              || $install gcc
$exist haskell-platform || $install haskell-platform
$exist hlint            || $install hlint
$exist hoogle           || $install hoogle
$exist ghc-mod          || $install ghc-mod

# TODO fix the exist part, wich have no executable to test using command -v
$exist libc6-dev        || $install libc6-dev
$exist libgmp-dev       || $install libgmp-dev
$exist gnupg            || $install gnupg
$exist libffi-dev       || $install libffi-dev
$exist zlib1g-dev       || $install zlib1g-dev
