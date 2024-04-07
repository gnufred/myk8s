


Upgrade commands for a node in the cluster

### Synopsis


Upgrade commands for a node in the cluster

The "node" command executes the following phases:
```
preflight       Run upgrade node pre-flight checks
control-plane   Upgrade the control plane instance deployed on this node, if any
kubelet-config  Upgrade the kubelet configuration for this node
```


```
kubeadm upgrade node [flags]
```

### Options

   







--certificate-renewal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Perform the renewal of certificates used by component changed during upgrades.



--dry-run


Do not change any state, just output the actions that would be performed.



--etcd-upgrade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Perform the upgrade of etcd.



-h, --help


help for node



--ignore-preflight-errors strings


A list of checks whose errors will be shown as warnings. Example: 'IsPrivilegedUser,Swap'. Value 'all' ignores errors from all checks.



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--patches string


Path to a directory that contains files named &quot;target[suffix][+patchtype].extension&quot;. For example, &quot;kube-apiserver0+merge.yaml&quot; or just &quot;etcd.json&quot;. &quot;target&quot; can be one of &quot;kube-apiserver&quot;, &quot;kube-controller-manager&quot;, &quot;kube-scheduler&quot;, &quot;etcd&quot;, &quot;kubeletconfiguration&quot;. &quot;patchtype&quot; can be one of &quot;strategic&quot;, &quot;merge&quot; or &quot;json&quot; and they match the patch formats supported by kubectl. The default &quot;patchtype&quot; is &quot;strategic&quot;. &quot;extension&quot; must be either &quot;json&quot; or &quot;yaml&quot;. &quot;suffix&quot; is an optional string that can be used to determine which patches are applied first alpha-numerically.



--skip-phases strings


List of phases to be skipped







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







