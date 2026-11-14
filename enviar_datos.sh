#!/bin/bash

ARCHIVO_CONFIG="./config.env"

if [ -f "$ARCHIVO_CONFIG" ]; then
    source "$ARCHIVO_CONFIG"
    echo "Variables cargadas. Bienvenido, $USUARIO."
else
    echo "Error: No se encontró el archivo '$ARCHIVO_CONFIG'." >&2
    exit 1
fi
