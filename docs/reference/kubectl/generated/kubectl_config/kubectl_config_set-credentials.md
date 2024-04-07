---
title: kubectl config set-credentials
content_type: tool-reference
weight: 30
auto_generated: true
---





## {{% heading "synopsis" %}}


Set a user entry in kubeconfig.

 Specifying a name that already exists will merge new fields on top of existing values.

        Client-certificate flags:
        --client-certificate=certfile --client-key=keyfile
        
        Bearer token flags:
        --token=bearer_token
        
        Basic auth flags:
        --username=basic_user --password=basic_password
        
 Bearer token and basic auth are mutually exclusive.

```
kubectl config set-credentials NAME [--client-certificate=path/to/certfile] [--client-key=path/to/keyfile] [--token=bearer_token] [--username=basic_user] [--password=basic_password] [--auth-provider=provider_name] [--auth-provider-arg=key=value] [--exec-command=exec_command] [--exec-api-version=exec_api_version] [--exec-arg=arg] [--exec-env=key=value]
```

## {{% heading "examples" %}}

```
  # Set only the "client-key" field on the "cluster-admin"
  # entry, without touching other values
  kubectl config set-credentials cluster-admin --client-key=~/.kube/admin.key
  
  # Set basic auth for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --username=admin --password=uXFGweU9l35qcif
  
  # Embed client certificate data in the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --client-certificate=~/.kube/admin.crt --embed-certs=true
  
  # Enable the Google Compute Platform auth provider for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --auth-provider=gcp
  
  # Enable the OpenID Connect auth provider for the "cluster-admin" entry with additional arguments
  kubectl config set-credentials cluster-admin --auth-provider=oidc --auth-provider-arg=client-id=foo --auth-provider-arg=client-secret=bar
  
  # Remove the "client-secret" config value for the OpenID Connect auth provider for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --auth-provider=oidc --auth-provider-arg=client-secret-
  
  # Enable new exec auth plugin for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --exec-command=/path/to/the/executable --exec-api-version=client.authentication.k8s.io/v1beta1
  
  # Define new exec auth plugin arguments for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --exec-arg=arg1 --exec-arg=arg2
  
  # Create or update exec auth plugin environment variables for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --exec-env=key1=val1 --exec-env=key2=val2
  
  # Remove exec auth plugin environment variables for the "cluster-admin" entry
  kubectl config set-credentials cluster-admin --exec-env=var-to-remove-
```

## {{% heading "options" %}}

   







--auth-provider string


Auth provider for the user entry in kubeconfig



--auth-provider-arg strings


'key=value' arguments for the auth provider



--client-certificate string


Path to client-certificate file for the user entry in kubeconfig



--client-key string


Path to client-key file for the user entry in kubeconfig



--embed-certs tristate[=true]


Embed client cert/key for the user entry in kubeconfig



--exec-api-version string


API version of the exec credential plugin for the user entry in kubeconfig



--exec-arg strings


New arguments for the exec credential plugin command for the user entry in kubeconfig



--exec-command string


Command for the exec credential plugin for the user entry in kubeconfig



--exec-env strings


'key=value' environment values for the exec credential plugin



-h, --help


help for set-credentials



--password string


password for the user entry in kubeconfig



--token string


token for the user entry in kubeconfig



--username string


username for the user entry in kubeconfig







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


use a particular kubeconfig file



--match-server-version


Require server version to match client version



-n, --namespace string


If present, the namespace scope for this CLI request



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



--user string


The name of the kubeconfig user to use



--version version[=true]


--version, --version=raw prints version information and quits; --version=vX.Y.Z... sets the reported version



--warnings-as-errors


Treat warnings received from the server as errors and exit with a non-zero exit code







## {{% heading "seealso" %}}

* [kubectl config](../)	 - Modify kubeconfig files

