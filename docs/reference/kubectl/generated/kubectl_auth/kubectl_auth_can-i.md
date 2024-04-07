---
title: kubectl auth can-i
content_type: tool-reference
weight: 30
auto_generated: true
---





## {{% heading "synopsis" %}}


Check whether an action is allowed.

 VERB is a logical Kubernetes API verb like 'get', 'list', 'watch', 'delete', etc. TYPE is a Kubernetes resource. Shortcuts and groups will be resolved. NONRESOURCEURL is a partial URL that starts with "/". NAME is the name of a particular Kubernetes resource. This command pairs nicely with impersonation. See --as global flag.

```
kubectl auth can-i VERB [TYPE | TYPE/NAME | NONRESOURCEURL]
```

## {{% heading "examples" %}}

```
  # Check to see if I can create pods in any namespace
  kubectl auth can-i create pods --all-namespaces
  
  # Check to see if I can list deployments in my current namespace
  kubectl auth can-i list deployments.apps
  
  # Check to see if service account "foo" of namespace "dev" can list pods
  # in the namespace "prod".
  # You must be allowed to use impersonation for the global option "--as".
  kubectl auth can-i list pods --as=system:serviceaccount:dev:foo -n prod
  
  # Check to see if I can do everything in my current namespace ("*" means all)
  kubectl auth can-i '*' '*'
  
  # Check to see if I can get the job named "bar" in namespace "foo"
  kubectl auth can-i list jobs.batch/bar -n foo
  
  # Check to see if I can read pod logs
  kubectl auth can-i get pods --subresource=log
  
  # Check to see if I can access the URL /logs/
  kubectl auth can-i get /logs/
  
  # List all allowed actions in namespace "foo"
  kubectl auth can-i --list --namespace=foo
```

## {{% heading "options" %}}

   







-A, --all-namespaces


If true, check the specified action in all namespaces.



-h, --help


help for can-i



--list


If true, prints all allowed actions.



--no-headers


If true, prints allowed actions without headers



-q, --quiet


If true, suppress output and just return the exit code.



--subresource string


SubResource such as pod/log or deployment/scale







## {{% heading "parentoptions" %}}

   







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

* [kubectl auth](../)	 - Inspect authorization

