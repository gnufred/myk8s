


Run all kubelet-finalize phases

### Synopsis


Run all kubelet-finalize phases

```
kubeadm init phase kubelet-finalize all [flags]
```

### Examples

```
  # Updates settings relevant to the kubelet after TLS bootstrap"
  kubeadm init phase kubelet-finalize all --config
```

### Options

   







--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for all







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







