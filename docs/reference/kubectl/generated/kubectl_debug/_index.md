---
title: kubectl debug
content_type: tool-reference
weight: 30
auto_generated: true
no_list: true
---





## {{% heading "synopsis" %}}


Debug cluster resources using interactive debugging containers.

 'debug' provides automation for common debugging tasks for cluster objects identified by resource and name. Pods will be used by default if no resource is specified.

 The action taken by 'debug' varies depending on what resource is specified. Supported actions include:

  *  Workload: Create a copy of an existing pod with certain attributes changed, for example changing the image tag to a new version.
  *  Workload: Add an ephemeral container to an already running pod, for example to add debugging utilities without restarting the pod.
  *  Node: Create a new pod that runs in the node's host namespaces and can access the node's filesystem.

```
kubectl debug (POD | TYPE[[.VERSION].GROUP]/NAME) [ -- COMMAND [args...] ]
```

## {{% heading "examples" %}}

```
  # Create an interactive debugging session in pod mypod and immediately attach to it.
  kubectl debug mypod -it --image=busybox
  
  # Create an interactive debugging session for the pod in the file pod.yaml and immediately attach to it.
  # (requires the EphemeralContainers feature to be enabled in the cluster)
  kubectl debug -f pod.yaml -it --image=busybox
  
  # Create a debug container named debugger using a custom automated debugging image.
  kubectl debug --image=myproj/debug-tools -c debugger mypod
  
  # Create a copy of mypod adding a debug container and attach to it
  kubectl debug mypod -it --image=busybox --copy-to=my-debugger
  
  # Create a copy of mypod changing the command of mycontainer
  kubectl debug mypod -it --copy-to=my-debugger --container=mycontainer -- sh
  
  # Create a copy of mypod changing all container images to busybox
  kubectl debug mypod --copy-to=my-debugger --set-image=*=busybox
  
  # Create a copy of mypod adding a debug container and changing container images
  kubectl debug mypod -it --copy-to=my-debugger --image=debian --set-image=app=app:debug,sidecar=sidecar:debug
  
  # Create an interactive debugging session on a node and immediately attach to it.
  # The container will run in the host namespaces and the host's filesystem will be mounted at /host
  kubectl debug node/mynode -it --image=busybox
```

## {{% heading "options" %}}

   







--arguments-only


If specified, everything after -- will be passed to the new container as Args instead of Command.



--attach


If true, wait for the container to start running, and then attach as if 'kubectl attach ...' were called.  Default false, unless '-i/--stdin' is set, in which case the default is true.



-c, --container string


Container name to use for debug container.



--copy-to string


Create a copy of the target Pod with this name.



--env stringToString&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: []


Environment variables to set in the container.



-f, --filename strings


identifying the resource to debug



-h, --help


help for debug



--image string


Container image to use for debug container.



--image-pull-policy string


The image pull policy for the container. If left empty, this value will not be specified by the client and defaulted by the server.



--profile string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "legacy"


Debugging profile. Options are &quot;legacy&quot;, &quot;general&quot;, &quot;baseline&quot;, &quot;netadmin&quot;, or &quot;restricted&quot;.



-q, --quiet


If true, suppress informational messages.



--replace


When used with '--copy-to', delete the original Pod.



--same-node


When used with '--copy-to', schedule the copy of target Pod on the same node.



--set-image stringToString&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: []


When used with '--copy-to', a list of name=image pairs for changing container images, similar to how 'kubectl set image' works.



--share-processes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


When used with '--copy-to', enable process namespace sharing in the copy.



-i, --stdin


Keep stdin open on the container(s) in the pod, even if nothing is attached.



--target string


When using an ephemeral container, target processes in this container name.



-t, --tty


Allocate a TTY for the debugging container.







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

