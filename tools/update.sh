#!/bin/sh

cd `dirname $0`

PATH=$PATH:/usr/local/bin ./update-weather.sh

PATH=$PATH:/usr/local/bin ./build-weather-json.js

./update-manifest.sh