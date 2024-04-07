


Run cleanup node.

### Synopsis


Run cleanup node.

```
kubeadm reset phase cleanup-node [flags]
```

### Options

   







--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path to the directory where the certificates are stored. If specified, clean this directory.



--cleanup-tmp-dir


Cleanup the &quot;/etc/kubernetes/tmp&quot; directory



--cri-socket string


Path to the CRI socket to connect. If empty kubeadm will try to auto-detect this value; use this option only if you have more than one CRI installed or if you have non-standard CRI socket.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for cleanup-node







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







