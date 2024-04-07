


Print a list of images kubeadm will use. The configuration file is used in case any images or image repositories are customized

### Synopsis


Print a list of images kubeadm will use. The configuration file is used in case any images or image repositories are customized

```
kubeadm config images list [flags]
```

### Options

   







--allow-missing-template-keys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, ignore any errors in templates when a field or map key is missing in the template. Only applies to golang and jsonpath output formats.



--config string


Path to a kubeadm configuration file.



-o, --experimental-output string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "text"


Output format. One of: text|json|yaml|go-template|go-template-file|template|templatefile|jsonpath|jsonpath-as-json|jsonpath-file.



--feature-gates string


A set of key=value pairs that describe feature gates for various features. Options are:EtcdLearnerMode=true|false (BETA - default=true)PublicKeysECDSA=true|false (DEPRECATED - default=false)RootlessControlPlane=true|false (ALPHA - default=false)UpgradeAddonsBeforeControlPlane=true|false (DEPRECATED - default=false)



-h, --help


help for list



--image-repository string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "registry.k8s.io"


Choose a container registry to pull control plane images from



--kubernetes-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stable-1"


Choose a specific Kubernetes version for the control plane.



--show-managed-fields


If true, keep the managedFields when printing objects in JSON or YAML format.







### Options inherited from parent commands

   







--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







