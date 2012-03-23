#!/bin/sh

cd `dirname $0`

PATH=$PATH:/usr/local/bin ./update-weather.sh

./build-weather-json.js

rm ../weather/*.html

./update-manifest.sh