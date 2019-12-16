#!/bin/bash

for i in hadoop namenode datanode; do
    echo "========================="
    echo Building $i
    echo "========================="
    ( cd $i && ./build.sh)
done
