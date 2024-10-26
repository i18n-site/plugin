#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

fd i18n -t d --no-ignore | grep "/lib/i18n" | xargs rm -rf

i18
