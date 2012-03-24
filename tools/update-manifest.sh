#!/bin/sh

echo "updating index.manifest"

cd `dirname $0`/..

chmod +w index.manifest
rm       index.manifest

echo "CACHE MANIFEST"    >> index.manifest
echo ""                  >> index.manifest

echo "index.html"        >> index.manifest
echo ""                  >> index.manifest

find css       -type f   >> index.manifest
echo ""                  >> index.manifest

find scripts   -type f   >> index.manifest
echo ""                  >> index.manifest

find images    -type f   >> index.manifest
echo ""                  >> index.manifest

find weather   -type f  | grep png >> index.manifest
echo ""                  >> index.manifest

find vendor    -type f   >> index.manifest
echo ""                  >> index.manifest

find maps      -type f   >> index.manifest
echo ""                  >> index.manifest

echo "# updated: `date`" >> index.manifest

chmod -w index.manifest