#!/bin/bash
truncate -s0 /etc/apk/repositories
apk add --allow-untrusted /.lfs/apk/python3/*
find /var/cache/apk/ -name '*.apk' -delete
