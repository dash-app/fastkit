#!/bin/bash
set -e
cd "$(dirname "$0")" && _base="$PWD"

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

# Create base directory
mkdir -p /opt/dash-app

# Install Pigent
bash $_base/../apps/pigent/install.sh

# Install Dash-Home
bash $_base/../apps/dash-home/install.sh
