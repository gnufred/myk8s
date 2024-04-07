


Generates the kube-apiserver static Pod manifest

### Synopsis


Generates the kube-apiserver static Pod manifest

```
kubeadm init phase control-plane apiserver [flags]
```

### Options

   







--apiserver-advertise-address string


The IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--apiserver-bind-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 6443


Port for the API Server to bind to.



--apiserver-extra-args &lt;comma-separated 'key=value' pairs&gt;


A set of extra flags to pass to the API Server or override default ones in form of &lt;flagname&gt;=&lt;value&gt;



--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/pki"


The path where to save and store the certificates.



--config string


Path to a kubeadm configuration file.



--control-plane-endpoint string


Specify a stable IP address or DNS name for the control plane.



--dry-run


Don't apply any changes; just output what would be done.



--feature-gates string


A set of key=value pairs that describe feature gates for various features. Options are:EtcdLearnerMode=true|false (BETA - default=true)PublicKeysECDSA=true|false (DEPRECATED - default=false)RootlessControlPlane=true|false (ALPHA - default=false)UpgradeAddonsBeforeControlPlane=true|false (DEPRECATED - default=false)



-h, --help


help for apiserver



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.



--patches string


Path to a directory that contains files named &quot;target[suffix][+patchtype].extension&quot;. For example, &quot;kube-apiserver0+merge.yaml&quot; or just &quot;etcd.json&quot;. &quot;target&quot; can be one of &quot;kube-apiserver&quot;, &quot;kube-controller-manager&quot;, &quot;kube-scheduler&quot;, &quot;etcd&quot;, &quot;kubeletconfiguration&quot;. &quot;patchtype&quot; can be one of &quot;strategic&quot;, &quot;merge&quot; or &quot;json&quot; and they match the patch formats supported by kubectl. The default &quot;patchtype&quot; is &quot;strategic&quot;. &quot;extension&quot; must be either &quot;json&quot; or &quot;yaml&quot;. &quot;suffix&quot; is an optional string that can be used to determine which patches are applied first alpha-numerically.



--service-cidr string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "10.96.0.0/12"


Use alternative range of IP address for service VIPs.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







