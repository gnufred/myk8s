


Install all the addons

### Synopsis


Install all the addons

```
kubeadm init phase addon all [flags]
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



--feature-gates string


A set of key=value pairs that describe feature gates for various features. Options are:EtcdLearnerMode=true|false (BETA - default=true)PublicKeysECDSA=true|false (DEPRECATED - default=false)RootlessControlPlane=true|false (ALPHA - default=false)UpgradeAddonsBeforeControlPlane=true|false (DEPRECATED - default=false)



-h, --help


help for all



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.



--pod-network-cidr string


Specify range of IP addresses for the pod network. If set, the control plane will automatically allocate CIDRs for every node.



--service-cidr string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "10.96.0.0/12"


Use alternative range of IP address for service VIPs.



--service-dns-domain string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "cluster.local"


Use alternative domain for services, e.g. &quot;myorg.internal&quot;.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







