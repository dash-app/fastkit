#!/bin/bash
set -e

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

# Update
apt-get update

# Install apps
apt-get install -y busybox git python3-pip pigpio i2c-tools
busybox --install

# Enable pigpiod
systemctl enable --now pigpiod
