


Upload certificates to kubeadm-certs

### Synopsis


Upload control plane certificates to the kubeadm-certs Secret

```
kubeadm init phase upload-certs [flags]
```

### Options

   







--certificate-key string


Key used to encrypt the control-plane certificates in the kubeadm-certs Secret. The certificate key is a hex encoded string that is an AES key of size 32 bytes.



--config string


Path to a kubeadm configuration file.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for upload-certs



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--skip-certificate-key-print


Don't print the key used to encrypt the control-plane certificates.



--upload-certs


Upload control-plane certificates to the kubeadm-certs Secret.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







