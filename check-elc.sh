#!/bin/bash
set -eu
for el in $(find . -name "*.el");
do
    elc=${el%el}elc
    if test -f ${elc};
    then
        if test ${el} -nt ${elc};
        then
            echo ${el} is newer than ${elc}
        fi
    else
        : #echo No elc for: ${el}
    fi
done

for elc in $(find . -name "*.elc");
do
    el=${elc%elc}el
    if ! test -f ${el};
    then
        echo No el for: ${elc}
    fi
done
