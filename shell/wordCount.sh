#!/bin/sh
function wordCount()
{
    # Require bash version >= 4.0
    declare -A words

    for i in "$@"
    do
        let words[$i]++
    done

    echo $@
    for w in ${!words[@]}
    do
        echo $w: ${words[$w]}
    done
}

wordCount $@
