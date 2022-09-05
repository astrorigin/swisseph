#!/bin/sh

VERSION=2.10.03
NAME=master.tar.gz
URL=https://github.com/aloistr/swisseph/archive/refs/heads/$NAME
DEBNAME=libswe-$VERSION

if [ ! -f $NAME ]; then
	wget $URL
fi
tar zxvf $NAME
mv swisseph-master $DEBNAME
cd $DEBNAME
rm -f *.o *.a *.so swetests swetest swemini swevents
cp ../Makefile.debian .
cp ../swe.pc .
cp -rf ../debian .
cd ..
tar -c -f $DEBNAME.tar.gz -z $DEBNAME
cd $DEBNAME

dh_make -l -f ../$DEBNAME.tar.gz --docs -y
dpkg-buildpackage -us -uc

# vi: sw=4 ts=4 sts=4 noet ai ft=sh
