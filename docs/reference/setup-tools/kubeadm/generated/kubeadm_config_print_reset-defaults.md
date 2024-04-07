


Print default reset configuration, that can be used for 'kubeadm reset'

### Synopsis



This command prints objects such as the default reset configuration that is used for 'kubeadm reset'.

Note that sensitive values like the Bootstrap Token fields are replaced with placeholder values like "abcdef.0123456789abcdef" in order to pass validation but
not perform the real computation for creating a token.


```
kubeadm config print reset-defaults [flags]
```

### Options

   







-h, --help


help for reset-defaults







### Options inherited from parent commands

   







--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







