#!/bin/bash 

finished=0

while [ $finished == 0 ]
do
    rm schedule.txt
    lua scheduler.lua > schedule.txt
    if [ ${PIPESTATUS[0]} -eq 1 ]
    then finished=1
    else finished=0
    fi
done

echo "DONE - created schedule file."
