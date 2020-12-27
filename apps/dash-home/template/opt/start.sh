#!/bin/bash
set -e
cd "$(dirname "$0")"

cp $PWD/pack/dash-home $PWD
./dash-home
