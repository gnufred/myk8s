#!/bin/bash
USER=$(cat /etc/cluster/certs/uname)
USCRT=/etc/kubernetes/pki/user/$USER.crt
USKEY=/etc/kubernetes/pki/user/$USER.key

kubectl config set-credentials $USER \
	--client-certificate=$USCRT \
	--client-key=$USKEY
