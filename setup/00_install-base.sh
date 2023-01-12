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

# pigpiod

# Disable sampling
sed -ie 's/pigpiod\ -l/pigpiod -m -l/g' /usr/lib/systemd/system/pigpiod.service

systemctl daemon-reload

# Start pigpiod (with autostart)
systemctl enable --now pigpiod
