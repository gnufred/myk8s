


Generate the self-signed Kubernetes CA to provision identities for other Kubernetes components

### Synopsis


Generate the self-signed Kubernetes CA to provision identities for other Kubernetes components, and save them into ca.crt and ca.key files.

If both files already exist, kubeadm skips the generation step and existing files will be used.

```
kubeadm init phase certs ca [flags]
```

### Options

   







--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for ca



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







