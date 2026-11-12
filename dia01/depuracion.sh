#!/bin/bash

set -x

nombre="Victor"
echo "Hola, $nombre"

numero=10
resultado=$((numero * 2))
echo "El resultado es $resultado"

set +x

echo "La depuracion ha terminado"
