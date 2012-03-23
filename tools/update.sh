#!/bin/sh

cd `dirname $0`

./update-weather.sh
./build-weather-json.js

rm ../weather/*.html

./update-manifest.sh