


Install the kube-proxy addon to a Kubernetes cluster

### Synopsis


Install the kube-proxy addon components via the API server.

```
kubeadm init phase addon kube-proxy [flags]
```

### Options

   







--apiserver-advertise-address string


The IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--apiserver-bind-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 6443


Port for the API Server to bind to.



--config string


Path to a kubeadm configuration file.



--control-plane-endpoint string


Specify a stable IP address or DNS name for the control plane.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for kube-proxy



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.



--pod-network-cidr string


Specify range of IP addresses for the pod network. If set, the control plane will automatically allocate CIDRs for every node.



--print-manifest


Print the addon manifests to STDOUT instead of installing them







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







