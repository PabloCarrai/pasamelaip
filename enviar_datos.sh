#!/bin/bash

ARCHIVO_CONFIG="./config.env"

enviar_mensaje(){
CONTENIDO=$(cat "$ARCHIVO")
MENSAJE="🌐 IPv6 actual de $(hostname): $CONTENIDO"
curl -s -X POST "https://telegram.org{TOKEN}/sendMessage" \
        -d chat_id="${CHAT_ID}" \
        --data-urlencode "text=${MENSAJE}" > /dev/null
}

if [ -f "$ARCHIVO_CONFIG" ]; then
    source "$ARCHIVO_CONFIG"
    enviar_mensaje

else
    echo "Error: No se encontró el archivo '$ARCHIVO_CONFIG'." >&2
    exit 1
fi
