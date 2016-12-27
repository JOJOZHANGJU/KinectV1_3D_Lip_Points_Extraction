#!/bin/bash
for file in `find ./deepFileprocess/ -name '*.txt'`
do
    rm $file
done
