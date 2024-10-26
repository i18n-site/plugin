#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

if [ -z "$1" ]; then
  echo "USAGE : $0 pkg"
  exit 1
fi

cd $1

exec direnv exec . dist.coffee $(pwd)
