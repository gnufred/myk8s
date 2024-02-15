#!/bin/bash
export KUBECONFIG=/etc/kubernetes/admin.conf
USER=$(cat /etc/cluster/certs/uname)
PROF=kubernetes
CONF=/etc/cluster/certs/$USER.json
CACRT=/etc/kubernetes/pki/apiserver-kubelet-client.crt
CAKEY=/etc/kubernetes/pki/apiserver-kubelet-client.key
USCRT=/etc/kubernetes/pki/user/$USER.crt
USCSR=/etc/kubernetes/pki/user/$USER.csr
USKEY=/etc/kubernetes/pki/user/$USER.key

openssl genrsa -out $USKEY 2048
openssl req -new -key $USKEY -out $USCSR -subj "/CN=$USER/O=$USER"

REQUEST="$USER-$(date +%s)"
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: $REQUEST
spec:
  groups:
  - system:authenticated
  request: $(cat $USCSR | base64 | tr -d "\n")
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF
kubectl certificate approve $REQUEST
kubectl get csr $REQUEST -o jsonpath='{.status.certificate}' | base64 -d > $USCRT

chmod 444 $USCRT $USKEY $USCSR
