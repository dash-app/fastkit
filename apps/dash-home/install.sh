#!/bin/bash

cd "$(dirname "$0")" && _base="$PWD"

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

# Download
_target="/opt/dash-app/dash-home"
mkdir -p $_target/pack

echo ":: Extract base files..."
cp -Rpfv ${_base}/template/opt/* ${_target}/

echo ":: Download archives..."
cd $_target/pack
wget https://github.com/dash-app/dash-home/releases/latest/download/dash-home_linux_armv6.tar.gz
tar -xvzf ./dash-home_linux_armv6.tar.gz
rm -rfv dash-home_linux_armv6.tar.gz

echo ":: Activating systemd..."
cp -Rpfv ${_base}/template/systemd/dash-home.service /etc/systemd/system/

echo ":: Enable auto-start"
systemctl enable dash-home
