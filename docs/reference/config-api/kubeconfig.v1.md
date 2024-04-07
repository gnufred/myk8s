---
title: kubeconfig (v1)
content_type: tool-reference
package: v1
auto_generated: true
---

## Resource Types 


- [Config](#Config)
  
    
    

## `Config`     {#Config}
    


Config holds the information needed to build connect to remote kubernetes clusters as a given user



FieldDescription

    
apiVersionstring/v1
kindstringConfig
    
  
kind
string


   Legacy field from pkg/api/types.go TypeMeta.
TODO(jlowdermilk): remove this after eliminating downstream dependencies.


apiVersion
string


   Legacy field from pkg/api/types.go TypeMeta.
TODO(jlowdermilk): remove this after eliminating downstream dependencies.


preferences [Required]
Preferences


   Preferences holds general information to be use for cli interactions


clusters [Required]
[]NamedCluster


   Clusters is a map of referencable names to cluster configs


users [Required]
[]NamedAuthInfo


   AuthInfos is a map of referencable names to user configs


contexts [Required]
[]NamedContext


   Contexts is a map of referencable names to context configs


current-context [Required]
string


   CurrentContext is the name of the context that you would like to use by default


extensions
[]NamedExtension


   Extensions holds additional information. This is useful for extenders so that reads and writes don't clobber unknown fields





## `AuthInfo`     {#AuthInfo}
    

**Appears in:**

- [NamedAuthInfo](#NamedAuthInfo)


AuthInfo contains information that describes identity information.  This is use to tell the kubernetes cluster who you are.



FieldDescription

    
  
client-certificate
string


   ClientCertificate is the path to a client cert file for TLS.


client-certificate-data
[]byte


   ClientCertificateData contains PEM-encoded data from a client cert file for TLS. Overrides ClientCertificate


client-key
string


   ClientKey is the path to a client key file for TLS.


client-key-data
[]byte


   ClientKeyData contains PEM-encoded data from a client key file for TLS. Overrides ClientKey


token
string


   Token is the bearer token for authentication to the kubernetes cluster.


tokenFile
string


   TokenFile is a pointer to a file that contains a bearer token (as described above).  If both Token and TokenFile are present, Token takes precedence.


as
string


   Impersonate is the username to impersonate.  The name matches the flag.


as-uid
string


   ImpersonateUID is the uid to impersonate.


as-groups
[]string


   ImpersonateGroups is the groups to impersonate.


as-user-extra
map[string][]string


   ImpersonateUserExtra contains additional information for impersonated user.


username
string


   Username is the username for basic authentication to the kubernetes cluster.


password
string


   Password is the password for basic authentication to the kubernetes cluster.


auth-provider
AuthProviderConfig


   AuthProvider specifies a custom authentication plugin for the kubernetes cluster.


exec
ExecConfig


   Exec specifies a custom exec-based authentication plugin for the kubernetes cluster.


extensions
[]NamedExtension


   Extensions holds additional information. This is useful for extenders so that reads and writes don't clobber unknown fields





## `AuthProviderConfig`     {#AuthProviderConfig}
    

**Appears in:**

- [AuthInfo](#AuthInfo)


AuthProviderConfig holds the configuration for a specified auth provider.



FieldDescription

    
  
name [Required]
string


   No description provided.

config [Required]
map[string]string


   No description provided.




## `Cluster`     {#Cluster}
    

**Appears in:**

- [NamedCluster](#NamedCluster)


Cluster contains information about how to communicate with a kubernetes cluster



FieldDescription

    
  
server [Required]
string


   Server is the address of the kubernetes cluster (https://hostname:port).


tls-server-name
string


   TLSServerName is used to check server certificate. If TLSServerName is empty, the hostname used to contact the server is used.


insecure-skip-tls-verify
bool


   InsecureSkipTLSVerify skips the validity check for the server's certificate. This will make your HTTPS connections insecure.


certificate-authority
string


   CertificateAuthority is the path to a cert file for the certificate authority.


certificate-authority-data
[]byte


   CertificateAuthorityData contains PEM-encoded certificate authority certificates. Overrides CertificateAuthority


proxy-url
string


   ProxyURL is the URL to the proxy to be used for all requests made by this
client. URLs with &quot;http&quot;, &quot;https&quot;, and &quot;socks5&quot; schemes are supported.  If
this configuration is not provided or the empty string, the client
attempts to construct a proxy configuration from http_proxy and
https_proxy environment variables. If these environment variables are not
set, the client does not attempt to proxy requests.
socks5 proxying does not currently support spdy streaming endpoints (exec,
attach, port forward).


disable-compression
bool


   DisableCompression allows client to opt-out of response compression for all requests to the server. This is useful
to speed up requests (specifically lists) when client-server network bandwidth is ample, by saving time on
compression (server-side) and decompression (client-side): https://github.com/kubernetes/kubernetes/issues/112296.


extensions
[]NamedExtension


   Extensions holds additional information. This is useful for extenders so that reads and writes don't clobber unknown fields





## `Context`     {#Context}
    

**Appears in:**

- [NamedContext](#NamedContext)


Context is a tuple of references to a cluster (how do I communicate with a kubernetes cluster), a user (how do I identify myself), and a namespace (what subset of resources do I want to work with)



FieldDescription

    
  
cluster [Required]
string


   Cluster is the name of the cluster for this context


user [Required]
string


   AuthInfo is the name of the authInfo for this context


namespace
string


   Namespace is the default namespace to use on unspecified requests


extensions
[]NamedExtension


   Extensions holds additional information. This is useful for extenders so that reads and writes don't clobber unknown fields





## `ExecConfig`     {#ExecConfig}
    

**Appears in:**

- [AuthInfo](#AuthInfo)


ExecConfig specifies a command to provide client credentials. The command is exec'd
and outputs structured stdout holding credentials.
See the client.authentication.k8s.io API group for specifications of the exact input
and output format



FieldDescription

    
  
command [Required]
string


   Command to execute.


args
[]string


   Arguments to pass to the command when executing it.


env
[]ExecEnvVar


   Env defines additional environment variables to expose to the process. These
are unioned with the host's environment, as well as variables client-go uses
to pass argument to the plugin.


apiVersion [Required]
string


   Preferred input version of the ExecInfo. The returned ExecCredentials MUST use
the same encoding version as the input.


installHint [Required]
string


   This text is shown to the user when the executable doesn't seem to be
present. For example, brew install foo-cli might be a good InstallHint for
foo-cli on Mac OS systems.


provideClusterInfo [Required]
bool


   ProvideClusterInfo determines whether or not to provide cluster information,
which could potentially contain very large CA data, to this exec plugin as a
part of the KUBERNETES_EXEC_INFO environment variable. By default, it is set
to false. Package k8s.io/client-go/tools/auth/exec provides helper methods for
reading this environment variable.


interactiveMode
ExecInteractiveMode


   InteractiveMode determines this plugin's relationship with standard input. Valid
values are &quot;Never&quot; (this exec plugin never uses standard input), &quot;IfAvailable&quot; (this
exec plugin wants to use standard input if it is available), or &quot;Always&quot; (this exec
plugin requires standard input to function). See ExecInteractiveMode values for more
details.
If APIVersion is client.authentication.k8s.io/v1alpha1 or
client.authentication.k8s.io/v1beta1, then this field is optional and defaults
to &quot;IfAvailable&quot; when unset. Otherwise, this field is required.





## `ExecEnvVar`     {#ExecEnvVar}
    

**Appears in:**

- [ExecConfig](#ExecConfig)


ExecEnvVar is used for setting environment variables when executing an exec-based
credential plugin.



FieldDescription

    
  
name [Required]
string


   No description provided.

value [Required]
string


   No description provided.




## `ExecInteractiveMode`     {#ExecInteractiveMode}
    
(Alias of `string`)

**Appears in:**

- [ExecConfig](#ExecConfig)


ExecInteractiveMode is a string that describes an exec plugin's relationship with standard input.




## `NamedAuthInfo`     {#NamedAuthInfo}
    

**Appears in:**

- [Config](#Config)


NamedAuthInfo relates nicknames to auth information



FieldDescription

    
  
name [Required]
string


   Name is the nickname for this AuthInfo


user [Required]
AuthInfo


   AuthInfo holds the auth information





## `NamedCluster`     {#NamedCluster}
    

**Appears in:**

- [Config](#Config)


NamedCluster relates nicknames to cluster information



FieldDescription

    
  
name [Required]
string


   Name is the nickname for this Cluster


cluster [Required]
Cluster


   Cluster holds the cluster information





## `NamedContext`     {#NamedContext}
    

**Appears in:**

- [Config](#Config)


NamedContext relates nicknames to context information



FieldDescription

    
  
name [Required]
string


   Name is the nickname for this Context


context [Required]
Context


   Context holds the context information





## `NamedExtension`     {#NamedExtension}
    

**Appears in:**

- [Config](#Config)

- [AuthInfo](#AuthInfo)

- [Cluster](#Cluster)

- [Context](#Context)

- [Preferences](#Preferences)


NamedExtension relates nicknames to extension information



FieldDescription

    
  
name [Required]
string


   Name is the nickname for this Extension


extension [Required]
k8s.io/apimachinery/pkg/runtime.RawExtension


   Extension holds the extension information





## `Preferences`     {#Preferences}
    

**Appears in:**

- [Config](#Config)




FieldDescription

    
  
colors
bool


   No description provided.

extensions
[]NamedExtension


   Extensions holds additional information. This is useful for extenders so that reads and writes don't clobber unknown fields



