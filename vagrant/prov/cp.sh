#!/bin/bash
set -eu

# This offline cache belongs to the Alpine 3.24 base box.
case "$(cat /etc/alpine-release)" in
  3.24.*) ;;
  *) echo 'The offline APK cache requires Alpine 3.24; recreate this VM with the current base box.' >&2; exit 1 ;;
esac

# Make sure no packages are downloaded.
truncate -s0 /etc/apk/repositories
apk add --no-network --allow-untrusted /.lfs/apk/python3/*
apk add --no-network --allow-untrusted /.lfs/apk/py3-kubernetes/*
find /var/cache/apk/ -name '*.apk' -delete
