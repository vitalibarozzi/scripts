#!/usr/bin/env bash
# Hold aliases for common used commands

# Quick Ones 
alias      c="clear";
alias      e="exit \$?";
alias      s="sudo";
alias      m="make";

# General 
alias     ls='ls --group-directories-first --almost-all --human-readable --sort=extension -l';
alias umount='sudo umount';
alias   grep='grep --color';

# Git 
alias   diff='git difftool';
alias  clone='git clone';
alias branch='git branch';
alias    add='git add';
alias status='git status';
alias commit='git commit -m';
alias    log='git log';
alias   push='git push';

alias konsole="konsole --fullscreen --notransparency"
alias vifm="vifm ${HOME}/Documents"

# Haskell 
alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo -dsuppress-coercions -dsuppress-type-applications -dsuppress-uniques -dsuppress-module-prefixes"

