#!/usr/bin/env bash

. "./bash_conf.sh"   || exit 1;
. "./bash_func.sh"   || exit 2;
. "./bash_path.sh"   || exit 3;
. "./bash_alias.sh"  || exit 4;
. "./bash_export.sh" || exit 5;

. "./rsync_backup.sh" || exit 6;
. "./rsync_kindle.sh" || exit 7;
