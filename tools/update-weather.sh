#!/bin/sh

cd `dirname $0`/../weather
rm *

echo "getting weather data"

#-------------------------------------------------------------------------------
# 84767: {name: "Zion National Park", lat:  0, lon: 0 },
#-------------------------------------------------------------------------------
echo "   for Zion National Park"

curl -o 84767-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.20857&lon=-112.98213&wfo=SLC&zcode=UTZ019&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=0&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 84767-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.20857&lon=-112.98213&wfo=SLC&zcode=UTZ019&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=48&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://forecast.weather.gov/MapClick.php?lat=37.2085734&lon=-112.9821253&site=all&smap=1&searchresult=Zion%20National%20Park%2C%20Hurricane%2C%20UT%2084737%2C%20USA&TextType=1" \
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
    
#-------------------------------------------------------------------------------
# 84764: {name: "Bryce Canyon",       lat:  0, lon: 0 },
#-------------------------------------------------------------------------------
echo "   for Bryce Canyon"

curl -o 84764-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.62153&lon=-112.15494&wfo=SLC&zcode=UTZ518&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=00&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 84764-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=37.62153&lon=-112.15494&wfo=SLC&zcode=UTZ518&gset=30&gdiff=10&unit=0&tinfo=MY7&ahour=48&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://forecast.weather.gov/MapClick.php?CityName=Bryce+Canyon&state=UT&site=SLC&textField1=37.6283&textField2=-112.167&e=0&TextType=1" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 84764-forecast.html
    
curl -s "http://mobile.weather.gov/pil.php?pil=SLCAFDSLC" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 84764-discussion.html 

#-------------------------------------------------------------------------------
# 86040: {name: "Page",               lat:  0, lon: 0 },
#-------------------------------------------------------------------------------
echo "   for Page"

curl -o 86040-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.75980&lon=-111.37989&wfo=FGZ&zcode=AZZ009&gset=18&gdiff=3&unit=0&tinfo=MN7&ahour=00&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 86040-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.75980&lon=-111.37989&wfo=FGZ&zcode=AZZ009&gset=18&gdiff=3&unit=0&tinfo=MN7&ahour=48&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://forecast.weather.gov/MapClick.php?CityName=Page&state=AZ&site=FGZ&textField1=36.9086&textField2=-111.473&e=1&TextType=1" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 86040-forecast.html
    
curl -s "http://mobile.weather.gov/pil.php?pil=FGZAFDFGZ" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 86040-discussion.html 

#-------------------------------------------------------------------------------
# 86023: {name: "Grand Canyon",       lat:  0, lon: 0 },
#-------------------------------------------------------------------------------
echo "   for Grand Canyon"

curl -o 86023-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.00432&lon=-112.09533&wfo=FGZ&zcode=AZZ006&gset=18&gdiff=3&unit=0&tinfo=MN7&ahour=00&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 86023-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.00432&lon=-112.09533&wfo=FGZ&zcode=AZZ006&gset=18&gdiff=3&unit=0&tinfo=MN7&ahour=48&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://forecast.weather.gov/MapClick.php?CityName=Grand+Canyon+Village&state=AZ&site=FGZ&textField1=36.0464&textField2=-112.153&TextType=1" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 86023-forecast.html
    
curl -s "http://mobile.weather.gov/pil.php?pil=FGZAFDFGZ" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 86023-discussion.html 

#-------------------------------------------------------------------------------
# 89109: {name: "Las Vegas",          lat:  0, lon: 0 }
#-------------------------------------------------------------------------------
echo "   for Las Vegas"

curl -o 89109-00.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.12856&lon=-115.17113&wfo=VEF&zcode=NVZ020&gset=18&gdiff=5&unit=0&tinfo=PY8&ahour=00&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6" 
curl -o 89109-48.png -s "http://forecast.weather.gov/wtf/meteograms/Plotter.php?lat=36.12856&lon=-115.17113&wfo=VEF&zcode=NVZ020&gset=18&gdiff=5&unit=0&tinfo=PY8&ahour=48&pcmd=110111111111100000000000000000000000000000000000000000000&lg=en&indu=1!1!1&dd=0&bw=0&hrspan=48&pqpfhr=6&psnwhr=6"

curl -s "http://forecast.weather.gov/MapClick.php?CityName=Las+Vegas&state=NV&site=VEF&textField1=36.175&textField2=-115.136&e=0&TextType=1" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 89109-forecast.html
    
curl -s "http://mobile.weather.gov/pil.php?pil=VEFAFDVEF" \
    | sed 's_<html>__' \
    | sed 's_<body>__' \
    | sed 's_</html>__' \
    | sed 's_</body>__' \
    > 89109-discussion.html 
