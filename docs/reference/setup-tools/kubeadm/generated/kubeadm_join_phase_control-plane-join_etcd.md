


Add a new local etcd member

### Synopsis


Add a new local etcd member

```
kubeadm join phase control-plane-join etcd [flags]
```

### Options

   







--apiserver-advertise-address string


If the node should host a new control plane instance, the IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--config string


Path to a kubeadm configuration file.



--control-plane


Create a new control plane instance on this node



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for etcd



--node-name string


Specify the node name.



--patches string


Path to a directory that contains files named &quot;target[suffix][+patchtype].extension&quot;. For example, &quot;kube-apiserver0+merge.yaml&quot; or just &quot;etcd.json&quot;. &quot;target&quot; can be one of &quot;kube-apiserver&quot;, &quot;kube-controller-manager&quot;, &quot;kube-scheduler&quot;, &quot;etcd&quot;, &quot;kubeletconfiguration&quot;. &quot;patchtype&quot; can be one of &quot;strategic&quot;, &quot;merge&quot; or &quot;json&quot; and they match the patch formats supported by kubectl. The default &quot;patchtype&quot; is &quot;strategic&quot;. &quot;extension&quot; must be either &quot;json&quot; or &quot;yaml&quot;. &quot;suffix&quot; is an optional string that can be used to determine which patches are applied first alpha-numerically.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







