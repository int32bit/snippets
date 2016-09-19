#!/bin/bash
function split_1()
{
    #FIXME The original string can not have any spaces.
    d=$1
    shift
    declare -a array
    raw_input=$@
    array=(${raw_input//$d/ })

    for i in "${!array[@]}";
    do
        echo "$i ${array[$i]}"
    done
}

function split_2()
{
    # The original string can include any spaces.
    #FIXME This will squeeze multiple occurrences of the spaces. For example, 'Hello    World' will be converted to 'Hello World'.
    #FIXME The quoted string can avoid above issue.
    local IFS=$1
    shift
    #read -r -a a <<< "$@"
    read -r -a a <<<"$@"
    for i in "${!a[@]}";
    do
        echo "$i ${a[$i]}"
    done
}

split_2 ':' Hello:Hello               World
# output:
# 0 Hello
# 1 Hello World

split_2 ':' Hello:"Hello               World"
# output
# 0 Hello
# 1 Hello               World
