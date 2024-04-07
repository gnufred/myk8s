


Upgrade your Kubernetes cluster to the specified version

### Synopsis


Upgrade your Kubernetes cluster to the specified version

```
kubeadm upgrade apply [version]
```

### Options

   







--allow-experimental-upgrades


Show unstable versions of Kubernetes as an upgrade alternative and allow upgrading to an alpha/beta/release candidate versions of Kubernetes.



--allow-release-candidate-upgrades


Show release candidate versions of Kubernetes as an upgrade alternative and allow upgrading to a release candidate versions of Kubernetes.



--certificate-renewal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Perform the renewal of certificates used by component changed during upgrades.



--config string


Path to a kubeadm configuration file.



--dry-run


Do not change any state, just output what actions would be performed.



--etcd-upgrade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Perform the upgrade of etcd.



--feature-gates string


A set of key=value pairs that describe feature gates for various features. Options are:EtcdLearnerMode=true|false (BETA - default=true)PublicKeysECDSA=true|false (DEPRECATED - default=false)RootlessControlPlane=true|false (ALPHA - default=false)UpgradeAddonsBeforeControlPlane=true|false (DEPRECATED - default=false)



-f, --force


Force upgrading although some requirements might not be met. This also implies non-interactive mode.



-h, --help


help for apply



--ignore-preflight-errors strings


A list of checks whose errors will be shown as warnings. Example: 'IsPrivilegedUser,Swap'. Value 'all' ignores errors from all checks.



--kubeconfig string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/etc/kubernetes/admin.conf"


The kubeconfig file to use when talking to the cluster. If the flag is not set, a set of standard locations can be searched for an existing kubeconfig file.



--patches string


Path to a directory that contains files named &quot;target[suffix][+patchtype].extension&quot;. For example, &quot;kube-apiserver0+merge.yaml&quot; or just &quot;etcd.json&quot;. &quot;target&quot; can be one of &quot;kube-apiserver&quot;, &quot;kube-controller-manager&quot;, &quot;kube-scheduler&quot;, &quot;etcd&quot;, &quot;kubeletconfiguration&quot;. &quot;patchtype&quot; can be one of &quot;strategic&quot;, &quot;merge&quot; or &quot;json&quot; and they match the patch formats supported by kubectl. The default &quot;patchtype&quot; is &quot;strategic&quot;. &quot;extension&quot; must be either &quot;json&quot; or &quot;yaml&quot;. &quot;suffix&quot; is an optional string that can be used to determine which patches are applied first alpha-numerically.



--print-config


Specifies whether the configuration file that will be used in the upgrade should be printed or not.



-y, --yes


Perform the upgrade and do not prompt for confirmation (non-interactive mode).







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







