


Read a file containing the kubeadm configuration API and report any validation problems

### Synopsis



This command lets you validate a kubeadm configuration API file and report any warnings and errors.
If there are no errors the exit status will be zero, otherwise it will be non-zero.
Any unmarshalling problems such as unknown API fields will trigger errors. Unknown API versions and
fields with invalid values will also trigger errors. Any other errors or warnings may be reported
depending on contents of the input file.

In this version of kubeadm, the following API versions are supported:
- kubeadm.k8s.io/v1beta3


```
kubeadm config validate [flags]
```

### Options

   







--allow-experimental-api


Allow validation of experimental, unreleased APIs.



--config string


Path to a kubeadm configuration file.



-h, --help


help for validate







### Options inherited from parent commands

   







--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







