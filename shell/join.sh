#!/bin/sh
# http://stackoverflow.com/questions/1527049/bash-join-elements-of-an-array
function join_by { local IFS="$1"; shift; echo "$*"; }
