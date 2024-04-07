


Run pre-flight checks

### Synopsis


Run pre-flight checks for kubeadm init.

```
kubeadm init phase preflight [flags]
```

### Examples

```
  # Run pre-flight checks for kubeadm init using a config file.
  kubeadm init phase preflight --config kubeadm-config.yaml
```

### Options

   







--config string


Path to a kubeadm configuration file.



--cri-socket string


Path to the CRI socket to connect. If empty kubeadm will try to auto-detect this value; use this option only if you have more than one CRI installed or if you have non-standard CRI socket.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for preflight



--ignore-preflight-errors strings


A list of checks whose errors will be shown as warnings. Example: 'IsPrivilegedUser,Swap'. Value 'all' ignores errors from all checks.



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







