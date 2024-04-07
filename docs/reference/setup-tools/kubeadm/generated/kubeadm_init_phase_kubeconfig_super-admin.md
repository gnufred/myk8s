


Generate a kubeconfig file for the super-admin

### Synopsis


Generate a kubeconfig file for the super-admin, and save it to super-admin.conf file.

```
kubeadm init phase kubeconfig super-admin [flags]
```

### Options

   







--apiserver-advertise-address string


The IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--apiserver-bind-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 6443


Port for the API Server to bind to.



--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--control-plane-endpoint string


Specify a stable IP address or DNS name for the control plane.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for super-admin



--kubeconfig-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes"


The path where to save the kubeconfig file.



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







