#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

exec direnv exec . dist.coffee $DIR
