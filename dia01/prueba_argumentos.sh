#!/bin/bash

echo "Primer argumento: $1"
echo "Todos los argumentos: $@"

echo "Ejecutando el comando recibido:"
"$@"
