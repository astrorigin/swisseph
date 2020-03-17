#!/bin/sh
# mirrors the main swisseph ephemeris files from the source

cd /usr/share/swisseph && \
wget --no-directories --no-host-directories \
    --timestamping --no-remove-listing \
    --wait=3 --random-wait \
    ftp://ftp.astro.com/pub/swisseph/ephe/*.se1 \
    ftp://ftp.astro.com/pub/swisseph/ephe/*.TXT \
    ftp://ftp.astro.com/pub/swisseph/ephe/*.txt


# vi: sw=4 ts=4 sts=4 et ai
