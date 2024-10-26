#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

find . -type f -name "*.json" | grep -v /tests/ | xargs -I {} sed -i '/is_prefi/d' {}
