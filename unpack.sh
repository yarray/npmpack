#!/bin/bash

cache=npmcache
mod=${1%.tar.gz}

mkdir -p $mod
cd $mod
tar -xvf ../$1
npm install --cache $cache --cache-min 999999 --optional --no-registr --fetch-retries 0 --fetch-retry-factor 0 --fetch-retry-mintimeout 1 --fetch-retry-maxtimeout 2 ${@:2} $mod
cd -
