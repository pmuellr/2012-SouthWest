#!/bin/sh

cd `dirname $0`

./update-weather.sh
./build-weather-json.js
./update-manifest.sh