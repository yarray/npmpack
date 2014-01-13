#!/bin/bash

cache=./npmcache
mod=$1
mkdir -p $mod
cd $mod
npm install --cache $cache --force --optional ${@:2} $mod
tar czf $mod.tar.gz $cache
mv $mod.tar.gz ../
cd -
