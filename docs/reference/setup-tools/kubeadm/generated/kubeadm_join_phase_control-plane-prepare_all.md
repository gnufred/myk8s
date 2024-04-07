


Prepare the machine for serving a control plane

### Synopsis


Prepare the machine for serving a control plane

```
kubeadm join phase control-plane-prepare all [api-server-endpoint] [flags]
```

### Options

   







--apiserver-advertise-address string


If the node should host a new control plane instance, the IP address the API Server will advertise it's listening on. If not set the default network interface will be used.



--apiserver-bind-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 6443


If the node should host a new control plane instance, the port for the API Server to bind to.



--certificate-key string


Use this key to decrypt the certificate secrets uploaded by init. The certificate key is a hex encoded string that is an AES key of size 32 bytes.



--config string


Path to a kubeadm configuration file.



--control-plane


Create a new control plane instance on this node



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


help for all



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







