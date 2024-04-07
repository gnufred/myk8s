


Write kubelet settings, certificates and (re)start the kubelet

### Synopsis


Write a file with KubeletConfiguration and an environment file with node specific kubelet settings, and then (re)start kubelet.

```
kubeadm join phase kubelet-start [api-server-endpoint] [flags]
```

### Options

   







--config string


Path to a kubeadm configuration file.



--cri-socket string


Path to the CRI socket to connect. If empty kubeadm will try to auto-detect this value; use this option only if you have more than one CRI installed or if you have non-standard CRI socket.



--discovery-file string


For file-based discovery, a file or URL from which to load cluster information.



--discovery-token string


For token-based discovery, the token used to validate cluster information fetched from the API server.



--discovery-token-ca-cert-hash strings


For token-based discovery, validate that the root CA public key matches this hash (format: &quot;&lt;type&gt;:&lt;value&gt;&quot;).



--discovery-token-unsafe-skip-ca-verification


For token-based discovery, allow joining without --discovery-token-ca-cert-hash pinning.



--dry-run


Don't apply any changes; just output what would be done.



-h, --help


help for kubelet-start



--node-name string


Specify the node name.



--patches string


Path to a directory that contains files named &quot;target[suffix][+patchtype].extension&quot;. For example, &quot;kube-apiserver0+merge.yaml&quot; or just &quot;etcd.json&quot;. &quot;target&quot; can be one of &quot;kube-apiserver&quot;, &quot;kube-controller-manager&quot;, &quot;kube-scheduler&quot;, &quot;etcd&quot;, &quot;kubeletconfiguration&quot;. &quot;patchtype&quot; can be one of &quot;strategic&quot;, &quot;merge&quot; or &quot;json&quot; and they match the patch formats supported by kubectl. The default &quot;patchtype&quot; is &quot;strategic&quot;. &quot;extension&quot; must be either &quot;json&quot; or &quot;yaml&quot;. &quot;suffix&quot; is an optional string that can be used to determine which patches are applied first alpha-numerically.



--tls-bootstrap-token string


Specify the token used to temporarily authenticate with the Kubernetes Control Plane while joining the node.



--token string


Use this token for both discovery-token and tls-bootstrap-token when those values are not provided.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







