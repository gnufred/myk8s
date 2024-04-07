---
title: kubectl rollout resume
content_type: tool-reference
weight: 30
auto_generated: true
---





## {{% heading "synopsis" %}}


Resume a paused resource.

 Paused resources will not be reconciled by a controller. By resuming a resource, we allow it to be reconciled again. Currently only deployments support being resumed.

```
kubectl rollout resume RESOURCE
```

## {{% heading "examples" %}}

```
  # Resume an already paused deployment
  kubectl rollout resume deployment/nginx
```

## {{% heading "options" %}}

   







--allow-missing-template-keys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, ignore any errors in templates when a field or map key is missing in the template. Only applies to golang and jsonpath output formats.



--field-manager string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "kubectl-rollout"


Name of the manager used to track field ownership.



-f, --filename strings


Filename, directory, or URL to files identifying the resource to get from a server.



-h, --help


help for resume



-k, --kustomize string


Process the kustomization directory. This flag can't be used together with -f or -R.



-o, --output string


Output format. One of: (json, yaml, name, go-template, go-template-file, template, templatefile, jsonpath, jsonpath-as-json, jsonpath-file).



-R, --recursive


Process the directory used in -f, --filename recursively. Useful when you want to manage related manifests organized within the same directory.



-l, --selector string


Selector (label query) to filter on, supports '=', '==', and '!='.(e.g. -l key1=value1,key2=value2). Matching objects must satisfy all of the specified label constraints.



--show-managed-fields


If true, keep the managedFields when printing objects in JSON or YAML format.



--template string


Template string or path to template file to use when -o=go-template, -o=go-template-file. The template format is golang templates [http://golang.org/pkg/text/template/#pkg-overview].







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

* [kubectl rollout](../)	 - Manage the rollout of a resource

