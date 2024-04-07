---
title: kube-proxy Configuration (v1alpha1)
content_type: tool-reference
package: kubeproxy.config.k8s.io/v1alpha1
auto_generated: true
---


## Resource Types 


- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)
  
    
    

## `ClientConnectionConfiguration`     {#ClientConnectionConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)

- [KubeSchedulerConfiguration](#kubescheduler-config-k8s-io-v1-KubeSchedulerConfiguration)

- [GenericControllerManagerConfiguration](#controllermanager-config-k8s-io-v1alpha1-GenericControllerManagerConfiguration)


ClientConnectionConfiguration contains details for constructing a client.



FieldDescription

    
  
kubeconfig [Required]
string


   kubeconfig is the path to a KubeConfig file.


acceptContentTypes [Required]
string


   acceptContentTypes defines the Accept header sent by clients when connecting to a server, overriding the
default value of 'application/json'. This field will control all connections to the server used by a particular
client.


contentType [Required]
string


   contentType is the content type used when sending data to the server from this client.


qps [Required]
float32


   qps controls the number of queries per second allowed for this connection.


burst [Required]
int32


   burst allows extra queries to accumulate when a client is exceeding its rate.





## `DebuggingConfiguration`     {#DebuggingConfiguration}
    

**Appears in:**

- [KubeSchedulerConfiguration](#kubescheduler-config-k8s-io-v1-KubeSchedulerConfiguration)

- [GenericControllerManagerConfiguration](#controllermanager-config-k8s-io-v1alpha1-GenericControllerManagerConfiguration)


DebuggingConfiguration holds configuration for Debugging related features.



FieldDescription

    
  
enableProfiling [Required]
bool


   enableProfiling enables profiling via web interface host:port/debug/pprof/


enableContentionProfiling [Required]
bool


   enableContentionProfiling enables block profiling, if
enableProfiling is true.





## `LeaderElectionConfiguration`     {#LeaderElectionConfiguration}
    

**Appears in:**

- [KubeSchedulerConfiguration](#kubescheduler-config-k8s-io-v1-KubeSchedulerConfiguration)

- [GenericControllerManagerConfiguration](#controllermanager-config-k8s-io-v1alpha1-GenericControllerManagerConfiguration)


LeaderElectionConfiguration defines the configuration of leader election
clients for components that can run with leader election enabled.



FieldDescription

    
  
leaderElect [Required]
bool


   leaderElect enables a leader election client to gain leadership
before executing the main loop. Enable this when running replicated
components for high availability.


leaseDuration [Required]
meta/v1.Duration


   leaseDuration is the duration that non-leader candidates will wait
after observing a leadership renewal until attempting to acquire
leadership of a led but unrenewed leader slot. This is effectively the
maximum duration that a leader can be stopped before it is replaced
by another candidate. This is only applicable if leader election is
enabled.


renewDeadline [Required]
meta/v1.Duration


   renewDeadline is the interval between attempts by the acting master to
renew a leadership slot before it stops leading. This must be less
than or equal to the lease duration. This is only applicable if leader
election is enabled.


retryPeriod [Required]
meta/v1.Duration


   retryPeriod is the duration the clients should wait between attempting
acquisition and renewal of a leadership. This is only applicable if
leader election is enabled.


resourceLock [Required]
string


   resourceLock indicates the resource object type that will be used to lock
during leader election cycles.


resourceName [Required]
string


   resourceName indicates the name of resource object that will be used to lock
during leader election cycles.


resourceNamespace [Required]
string


   resourceName indicates the namespace of resource object that will be used to lock
during leader election cycles.




  

## `KubeProxyConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration}
    


KubeProxyConfiguration contains everything necessary to configure the
Kubernetes proxy server.



FieldDescription

    
apiVersionstringkubeproxy.config.k8s.io/v1alpha1
kindstringKubeProxyConfiguration
    
  
featureGates [Required]
map[string]bool


   featureGates is a map of feature names to bools that enable or disable alpha/experimental features.


clientConnection [Required]
ClientConnectionConfiguration


   clientConnection specifies the kubeconfig file and client connection settings for the proxy
server to use when communicating with the apiserver.


logging [Required]
LoggingConfiguration


   logging specifies the options of logging.
Refer to Logs Options
for more information.


hostnameOverride [Required]
string


   hostnameOverride, if non-empty, will be used as the name of the Node that
kube-proxy is running on. If unset, the node name is assumed to be the same as
the node's hostname.


bindAddress [Required]
string


   bindAddress can be used to override kube-proxy's idea of what its node's
primary IP is. Note that the name is a historical artifact, and kube-proxy does
not actually bind any sockets to this IP.


healthzBindAddress [Required]
string


   healthzBindAddress is the IP address and port for the health check server to
serve on, defaulting to &quot;0.0.0.0:10256&quot; (if bindAddress is unset or IPv4), or
&quot;[::]:10256&quot; (if bindAddress is IPv6).


metricsBindAddress [Required]
string


   metricsBindAddress is the IP address and port for the metrics server to serve
on, defaulting to &quot;127.0.0.1:10249&quot; (if bindAddress is unset or IPv4), or
&quot;[::1]:10249&quot; (if bindAddress is IPv6). (Set to &quot;0.0.0.0:10249&quot; / &quot;[::]:10249&quot;
to bind on all interfaces.)


bindAddressHardFail [Required]
bool


   bindAddressHardFail, if true, tells kube-proxy to treat failure to bind to a
port as fatal and exit


enableProfiling [Required]
bool


   enableProfiling enables profiling via web interface on /debug/pprof handler.
Profiling handlers will be handled by metrics server.


showHiddenMetricsForVersion [Required]
string


   showHiddenMetricsForVersion is the version for which you want to show hidden metrics.


mode [Required]
ProxyMode


   mode specifies which proxy mode to use.


iptables [Required]
KubeProxyIPTablesConfiguration


   iptables contains iptables-related configuration options.


ipvs [Required]
KubeProxyIPVSConfiguration


   ipvs contains ipvs-related configuration options.


nftables [Required]
KubeProxyNFTablesConfiguration


   nftables contains nftables-related configuration options.


winkernel [Required]
KubeProxyWinkernelConfiguration


   winkernel contains winkernel-related configuration options.


detectLocalMode [Required]
LocalMode


   detectLocalMode determines mode to use for detecting local traffic, defaults to LocalModeClusterCIDR


detectLocal [Required]
DetectLocalConfiguration


   detectLocal contains optional configuration settings related to DetectLocalMode.


clusterCIDR [Required]
string


   clusterCIDR is the CIDR range of the pods in the cluster. (For dual-stack
clusters, this can be a comma-separated dual-stack pair of CIDR ranges.). When
DetectLocalMode is set to LocalModeClusterCIDR, kube-proxy will consider
traffic to be local if its source IP is in this range. (Otherwise it is not
used.)


nodePortAddresses [Required]
[]string


   nodePortAddresses is a list of CIDR ranges that contain valid node IPs. If set,
connections to NodePort services will only be accepted on node IPs in one of
the indicated ranges. If unset, NodePort connections will be accepted on all
local IPs.


oomScoreAdj [Required]
int32


   oomScoreAdj is the oom-score-adj value for kube-proxy process. Values must be within
the range [-1000, 1000]


conntrack [Required]
KubeProxyConntrackConfiguration


   conntrack contains conntrack-related configuration options.


configSyncPeriod [Required]
meta/v1.Duration


   configSyncPeriod is how often configuration from the apiserver is refreshed. Must be greater
than 0.


portRange [Required]
string


   portRange was previously used to configure the userspace proxy, but is now unused.





## `DetectLocalConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-DetectLocalConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


DetectLocalConfiguration contains optional settings related to DetectLocalMode option



FieldDescription

    
  
bridgeInterface [Required]
string


   bridgeInterface is a bridge interface name. When DetectLocalMode is set to
LocalModeBridgeInterface, kube-proxy will consider traffic to be local if
it originates from this bridge.


interfaceNamePrefix [Required]
string


   interfaceNamePrefix is an interface name prefix. When DetectLocalMode is set to
LocalModeInterfaceNamePrefix, kube-proxy will consider traffic to be local if
it originates from any interface whose name begins with this prefix.





## `KubeProxyConntrackConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConntrackConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


KubeProxyConntrackConfiguration contains conntrack settings for
the Kubernetes proxy server.



FieldDescription

    
  
maxPerCore [Required]
int32


   maxPerCore is the maximum number of NAT connections to track
per CPU core (0 to leave the limit as-is and ignore min).


min [Required]
int32


   min is the minimum value of connect-tracking records to allocate,
regardless of maxPerCore (set maxPerCore=0 to leave the limit as-is).


tcpEstablishedTimeout [Required]
meta/v1.Duration


   tcpEstablishedTimeout is how long an idle TCP connection will be kept open
(e.g. '2s').  Must be greater than 0 to set.


tcpCloseWaitTimeout [Required]
meta/v1.Duration


   tcpCloseWaitTimeout is how long an idle conntrack entry
in CLOSE_WAIT state will remain in the conntrack
table. (e.g. '60s'). Must be greater than 0 to set.


tcpBeLiberal [Required]
bool


   tcpBeLiberal, if true, kube-proxy will configure conntrack
to run in liberal mode for TCP connections and packets with
out-of-window sequence numbers won't be marked INVALID.


udpTimeout [Required]
meta/v1.Duration


   udpTimeout is how long an idle UDP conntrack entry in
UNREPLIED state will remain in the conntrack table
(e.g. '30s'). Must be greater than 0 to set.


udpStreamTimeout [Required]
meta/v1.Duration


   udpStreamTimeout is how long an idle UDP conntrack entry in
ASSURED state will remain in the conntrack table
(e.g. '300s'). Must be greater than 0 to set.





## `KubeProxyIPTablesConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyIPTablesConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


KubeProxyIPTablesConfiguration contains iptables-related configuration
details for the Kubernetes proxy server.



FieldDescription

    
  
masqueradeBit [Required]
int32


   masqueradeBit is the bit of the iptables fwmark space to use for SNAT if using
the iptables or ipvs proxy mode. Values must be within the range [0, 31].


masqueradeAll [Required]
bool


   masqueradeAll tells kube-proxy to SNAT all traffic sent to Service cluster IPs,
when using the iptables or ipvs proxy mode. This may be required with some CNI
plugins.


localhostNodePorts [Required]
bool


   localhostNodePorts, if false, tells kube-proxy to disable the legacy behavior
of allowing NodePort services to be accessed via localhost. (Applies only to
iptables mode and IPv4; localhost NodePorts are never allowed with other proxy
modes or with IPv6.)


syncPeriod [Required]
meta/v1.Duration


   syncPeriod is an interval (e.g. '5s', '1m', '2h22m') indicating how frequently
various re-synchronizing and cleanup operations are performed. Must be greater
than 0.


minSyncPeriod [Required]
meta/v1.Duration


   minSyncPeriod is the minimum period between iptables rule resyncs (e.g. '5s',
'1m', '2h22m'). A value of 0 means every Service or EndpointSlice change will
result in an immediate iptables resync.





## `KubeProxyIPVSConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyIPVSConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


KubeProxyIPVSConfiguration contains ipvs-related configuration
details for the Kubernetes proxy server.



FieldDescription

    
  
syncPeriod [Required]
meta/v1.Duration


   syncPeriod is an interval (e.g. '5s', '1m', '2h22m') indicating how frequently
various re-synchronizing and cleanup operations are performed. Must be greater
than 0.


minSyncPeriod [Required]
meta/v1.Duration


   minSyncPeriod is the minimum period between IPVS rule resyncs (e.g. '5s', '1m',
'2h22m'). A value of 0 means every Service or EndpointSlice change will result
in an immediate IPVS resync.


scheduler [Required]
string


   scheduler is the IPVS scheduler to use


excludeCIDRs [Required]
[]string


   excludeCIDRs is a list of CIDRs which the ipvs proxier should not touch
when cleaning up ipvs services.


strictARP [Required]
bool


   strictARP configures arp_ignore and arp_announce to avoid answering ARP queries
from kube-ipvs0 interface


tcpTimeout [Required]
meta/v1.Duration


   tcpTimeout is the timeout value used for idle IPVS TCP sessions.
The default value is 0, which preserves the current timeout value on the system.


tcpFinTimeout [Required]
meta/v1.Duration


   tcpFinTimeout is the timeout value used for IPVS TCP sessions after receiving a FIN.
The default value is 0, which preserves the current timeout value on the system.


udpTimeout [Required]
meta/v1.Duration


   udpTimeout is the timeout value used for IPVS UDP packets.
The default value is 0, which preserves the current timeout value on the system.





## `KubeProxyNFTablesConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyNFTablesConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


KubeProxyNFTablesConfiguration contains nftables-related configuration
details for the Kubernetes proxy server.



FieldDescription

    
  
masqueradeBit [Required]
int32


   masqueradeBit is the bit of the iptables fwmark space to use for SNAT if using
the nftables proxy mode. Values must be within the range [0, 31].


masqueradeAll [Required]
bool


   masqueradeAll tells kube-proxy to SNAT all traffic sent to Service cluster IPs,
when using the nftables mode. This may be required with some CNI plugins.


syncPeriod [Required]
meta/v1.Duration


   syncPeriod is an interval (e.g. '5s', '1m', '2h22m') indicating how frequently
various re-synchronizing and cleanup operations are performed. Must be greater
than 0.


minSyncPeriod [Required]
meta/v1.Duration


   minSyncPeriod is the minimum period between iptables rule resyncs (e.g. '5s',
'1m', '2h22m'). A value of 0 means every Service or EndpointSlice change will
result in an immediate iptables resync.





## `KubeProxyWinkernelConfiguration`     {#kubeproxy-config-k8s-io-v1alpha1-KubeProxyWinkernelConfiguration}
    

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


KubeProxyWinkernelConfiguration contains Windows/HNS settings for
the Kubernetes proxy server.



FieldDescription

    
  
networkName [Required]
string


   networkName is the name of the network kube-proxy will use
to create endpoints and policies


sourceVip [Required]
string


   sourceVip is the IP address of the source VIP endpoint used for
NAT when loadbalancing


enableDSR [Required]
bool


   enableDSR tells kube-proxy whether HNS policies should be created
with DSR


rootHnsEndpointName [Required]
string


   rootHnsEndpointName is the name of hnsendpoint that is attached to
l2bridge for root network namespace


forwardHealthCheckVip [Required]
bool


   forwardHealthCheckVip forwards service VIP for health check port on
Windows





## `LocalMode`     {#kubeproxy-config-k8s-io-v1alpha1-LocalMode}
    
(Alias of `string`)

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


LocalMode represents modes to detect local traffic from the node




## `ProxyMode`     {#kubeproxy-config-k8s-io-v1alpha1-ProxyMode}
    
(Alias of `string`)

**Appears in:**

- [KubeProxyConfiguration](#kubeproxy-config-k8s-io-v1alpha1-KubeProxyConfiguration)


ProxyMode represents modes used by the Kubernetes proxy server.
Currently, two modes of proxy are available on Linux platforms: 'iptables' and 'ipvs'.
One mode of proxy is available on Windows platforms: 'kernelspace'.
If the proxy mode is unspecified, the best-available proxy mode will be used (currently this
is iptables on Linux and kernelspace on Windows). If the selected proxy mode cannot be
used (due to lack of kernel support, missing userspace components, etc) then kube-proxy
will exit with an error.



  