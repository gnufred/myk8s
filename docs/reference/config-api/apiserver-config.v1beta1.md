---
title: kube-apiserver Configuration (v1beta1)
content_type: tool-reference
package: apiserver.k8s.io/v1beta1
auto_generated: true
---
Package v1beta1 is the v1beta1 version of the API.


## Resource Types 


- [EgressSelectorConfiguration](#apiserver-k8s-io-v1beta1-EgressSelectorConfiguration)
- [TracingConfiguration](#apiserver-k8s-io-v1beta1-TracingConfiguration)
  
    
    

## `TracingConfiguration`     {#TracingConfiguration}
    

**Appears in:**

- [KubeletConfiguration](#kubelet-config-k8s-io-v1beta1-KubeletConfiguration)

- [TracingConfiguration](#apiserver-k8s-io-v1alpha1-TracingConfiguration)

- [TracingConfiguration](#apiserver-k8s-io-v1beta1-TracingConfiguration)


TracingConfiguration provides versioned configuration for OpenTelemetry tracing clients.



FieldDescription

    
  
endpoint
string


   Endpoint of the collector this component will report traces to.
The connection is insecure, and does not currently support TLS.
Recommended is unset, and endpoint is the otlp grpc default, localhost:4317.


samplingRatePerMillion
int32


   SamplingRatePerMillion is the number of samples to collect per million spans.
Recommended is unset. If unset, sampler respects its parent span's sampling
rate, but otherwise never samples.




  

## `EgressSelectorConfiguration`     {#apiserver-k8s-io-v1beta1-EgressSelectorConfiguration}
    


EgressSelectorConfiguration provides versioned configuration for egress selector clients.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1beta1
kindstringEgressSelectorConfiguration
    
  
egressSelections [Required]
[]EgressSelection


   connectionServices contains a list of egress selection client configurations





## `TracingConfiguration`     {#apiserver-k8s-io-v1beta1-TracingConfiguration}
    


TracingConfiguration provides versioned configuration for tracing clients.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1beta1
kindstringTracingConfiguration
    
  
TracingConfiguration [Required]
TracingConfiguration

(Members of TracingConfiguration are embedded into this type.)
   Embed the component config tracing configuration struct





## `Connection`     {#apiserver-k8s-io-v1beta1-Connection}
    

**Appears in:**

- [EgressSelection](#apiserver-k8s-io-v1beta1-EgressSelection)


Connection provides the configuration for a single egress selection client.



FieldDescription

    
  
proxyProtocol [Required]
ProtocolType


   Protocol is the protocol used to connect from client to the konnectivity server.


transport
Transport


   Transport defines the transport configurations we use to dial to the konnectivity server.
This is required if ProxyProtocol is HTTPConnect or GRPC.





## `EgressSelection`     {#apiserver-k8s-io-v1beta1-EgressSelection}
    

**Appears in:**

- [EgressSelectorConfiguration](#apiserver-k8s-io-v1beta1-EgressSelectorConfiguration)


EgressSelection provides the configuration for a single egress selection client.



FieldDescription

    
  
name [Required]
string


   name is the name of the egress selection.
Currently supported values are &quot;controlplane&quot;, &quot;master&quot;, &quot;etcd&quot; and &quot;cluster&quot;
The &quot;master&quot; egress selector is deprecated in favor of &quot;controlplane&quot;


connection [Required]
Connection


   connection is the exact information used to configure the egress selection





## `ProtocolType`     {#apiserver-k8s-io-v1beta1-ProtocolType}
    
(Alias of `string`)

**Appears in:**

- [Connection](#apiserver-k8s-io-v1beta1-Connection)


ProtocolType is a set of valid values for Connection.ProtocolType




## `TCPTransport`     {#apiserver-k8s-io-v1beta1-TCPTransport}
    

**Appears in:**

- [Transport](#apiserver-k8s-io-v1beta1-Transport)


TCPTransport provides the information to connect to konnectivity server via TCP



FieldDescription

    
  
url [Required]
string


   URL is the location of the konnectivity server to connect to.
As an example it might be &quot;https://127.0.0.1:8131&quot;


tlsConfig
TLSConfig


   TLSConfig is the config needed to use TLS when connecting to konnectivity server





## `TLSConfig`     {#apiserver-k8s-io-v1beta1-TLSConfig}
    

**Appears in:**

- [TCPTransport](#apiserver-k8s-io-v1beta1-TCPTransport)


TLSConfig provides the authentication information to connect to konnectivity server
Only used with TCPTransport



FieldDescription

    
  
caBundle
string


   caBundle is the file location of the CA to be used to determine trust with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
If absent while TCPTransport.URL is prefixed with https://, default to system trust roots.


clientKey
string


   clientKey is the file location of the client key to be used in mtls handshakes with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
Must be configured if TCPTransport.URL is prefixed with https://


clientCert
string


   clientCert is the file location of the client certificate to be used in mtls handshakes with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
Must be configured if TCPTransport.URL is prefixed with https://





## `Transport`     {#apiserver-k8s-io-v1beta1-Transport}
    

**Appears in:**

- [Connection](#apiserver-k8s-io-v1beta1-Connection)


Transport defines the transport configurations we use to dial to the konnectivity server



FieldDescription

    
  
tcp
TCPTransport


   TCP is the TCP configuration for communicating with the konnectivity server via TCP
ProxyProtocol of GRPC is not supported with TCP transport at the moment
Requires at least one of TCP or UDS to be set


uds
UDSTransport


   UDS is the UDS configuration for communicating with the konnectivity server via UDS
Requires at least one of TCP or UDS to be set





## `UDSTransport`     {#apiserver-k8s-io-v1beta1-UDSTransport}
    

**Appears in:**

- [Transport](#apiserver-k8s-io-v1beta1-Transport)


UDSTransport provides the information to connect to konnectivity server via UDS



FieldDescription

    
  
udsName [Required]
string


   UDSName is the name of the unix domain socket to connect to konnectivity server
This does not use a unix:// prefix. (Eg: /etc/srv/kubernetes/konnectivity-server/konnectivity-server.socket)




  