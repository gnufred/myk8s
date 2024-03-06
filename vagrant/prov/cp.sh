#!/bin/bash

# Make sure no packages are downloaded
truncate -s0 /etc/apk/repositories

# Download packages manually from:
# https://pkgs.alpinelinux.org/contents
# https://pkgs.alpinelinux.org/packages
# https://wiki.alpinelinux.org/wiki/Repositories

apk add --allow-untrusted /.lfs/apk/python3/*
apk add --allow-untrusted /.lfs/apk/py3-kubernetes/*
find /var/cache/apk/ -name '*.apk' -delete
