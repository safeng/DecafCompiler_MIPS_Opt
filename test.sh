#!/bin/bash

##** test.sh - A simple test framework ********************************

cd $(git rev-parse --show-toplevel)
make clean
if make
then
    for SRC in samples/*.decaf
    do
        BASE=${SRC%.decaf}
        ./dcc < ${SRC} > ${BASE}.s 2> /dev/null
        if ./dcc < ${SRC} &> ${BASE}.test.s;
        then
            if [ -e ${BASE}.in ];
            then
                spim -file ${BASE}.test.s < ${BASE}.in > ${BASE}.test
                spim -file ${BASE}.s < ${BASE}.in > ${BASE}.out
            else
                spim -file ${BASE}.test.s > ${BASE}.test
                spim -file ${BASE}.s > ${BASE}.out
            fi
        else
            touch ${BASE}.test
        fi
        if diff -urw ${BASE}.test ${BASE}.out &> /dev/null
        then
            SIZE_SOL=$(wc -c ${BASE}.s | cut -d' ' -f1)
            SIZE_TEST=$(wc -c ${BASE}.test.s | cut -d' ' -f1)
            if [ $SIZE_TEST -gt $SIZE_SOL ]
            then
                echo -e "\e[33m${BASE}.decaf\e[0m"
            else
                echo -e "\e[32m${BASE}.decaf\e[0m"
            fi
        else
            echo -e "\e[31m${BASE}.decaf\e[0m"
            diff -urw ${BASE}.test ${BASE}.out
        fi
    done
    rm samples/*.test.s samples/*.test
else
    echo -e "\e[31mBuild failed\e[0m"
fi
