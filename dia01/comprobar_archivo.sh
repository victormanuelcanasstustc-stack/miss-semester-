#!/bin/bash

if [ -f "$1" ]; then
    echo "El archivo existe: $1"
else
    echo "El archivo no existe: $1"
fi
