#!/bin/bash

for i in hadoop namenode datanode resourcemanager nodemanager historyserver; do
    echo "========================="
    echo Building $i
    echo "========================="
    ( cd $i && ./build.sh)
done
