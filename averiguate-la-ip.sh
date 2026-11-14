#!/bin/bash

ARCHIVO="mi_ipv6.txt"
IPV6=$(ip -6 addr show scope global -deprecated | awk '/inet6/ {print $2}' | cut -d'/' -f1 | head -n 1)

if [[ -n "$IPV6" ]]; then
    echo "IPv6 pública local: $IPV6"
    echo "$IPV6" > "$ARCHIVO"
    echo "IP guardada correctamente en $ARCHIVO"
    bash enviar_datos.sh
else
    echo "No se encontró ninguna IPv6 pública." >&2
    rm -f "$ARCHIVO"
    exit 1
fi

