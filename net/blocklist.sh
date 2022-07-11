#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Syntax: void.sh [file]"
        echo "Example: void.sh list.txt"
        exit 1
fi

sed -i -e "s/^/0.0.0.0 /" $1

echo "Results:"
echo ""
echo "....."
head $1
echo "....."
