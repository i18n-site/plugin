#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

build
cp -r $DIR/i18n lib/
cp -r $DIR/svg/* lib/
