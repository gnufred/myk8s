


Show what differences would be applied to existing static pod manifests. See also: kubeadm upgrade apply --dry-run

### Synopsis


Show what differences would be applied to existing static pod manifests. See also: kubeadm upgrade apply --dry-run

```
kubeadm upgrade diff [version] [flags]
```

### Options

   







--api-server-manifest string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/manifests/kube-apiserver.yaml"


path to API server manifest



--config string


Path to a kubeadm configuration file.



-c, --context-lines int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 3


How many lines of context in the diff



--controller-manager-manifest string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/manifests/kube-controller-manager.yaml"


path to controller manifest



-h, --help


help for diff



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--scheduler-manifest string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/manifests/kube-scheduler.yaml"


path to scheduler manifest







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







