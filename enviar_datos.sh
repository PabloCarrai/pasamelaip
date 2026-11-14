#!/bin/bash

ARCHIVO_CONFIG="./config.env"
ARCHIVO="mi_ipv6.txt"

enviar_mensaje(){
CONTENIDO=$(cat "$ARCHIVO")


MENSAJE="<b>🌐 Actualización de Red</b>
- <b>Host:</b> <code>$(hostname)</code>
- <b>IPv6:</b> <code>$CONTENIDO</code>"

curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
        -d chat_id="${CHAT_ID}" \
        --data-urlencode "text=${MENSAJE}" \
        -d "parse_mode=HTML" > /dev/null
}

if [ -f "$ARCHIVO_CONFIG" ]; then
    source "$ARCHIVO_CONFIG"
    enviar_mensaje

else
    echo "Error: No se encontró el archivo '$ARCHIVO_CONFIG'." >&2
    exit 1
fi
