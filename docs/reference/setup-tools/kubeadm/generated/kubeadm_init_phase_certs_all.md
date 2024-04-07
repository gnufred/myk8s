


Generate all certificates

### Synopsis


Generate all certificates

```
kubeadm init phase certs all [flags]
```

### Options

   







--apiserver-advertise-address string


The IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--apiserver-cert-extra-sans strings


Optional extra Subject Alternative Names (SANs) to use for the API Server serving certificate. Can be both IP addresses and DNS names.



--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--control-plane-endpoint string


Specify a stable IP address or DNS name for the control plane.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for all



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.



--service-cidr string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "10.96.0.0/12"


Use alternative range of IP address for service VIPs.



--service-dns-domain string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "cluster.local"


Use alternative domain for services, e.g. &quot;myorg.internal&quot;.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







