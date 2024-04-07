


Upload all configuration to a config map

### Synopsis


Upload all configuration to a config map

```
kubeadm init phase upload-config all [flags]
```

### Options

   







--config string


Path to a kubeadm configuration file.



--cri-socket string


Path to the CRI socket to connect. If empty kubeadm will try to auto-detect this value; use this option only if you have more than one CRI installed or if you have non-standard CRI socket.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for all



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







