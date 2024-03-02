#!/bin/bash
echo "Install Python to run Ansible"
apk add python3 py3-pip &&
pip install kubernetes 2> /dev/null &&
pip cache purge 2> /dev/null
