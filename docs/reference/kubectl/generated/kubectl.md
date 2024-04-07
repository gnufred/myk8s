---
title: kubectl
content_type: tool-reference
weight: 30
auto_generated: true
---





## {{% heading "synopsis" %}}


kubectl controls the Kubernetes cluster manager.

 Find more information at: https://kubernetes.io/docs/reference/kubectl/

```
kubectl [flags]
```

## {{% heading "options" %}}

   







--as string


Username to impersonate for the operation. User could be a regular user or a service account in a namespace.



--as-group strings


Group to impersonate for the operation, this flag can be repeated to specify multiple groups.



--as-uid string


UID to impersonate for the operation.



--azure-container-registry-config string


Path to the file containing Azure container registry configuration information.



--cache-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "$HOME/.kube/cache"


Default cache directory



--certificate-authority string


Path to a cert file for the certificate authority



--client-certificate string


Path to a client certificate file for TLS



--client-key string


Path to a client key file for TLS



--cloud-provider-gce-l7lb-src-cidrs cidrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 130.211.0.0/22,35.191.0.0/16


CIDRs opened in GCE firewall for L7 LB traffic proxy &amp; health checks



--cloud-provider-gce-lb-src-cidrs cidrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 130.211.0.0/22,209.85.152.0/22,209.85.204.0/22,35.191.0.0/16


CIDRs opened in GCE firewall for L4 LB traffic proxy &amp; health checks



--cluster string


The name of the kubeconfig cluster to use



--context string


The name of the kubeconfig context to use



--default-not-ready-toleration-seconds int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 300


Indicates the tolerationSeconds of the toleration for notReady:NoExecute that is added by default to every pod that does not already have such a toleration.



--default-unreachable-toleration-seconds int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 300


Indicates the tolerationSeconds of the toleration for unreachable:NoExecute that is added by default to every pod that does not already have such a toleration.



--disable-compression


If true, opt-out of response compression for all requests to the server



-h, --help


help for kubectl



--insecure-skip-tls-verify


If true, the server's certificate will not be checked for validity. This will make your HTTPS connections insecure



--kubeconfig string


Path to the kubeconfig file to use for CLI requests.



--match-server-version


Require server version to match client version



-n, --namespace string


If present, the namespace scope for this CLI request



--password string


Password for basic authentication to the API server



--profile string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "none"


Name of profile to capture. One of (none|cpu|heap|goroutine|threadcreate|block|mutex)



--profile-output string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "profile.pprof"


Name of the file to write the profile to



--request-timeout string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "0"


The length of time to wait before giving up on a single server request. Non-zero values should contain a corresponding time unit (e.g. 1s, 2m, 3h). A value of zero means don't timeout requests.



-s, --server string


The address and port of the Kubernetes API server



--storage-driver-buffer-duration duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


Writes in the storage driver will be buffered for this duration, and committed to the non memory backends as a single transaction



--storage-driver-db string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "cadvisor"


database name



--storage-driver-host string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "localhost:8086"


database host:port



--storage-driver-password string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "root"


database password



--storage-driver-secure


use secure connection with database



--storage-driver-table string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "stats"


table name



--storage-driver-user string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "root"


database username



--tls-server-name string


Server name to use for server certificate validation. If it is not provided, the hostname used to contact the server is used



--token string


Bearer token for authentication to the API server



--user string


The name of the kubeconfig user to use



--username string


Username for basic authentication to the API server



--version version[=true]


--version, --version=raw prints version information and quits; --version=vX.Y.Z... sets the reported version



--warnings-as-errors


Treat warnings received from the server as errors and exit with a non-zero exit code







## {{% heading "seealso" %}}

* [kubectl annotate](../kubectl_annotate/)	 - Update the annotations on a resource
* [kubectl api-resources](../kubectl_api-resources/)	 - Print the supported API resources on the server
* [kubectl api-versions](../kubectl_api-versions/)	 - Print the supported API versions on the server, in the form of "group/version"
* [kubectl apply](../kubectl_apply/)	 - Apply a configuration to a resource by file name or stdin
* [kubectl attach](../kubectl_attach/)	 - Attach to a running container
* [kubectl auth](../kubectl_auth/)	 - Inspect authorization
* [kubectl autoscale](../kubectl_autoscale/)	 - Auto-scale a deployment, replica set, stateful set, or replication controller
* [kubectl certificate](../kubectl_certificate/)	 - Modify certificate resources
* [kubectl cluster-info](../kubectl_cluster-info/)	 - Display cluster information
* [kubectl completion](../kubectl_completion/)	 - Output shell completion code for the specified shell (bash, zsh, fish, or powershell)
* [kubectl config](../kubectl_config/)	 - Modify kubeconfig files
* [kubectl cordon](../kubectl_cordon/)	 - Mark node as unschedulable
* [kubectl cp](../kubectl_cp/)	 - Copy files and directories to and from containers
* [kubectl create](../kubectl_create/)	 - Create a resource from a file or from stdin
* [kubectl debug](../kubectl_debug/)	 - Create debugging sessions for troubleshooting workloads and nodes
* [kubectl delete](../kubectl_delete/)	 - Delete resources by file names, stdin, resources and names, or by resources and label selector
* [kubectl describe](../kubectl_describe/)	 - Show details of a specific resource or group of resources
* [kubectl diff](../kubectl_diff/)	 - Diff the live version against a would-be applied version
* [kubectl drain](../kubectl_drain/)	 - Drain node in preparation for maintenance
* [kubectl edit](../kubectl_edit/)	 - Edit a resource on the server
* [kubectl events](../kubectl_events/)	 - List events
* [kubectl exec](../kubectl_exec/)	 - Execute a command in a container
* [kubectl explain](../kubectl_explain/)	 - Get documentation for a resource
* [kubectl expose](../kubectl_expose/)	 - Take a replication controller, service, deployment or pod and expose it as a new Kubernetes service
* [kubectl get](../kubectl_get/)	 - Display one or many resources
* [kubectl kustomize](../kubectl_kustomize/)	 - Build a kustomization target from a directory or URL
* [kubectl label](../kubectl_label/)	 - Update the labels on a resource
* [kubectl logs](../kubectl_logs/)	 - Print the logs for a container in a pod
* [kubectl options](../kubectl_options/)	 - Print the list of flags inherited by all commands
* [kubectl patch](../kubectl_patch/)	 - Update fields of a resource
* [kubectl plugin](../kubectl_plugin/)	 - Provides utilities for interacting with plugins
* [kubectl port-forward](../kubectl_port-forward/)	 - Forward one or more local ports to a pod
* [kubectl proxy](../kubectl_proxy/)	 - Run a proxy to the Kubernetes API server
* [kubectl replace](../kubectl_replace/)	 - Replace a resource by file name or stdin
* [kubectl rollout](../kubectl_rollout/)	 - Manage the rollout of a resource
* [kubectl run](../kubectl_run/)	 - Run a particular image on the cluster
* [kubectl scale](../kubectl_scale/)	 - Set a new size for a deployment, replica set, or replication controller
* [kubectl set](../kubectl_set/)	 - Set specific features on objects
* [kubectl taint](../kubectl_taint/)	 - Update the taints on one or more nodes
* [kubectl top](../kubectl_top/)	 - Display resource (CPU/memory) usage
* [kubectl uncordon](../kubectl_uncordon/)	 - Mark node as schedulable
* [kubectl version](../kubectl_version/)	 - Print the client and server version information
* [kubectl wait](../kubectl_wait/)	 - Experimental: Wait for a specific condition on one or many resources

