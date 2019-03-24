#!/usr/bin/env bash
# Hold aliases for common used commands

# Quick Ones 
alias      c="clear";
alias      e="exit \$?";
alias      s="sudo";
alias      m="make";
alias      l='ls --group-directories-first --almost-all --human-readable --sort=extension -l';

# General 
alias umount='sudo umount';
alias   grep='grep --color';

# Git 
alias  gdiff='git difftool';
alias  clone='git clone';
alias branch='git branch';
alias chekout='git checkout';
alias    add='git add';
alias status='git status';
alias commit='git commit -m';
alias    log='git log';
alias   push='git push';
alias  merge='git merge';
alias  fetch='git fetch'

alias konsole="konsole --fullscreen --notransparency"
alias vifm="vifm"

# Haskell 
alias ghci-core="ghci -ddump-simpl -dsuppress-idinfo -dsuppress-coercions -dsuppress-type-applications -dsuppress-uniques -dsuppress-module-prefixes"

