#!/bin/bash
set -e
cd "$(dirname "$0")"

if [ "$UID" != "0" ]; then
    echo "E: Must be root."
    exit 1
fi

echo ""
echo ""
echo "*** Dash-App - Fastkit ***"
echo "- Starting automatic Install after 3 seconds... -"
echo ""
echo ""
sleep 3

for f in $(find ./setup -type f -name '*.sh' | sort); do
    echo "==> Running Setup: $f"
    bash $f
done
