#!/bin/bash

ip -6 monitor address dev enp0s3 | while read -r line; do
    if echo "$line" | grep -q "inet6" && echo "$line" | grep -q "scope global"; then
       /home/ed/pasamelaip/averiguate-la-ip.sh 
    fi
done
