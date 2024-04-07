


Generate the certificate for the API server to connect to kubelet

### Synopsis


Generate the certificate for the API server to connect to kubelet, and save them into apiserver-kubelet-client.crt and apiserver-kubelet-client.key files.

If both files already exist, kubeadm skips the generation step and existing files will be used.

```
kubeadm init phase certs apiserver-kubelet-client [flags]
```

### Options

   







--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for apiserver-kubelet-client



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







