#!/bin/bash

cd "$(dirname "$0")" && _base="$PWD"

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

# Download
_target="/opt/dash-app/pigent"
mkdir -p $_target/src

echo ":: Extract base files..."
cp -Rpfv ${_base}/template/opt/* ${_target}/

echo ":: Download pigent..."
rm -rfv $_target/src/pigent
cd $_target/src

# Clone
git clone https://github.com/dash-app/pigent.git
cd ./pigent

echo ":: Install dependencies..."
pip3 install -v -r ./requirements.txt

echo ":: Activating systemd..."
cp -Rpfv ${_base}/template/systemd/pigent.service /etc/systemd/system/

echo ":: Enable auto-start"
systemctl enable pigent
