#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

./build.sh

# SITE=../../site
# rsync -av lib/ $SITE/node_modules/@\~3/pay/

# touch $SITE/src/index.js
