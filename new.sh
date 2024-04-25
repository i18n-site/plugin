#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

cp -R tmpl $1

cd $1

rpl tmpl $1

git add .
