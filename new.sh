#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

cp -R _tmpl $1

cd $1

rpl _tmpl $1

git add .
