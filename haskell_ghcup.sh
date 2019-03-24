#!/bin/sh

# safety subshell to avoid executing anything in case this script is not downloaded properly
(

: "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}"

die() {
    (>&2 printf "\\033[0;31m%s\\033[0m\\n" "$1")
    exit 2
}

edo()
{
    (>&2 printf "\\033[0;35m%s\\033[0m\\n" "$*")
    "$@" || exit 2
}

echo
echo "Welcome to Haskell!"
echo
echo "This will download and install the Glasgow Haskell Compiler (GHC) for "
echo "the Haskell programming language, and the Cabal build tool."
echo
echo "It will add the 'cabal', 'ghc', and 'ghcup' executables to bin directory "
echo "located at: "
echo
echo "  $GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin"
echo
echo "and create the environment file $GHCUP_INSTALL_BASE_PREFIX/.ghcup/env"
echo "which you should source in your ~/.bashrc or similar to get the required"
echo "PATH components."
echo

if [ -z "${BOOTSTRAP_HASKELL_NONINTERACTIVE}" ] ; then
	echo "To proceed with the installation press enter, to cancel press ctrl-c."
	echo "Note that this script can be re-run at any given time."
	echo

	# Wait for user input to continue.
	# shellcheck disable=SC2034
	read -r answer </dev/tty
fi

edo mkdir -p "${GHCUP_INSTALL_BASE_PREFIX}"/.ghcup/bin

if command -V "ghcup" >/dev/null 2>&1 ; then
	if [ -z "${BOOTSTRAP_HASKELL_NO_UPGRADE}" ] ; then
		edo ghcup upgrade
	fi
else
	edo curl https://raw.githubusercontent.com/haskell/ghcup/master/ghcup > "${GHCUP_INSTALL_BASE_PREFIX}"/.ghcup/bin/ghcup
	edo chmod +x "${GHCUP_INSTALL_BASE_PREFIX}"/.ghcup/bin/ghcup

	cat <<-EOF > "${GHCUP_INSTALL_BASE_PREFIX}"/.ghcup/env || die "Failed to create env file"
		export PATH="\$HOME/.cabal/bin:\${GHCUP_INSTALL_BASE_PREFIX:=\$HOME}/.ghcup/bin:\$PATH"
		EOF
	# shellcheck disable=SC1090
	edo . "${GHCUP_INSTALL_BASE_PREFIX}"/.ghcup/env
fi

edo ghcup install

edo ghcup set
edo ghcup install-cabal

edo cabal new-update
# 1 job until https://github.com/haskell/cabal/issues/5776 is fixed
edo cabal new-install --symlink-bindir="$HOME/.cabal/bin" --jobs=1 cabal-install

printf "\\033[0;35m%s\\033[0m\\n" ""
printf "\\033[0;35m%s\\033[0m\\n" "Installation done!"
printf "\\033[0;35m%s\\033[0m\\n" ""
printf "\\033[0;35m%s\\033[0m\\n" "Don't forget to source $GHCUP_INSTALL_BASE_PREFIX/.ghcup/env in your ~/.bashrc or similar."
printf "\\033[0;35m%s\\033[0m\\n" ""


)
