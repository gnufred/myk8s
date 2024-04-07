


Generate the kubeconfig for the new control plane components

### Synopsis


Generate the kubeconfig for the new control plane components

```
kubeadm join phase control-plane-prepare kubeconfig [api-server-endpoint] [flags]
```

### Options

   







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


help for kubeconfig



--tls-bootstrap-token string


Specify the token used to temporarily authenticate with the Kubernetes Control Plane while joining the node.



--token string


Use this token for both discovery-token and tls-bootstrap-token when those values are not provided.







### Options inherited from parent commands

   







--rootfs string


[EXPERIMENTAL] The path to the 'real' host root filesystem.







