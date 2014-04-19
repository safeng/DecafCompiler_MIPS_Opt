#!/bin/bash

##** test.sh - A simple test framework ********************************

cd $(git rev-parse --show-toplevel)
rm samples/*.s samples/*.test samples/*.out
make clean
if make
then
    echo -e "\e[32mBuild succeed\e[0m"
    for SRC in samples/*.decaf
    do
        BASE=${SRC%.decaf}
        solution/dcc < ${SRC} > ${BASE}.s 2> /dev/null
        if ./dcc < ${SRC} &> ${BASE}.test.s;
        then
            if [ -e ${BASE}.in ];
            then
                timeout 0.5 spim -file ${BASE}.test.s < ${BASE}.in > ${BASE}.test 2> /dev/null
                spim -file ${BASE}.s < ${BASE}.in > ${BASE}.out
            else
                timeout 0.5 spim -file ${BASE}.test.s > ${BASE}.test 2> /dev/null
                spim -file ${BASE}.s > ${BASE}.out
            fi
        else
            touch ${BASE}.test
        fi
        if diff -urw ${BASE}.test ${BASE}.out &> /dev/null
        then
            SIZE_TEST=$(wc -c ${BASE}.test.s | cut -d' ' -f1)
            SIZE_SOL=$(wc -c ${BASE}.s | cut -d' ' -f1)
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
else
    echo -e "\e[31mBuild failed\e[0m"
fi
