


Pull images used by kubeadm

### Synopsis


Pull images used by kubeadm

```
kubeadm config images pull [flags]
```

### Options

   







--config string


Path to a kubeadm configuration file.



--cri-socket string


Path to the CRI socket to connect. If empty kubeadm will try to auto-detect this value; use this option only if you have more than one CRI installed or if you have non-standard CRI socket.



--feature-gates string


A set of key=value pairs that describe feature gates for various features. Options are:EtcdLearnerMode=true|false (BETA - default=true)PublicKeysECDSA=true|false (DEPRECATED - default=false)RootlessControlPlane=true|false (ALPHA - default=false)UpgradeAddonsBeforeControlPlane=true|false (DEPRECATED - default=false)



-h, --help


help for pull



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.







### Options inherited from parent commands

   







--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







