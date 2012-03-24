#!/bin/sh

cd `dirname $0`/../maps


# https://developers.google.com/maps/documentation/staticmaps/

# maptype  roadmap, terrain

#    84767: {name: "Zion National Park", geo: "37.2100,-112.9853" },
#    84764: {name: "Bryce Canyon",       geo: "37.6751,-112.1490" },
#    86040: {name: "Page",               geo: "36.9028,-111.4839" },
#    86023: {name: "Grand Canyon",       geo: "36.0544,-112.1459" },
#    89109: {name: "Las Vegas",          geo: "36.1212,-115.1754" },

# Driftwood Lodge:    37.17992,-113.00617
# Bryce Canyon Grand: 37.67497,-112.15052
# Days Inn:           36.90260,-111.48364
# Yavapai Lodge:      36.05408,-112.11952
# Mirage:             36.12112,-115.17432

# &markers=size:small%7Ccolor:red%7C37.17992,-113.00617
# &markers=size:small%7Ccolor:red%7C37.67497,-112.15052
# &markers=size:small%7Ccolor:red%7C36.90260,-111.48364
# &markers=size:small%7Ccolor:red%7C36.05408,-112.11952
# &markers=size:small%7Ccolor:red%7C36.12112,-115.17432

# http://maps.googleapis.com/maps/api/staticmap?size=600x600&maptype=roadmap\&markers=size:tiny%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false

curl -o all-r.png   -s "http://maps.googleapis.com/maps/api/staticmap?size=1000x1000&maptype=roadmap&markers=size:small%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false"
curl -o all-t.png   -s "http://maps.googleapis.com/maps/api/staticmap?size=1000x1000&maptype=terrain&markers=size:small%7Ccolor:red%7C37.2100,-112.9853%7C37.6751,-112.1490%7C36.9028,-111.4839%7C36.0544,-112.1459%7C36.1212,-115.1754%7C&sensor=false"

curl -o zion-r.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=37.2100,-112.9853&markers=size:small%7Ccolor:red%7C37.17992,-113.00617&size=600x600&maptype=road&sensor=false"
curl -o zion-t.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=37.2100,-112.9853&markers=size:small%7Ccolor:red%7C37.17992,-113.00617&size=600x600&maptype=terrain&sensor=false"

curl -o bryce-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=37.6751,-112.1490&markers=size:small%7Ccolor:red%7C37.67497,-112.15052&size=600x600&maptype=road&sensor=false"
curl -o bryce-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=37.6751,-112.1490&markers=size:small%7Ccolor:red%7C37.67497,-112.15052&size=600x600&maptype=terrain&sensor=false"

curl -o page-r.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.9028,-111.4839&markers=size:small%7Ccolor:red%7C36.90260,-111.48364&size=600x600&maptype=road&sensor=false"
curl -o page-t.png  -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.9028,-111.4839&markers=size:small%7Ccolor:red%7C36.90260,-111.48364&size=600x600&maptype=terrain&sensor=false"

curl -o grand-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.0544,-112.1459&markers=size:small%7Ccolor:red%7C36.05408,-112.11952&size=600x600&maptype=road&sensor=false"
curl -o grand-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.0544,-112.1459&markers=size:small%7Ccolor:red%7C36.05408,-112.11952&size=600x600&maptype=terrain&sensor=false"

curl -o vegas-r.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.1212,-115.1754&markers=size:small%7Ccolor:red%7C36.12112,-115.17432&size=600x600&maptype=road&sensor=false"
curl -o vegas-t.png -s "http://maps.googleapis.com/maps/api/staticmap?zoom=09&center=36.1212,-115.1754&markers=size:small%7Ccolor:red%7C36.12112,-115.17432&size=600x600&maptype=terrain&sensor=false"
