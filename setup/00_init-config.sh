#!/bin/bash
set -e

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

_serial=$(printf "%04x" 0x$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2))
if [ "$_serial" == "" ]; then
    echo "E: Couldn't get serial. Please see serial section in /proc/cpuinfo."
    exit 1
fi

raspi-config nonint do_i2c 0
raspi-config nonint do_hostname dash-$_serial
hostnamectl set-hostname dash-$_serial
raspi-config nonint do_change_timezone UTC
raspi-config nonint do_change_locale en_US.UTF-8
raspi-config nonint do_expand_rootfs
