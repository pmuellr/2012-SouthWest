#!/bin/sh

cd `dirname $0`/../weather

rm *

# Zion
curl -o 84767-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.25560&lon=-112.99100&wfo=SLC&zcode=UTZ019&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=00&pcmd=100011111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 84767-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.25560&lon=-112.99100&wfo=SLC&zcode=UTZ019&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=48&pcmd=100011111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://mobile.weather.gov/port_mp_ns.php?select=1&CityName=Springdale&site=SLC&State=UT&warnzone=UTZ019" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 84767-forecast.html
    
curl -s "http://mobile.weather.gov/pil.php?pil=SLCAFDSLC" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 84767-discussion.html 
    