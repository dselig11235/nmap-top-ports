#!/bin/bash

awk '$2~/tcp$/' /usr/share/nmap/nmap-services | \
    sort -r -k3 | \
    awk '{printf "%-10s %s\n", $2, $3}' > port-with-ratios.tcp
awk '$2~/udp$/' /usr/share/nmap/nmap-services | \
    sort -r -k3 | \
    awk '{printf "%-10s %s\n", $2, $3}' > port-with-ratios.udp

awk '$2~/tcp$/' /usr/share/nmap/nmap-services | sort -r -k3 | awk '{print $2}' > listed.sorted.tcp
awk '$2~/udp$/' /usr/share/nmap/nmap-services | sort -r -k3 | awk '{print $2}' > listed.sorted.udp

setop <(seq 65535) listed.sorted.tcp > unlisted.tcp
setop <(seq 65535) listed.sorted.udp > unlisted.udp

cat listed.sorted.tcp unlisted.tcp > all.sorted.tcp
cat listed.sorted.udp unlisted.udp > all.sorted.udp
