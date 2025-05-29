#!/bin/sh

if ip link show tun0 > /dev/null 2>&1; then
    echo "%{F#5fff5f} VPN On%{F-}"
else
    echo "%{F#ff5f5f} VPN Off%{F-}"
fi
