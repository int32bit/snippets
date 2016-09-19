function join_by { local IFS="$1"; shift; echo "$*"; }

join_by $@
