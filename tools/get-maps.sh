#!/bin/sh

cd `dirname $0`/../maps


# https://developers.google.com/maps/documentation/staticmaps/

# maptype  roadmap, terrain

#    84767: {name: "Zion National Park", geo: "37.2100,-112.9853" },
#    84764: {name: "Bryce Canyon",       geo: "37.6751,-112.1490" },
#    86040: {name: "Page",               geo: "36.9028,-111.4839" },
#    86023: {name: "Grand Canyon",       geo: "36.0544,-112.1459" },
#    89109: {name: "Las Vegas",          geo: "36.1212,-115.1754" },



# http://maps.googleapis.com/maps/api/staticmap?size=600x600&maptype=roadmap\&markers=size:tiny%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false

curl -o all-r.png   -s "http://maps.googleapis.com/maps/api/staticmap?size=1000x1000&maptype=roadmap&markers=size:small%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false"
curl -o all-t.png   -s "http://maps.googleapis.com/maps/api/staticmap?size=1000x1000&maptype=terrain&markers=size:small%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false"
curl -o zion-r.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=37.2100,-112.9853&size=600x600&maptype=road&sensor=false"
curl -o zion-t.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=37.2100,-112.9853&size=600x600&maptype=terrain&sensor=false"
curl -o bryce-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=37.6751,-112.1490&size=600x600&maptype=road&sensor=false"
curl -o bryce-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=37.6751,-112.1490&size=600x600&maptype=terrain&sensor=false"
curl -o page-r.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.9028,-111.4839&size=600x600&maptype=road&sensor=false"
curl -o page-t.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.9028,-111.4839&size=600x600&maptype=terrain&sensor=false"
curl -o grand-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.0544,-112.1459&size=600x600&maptype=road&sensor=false"
curl -o grand-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.0544,-112.1459&size=600x600&maptype=terrain&sensor=false"
curl -o vegas-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.1212,-115.1754&size=600x600&maptype=road&sensor=false"
curl -o vegas-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=10&center=36.1212,-115.1754&size=600x600&maptype=terrain&sensor=false"
