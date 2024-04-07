


Generate the certificate for serving etcd

### Synopsis


Generate the certificate for serving etcd, and save them into etcd/server.crt and etcd/server.key files.

Default SANs are localhost, 127.0.0.1, 127.0.0.1, ::1

If both files already exist, kubeadm skips the generation step and existing files will be used.

```
kubeadm init phase certs etcd-server [flags]
```

### Options

   







--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for etcd-server



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







