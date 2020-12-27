#!/bin/bash
set -e
cd "$(dirname "$0")" && _base="$PWD"

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

# Start services....
systemctl start pigent
systemctl start dash-home
