#!/bin/bash

PLACA=$(ip -o -4 route show to default | awk '{print $5; exit}')


ip -6 monitor address dev "$PLACA" | while read -r line; do
    if echo "$line" | grep -q "inet6" && echo "$line" | grep -q "scope global"; then
       /home/ed/pasamelaip/averiguate-la-ip.sh 
    fi
done
