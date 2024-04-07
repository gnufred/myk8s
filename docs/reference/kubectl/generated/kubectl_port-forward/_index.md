---
title: kubectl port-forward
content_type: tool-reference
weight: 30
auto_generated: true
no_list: true
---





## {{% heading "synopsis" %}}


Forward one or more local ports to a pod.

 Use resource type/name such as deployment/mydeployment to select a pod. Resource type defaults to 'pod' if omitted.

 If there are multiple pods matching the criteria, a pod will be selected automatically. The forwarding session ends when the selected pod terminates, and a rerun of the command is needed to resume forwarding.

```
kubectl port-forward TYPE/NAME [options] [LOCAL_PORT:]REMOTE_PORT [...[LOCAL_PORT_N:]REMOTE_PORT_N]
```

## {{% heading "examples" %}}

```
  # Listen on ports 5000 and 6000 locally, forwarding data to/from ports 5000 and 6000 in the pod
  kubectl port-forward pod/mypod 5000 6000
  
  # Listen on ports 5000 and 6000 locally, forwarding data to/from ports 5000 and 6000 in a pod selected by the deployment
  kubectl port-forward deployment/mydeployment 5000 6000
  
  # Listen on port 8443 locally, forwarding to the targetPort of the service's port named "https" in a pod selected by the service
  kubectl port-forward service/myservice 8443:https
  
  # Listen on port 8888 locally, forwarding to 5000 in the pod
  kubectl port-forward pod/mypod 8888:5000
  
  # Listen on port 8888 on all addresses, forwarding to 5000 in the pod
  kubectl port-forward --address 0.0.0.0 pod/mypod 8888:5000
  
  # Listen on port 8888 on localhost and selected IP, forwarding to 5000 in the pod
  kubectl port-forward --address localhost,10.19.21.23 pod/mypod 8888:5000
  
  # Listen on a random port locally, forwarding to 5000 in the pod
  kubectl port-forward pod/mypod :5000
```

## {{% heading "options" %}}

   







--address strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "localhost"


Addresses to listen on (comma separated). Only accepts IP addresses or localhost as a value. When localhost is supplied, kubectl will try to bind on both 127.0.0.1 and ::1 and will fail if neither of these addresses are available to bind.



-h, --help


help for port-forward



--pod-running-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


The length of time (like 5s, 2m, or 3h, higher than zero) to wait until at least one pod is running







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

* [kubectl](../kubectl/)	 - kubectl controls the Kubernetes cluster manager

