---
title: kubelet
content_type: tool-reference
weight: 20
---

## {{% heading "synopsis" %}}

The kubelet is the primary "node agent" that runs on each node. It can
register the node with the apiserver using one of: the hostname; a flag to
override the hostname; or specific logic for a cloud provider.

The kubelet works in terms of a PodSpec. A PodSpec is a YAML or JSON object
that describes a pod. The kubelet takes a set of PodSpecs that are provided
through various mechanisms (primarily through the apiserver) and ensures that
the containers described in those PodSpecs are running and healthy. The
kubelet doesn't manage containers which were not created by Kubernetes.

Other than from a PodSpec from the apiserver, there are two ways that a
container manifest can be provided to the kubelet.

- File: Path passed as a flag on the command line. Files under this path will be
  monitored periodically for updates. The monitoring period is 20s by default
  and is configurable via a flag.
- HTTP endpoint: HTTP endpoint passed as a parameter on the command line. This
  endpoint is checked every 20 seconds (also configurable with a flag).

```
kubelet [flags]
```

## {{% heading "options" %}}

   







--address string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 0.0.0.0 


The IP address for the kubelet to serve on (set to 0.0.0.0 or :: for listening on all interfaces and IP address families)  (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--allowed-unsafe-sysctls strings


Comma-separated whitelist of unsafe sysctls or unsafe sysctl patterns (ending in &ast;). Use these at your own risk. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--anonymous-auth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enables anonymous requests to the kubelet server. Requests that are not rejected by another authentication method are treated as anonymous requests. Anonymous requests have a username of system:anonymous, and a group name of system:unauthenticated. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--authentication-token-webhook


Use the TokenReview API to determine authentication for bearer tokens. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--authentication-token-webhook-cache-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2m0s


The duration to cache responses from the webhook token authenticator. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--authorization-mode string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: AlwaysAllow


Authorization mode for kubelet server. Valid options are &quot;AlwaysAllow&quot; or &quot;Webhook&quot;. Webhook mode uses the SubjectAccessReview API to determine authorization. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--authorization-webhook-cache-authorized-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5m0s


The duration to cache 'authorized' responses from the webhook authorizer. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--authorization-webhook-cache-unauthorized-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 30s


The duration to cache 'unauthorized' responses from the webhook authorizer. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--bootstrap-kubeconfig string


Path to a kubeconfig file that will be used to get client certificate for kubelet. If the file specified by --kubeconfig does not exist, the bootstrap kubeconfig is used to request a client certificate from the API server. On success, a kubeconfig file referencing the generated client certificate and key is written to the path specified by --kubeconfig. The client certificate and key file will be stored in the directory pointed by --cert-dir.



--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: /var/lib/kubelet/pki


The directory where the TLS certs are located. If --tls-cert-file and --tls-private-key-file are provided, this flag will be ignored.



--cgroup-driver string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: cgroupfs


Driver that the kubelet uses to manipulate cgroups on the host.  Possible values: &quot;cgroupfs&quot;, &quot;systemd&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cgroup-root string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: ''


Optional root cgroup to use for pods. This is handled by the container runtime on a best effort basis. Default: '', which means use the container runtime default. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cgroups-per-qos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enable creation of QoS cgroup hierarchy, if true, top level QoS and pod cgroups are created. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--client-ca-file string


If set, any request presenting a client certificate signed by one of the authorities in the client-ca-file is authenticated with an identity corresponding to the CommonName of the client certificate. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cloud-config string


The path to the cloud provider configuration file. Empty string for no configuration file. (DEPRECATED: will be removed in 1.25 or later, in favor of removing cloud providers code from kubelet.)



--cloud-provider string


The provider for cloud services. Set to empty string for running with no cloud provider. Set to 'external' for running with an external cloud provider. If set, the cloud provider determines the name of the node (consult cloud provider documentation to determine if and how the hostname is used).



--cluster-dns strings


Comma-separated list of DNS server IP address. This value is used for containers DNS server in case of Pods with "dnsPolicy: ClusterFirst".Note: all DNS servers appearing in the list MUST serve the same set of records otherwise name resolution within the cluster may not work correctly. There is no guarantee as to which DNS server may be contacted for name resolution. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cluster-domain string


Domain for this cluster. If set, kubelet will configure all containers to search this domain in addition to the host's search domains. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--config string


The kubelet will load its initial configuration from this file. The path may be absolute or relative; relative paths start at the kubelet's current working directory. Omit this flag to use the built-in default configuration values. Command-line flags override configuration from this file.



--config-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: ''


Path to a directory to specify drop-ins, allows the user to optionally specify additional configs to overwrite what is provided by default and in the `--config` flag.Note: Set the 'KUBELET_CONFIG_DROPIN_DIR_ALPHA' environment variable to specify the directory.



--container-log-max-files int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5


&lt;Warning: Beta feature&gt; Set the maximum number of container log files that can be present for a container. The number must be &gt;= 2. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--container-log-max-size string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10Mi


&lt;Warning: Beta feature&gt; Set the maximum size (e.g. 10Mi) of container log file before it is rotated.  (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--container-runtime-endpoint string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "unix:///run/containerd/containerd.sock"


The endpoint of remote runtime service. UNIX domain sockets are supported on Linux, while 'npipe' and 'tcp' endpoints are supported on windows. Examples: 'unix:///path/to/runtime.sock', 'npipe:////./pipe/runtime'. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--contention-profiling


Enable block profiling, if profiling is enabled. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cpu-cfs-quota&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enable CPU CFS quota enforcement for containers that specify CPU limits. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cpu-cfs-quota-period duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 100ms
   

Sets CPU CFS quota period value, cpu.cfs_period_us, defaults to Linux Kernel default. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cpu-manager-policy string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: none


The CPU manager policy to use. Possible values: &quot;none&quot;, &quot;static&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cpu-manager-policy-options string


A set of 'key=value' CPU manager policy options to use, to fine tune their behaviour. If not supplied, keep the default behaviour. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--cpu-manager-reconcile-period duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10s


&lt;Warning: Alpha feature&gt; CPU manager reconciliation period. Examples: &quot;10s&quot;, or &quot;1m&quot;. If not supplied, defaults to node status update frequency. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--enable-controller-attach-detach&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enables the Attach/Detach controller to manage attachment/detachment of volumes scheduled to this node, and disables kubelet from executing any attach/detach operations. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--enable-debugging-handlers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enables server endpoints for log collection and local running of containers and commands. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--enable-server&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enable the kubelet's server. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--enforce-node-allocatable strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: pods


A comma separated list of levels of node allocatable enforcement to be enforced by kubelet. Acceptable options are &quot;none&quot;, &quot;pods&quot;, &quot;system-reserved&quot;, and &quot;kube-reserved&quot;. If the latter two options are specified, --system-reserved-cgroup and --kube-reserved-cgroup must also be set, respectively. If &quot;none&quot; is specified, no additional options should be set. See official documentation for more details. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--event-burst int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 100


Maximum size of a bursty event records, temporarily allows event records to burst to this number, while still not exceeding --event-qps. The number must be &gt;= 0. If 0 will use default burst (100). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--event-qps int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 50


QPS to limit event creations. The number must be &gt;= 0. If 0 will use default QPS (50). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-hard strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: imagefs.available


A set of eviction thresholds (e.g. &quot;memory.available&quot;) that if met would trigger a pod eviction. On a Linux node, the default value also includes &quot;nodefs.inodesFree&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-max-pod-grace-period int32


 Maximum allowed grace period (in seconds) to use when terminating pods in response to a soft eviction threshold being met. If negative, defer to pod specified value. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-minimum-reclaim strings


A set of minimum reclaims (e.g. &quot;imagefs.available=2Gi&quot;) that describes the minimum amount of resource the kubelet will reclaim when performing a pod eviction if that resource is under pressure. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-pressure-transition-period duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5m0s


Duration for which the kubelet has to wait before transitioning out of an eviction pressure condition. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-soft strings


A set of eviction thresholds (e.g. &quot;memory.available&quot;) that if met over a corresponding grace period would trigger a pod eviction. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--eviction-soft-grace-period strings


A set of eviction grace periods (e.g. &quot;memory.available=1m30s&quot;) that correspond to how long a soft eviction threshold must hold before triggering a pod eviction. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--exit-on-lock-contention


Whether kubelet should exit upon lock-file contention.



--experimental-allocatable-ignore-eviction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: false


When set to true, hard eviction thresholds will be ignored while calculating node allocatable. See here for more details. (DEPRECATED: will be removed in 1.25 or later)



--experimental-mounter-path string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: mount


[Experimental] Path of mounter binary. Leave empty to use the default mount. (DEPRECATED: will be removed in 1.24 or later, in favor of using CSI.)



--fail-swap-on&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Makes the kubelet fail to start if swap is enabled on the node. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--feature-gates &lt;A list of 'key=true/false' pairs&gt;


A set of key=value pairs that describe feature gates for alpha/experimental features. Options are:
APIResponseCompression=true|false (BETA - default=true)
APIServerIdentity=true|false (BETA - default=true)
APIServerTracing=true|false (BETA - default=true)
AdmissionWebhookMatchConditions=true|false (BETA - default=true)
AggregatedDiscoveryEndpoint=true|false (BETA - default=true)
AllAlpha=true|false (ALPHA - default=false)
AllBeta=true|false (BETA - default=false)
AnyVolumeDataSource=true|false (BETA - default=true)
AppArmor=true|false (BETA - default=true)
CPUManagerPolicyAlphaOptions=true|false (ALPHA - default=false)
CPUManagerPolicyBetaOptions=true|false (BETA - default=true)
CPUManagerPolicyOptions=true|false (BETA - default=true)
CRDValidationRatcheting=true|false (ALPHA - default=false)
CSIMigrationPortworx=true|false (BETA - default=false)
CSIVolumeHealth=true|false (ALPHA - default=false)
CloudControllerManagerWebhook=true|false (ALPHA - default=false)
CloudDualStackNodeIPs=true|false (BETA - default=true)
ClusterTrustBundle=true|false (ALPHA - default=false)
ClusterTrustBundleProjection=true|false (ALPHA - default=false)
ComponentSLIs=true|false (BETA - default=true)
ConsistentListFromCache=true|false (ALPHA - default=false)
ContainerCheckpoint=true|false (ALPHA - default=false)
ContextualLogging=true|false (ALPHA - default=false)
CronJobsScheduledAnnotation=true|false (BETA - default=true)
CrossNamespaceVolumeDataSource=true|false (ALPHA - default=false)
CustomCPUCFSQuotaPeriod=true|false (ALPHA - default=false)
DevicePluginCDIDevices=true|false (BETA - default=true)
DisableCloudProviders=true|false (BETA - default=true)
DisableKubeletCloudCredentialProviders=true|false (BETA - default=true)
DisableNodeKubeProxyVersion=true|false (ALPHA - default=false)
DynamicResourceAllocation=true|false (ALPHA - default=false)
ElasticIndexedJob=true|false (BETA - default=true)
EventedPLEG=true|false (BETA - default=false)
GracefulNodeShutdown=true|false (BETA - default=true)
GracefulNodeShutdownBasedOnPodPriority=true|false (BETA - default=true)
HPAContainerMetrics=true|false (BETA - default=true)
HPAScaleToZero=true|false (ALPHA - default=false)
HonorPVReclaimPolicy=true|false (ALPHA - default=false)
ImageMaximumGCAge=true|false (ALPHA - default=false)
InPlacePodVerticalScaling=true|false (ALPHA - default=false)
InTreePluginAWSUnregister=true|false (ALPHA - default=false)
InTreePluginAzureDiskUnregister=true|false (ALPHA - default=false)
InTreePluginAzureFileUnregister=true|false (ALPHA - default=false)
InTreePluginGCEUnregister=true|false (ALPHA - default=false)
InTreePluginOpenStackUnregister=true|false (ALPHA - default=false)
InTreePluginPortworxUnregister=true|false (ALPHA - default=false)
InTreePluginvSphereUnregister=true|false (ALPHA - default=false)
JobBackoffLimitPerIndex=true|false (BETA - default=true)
JobPodFailurePolicy=true|false (BETA - default=true)
JobPodReplacementPolicy=true|false (BETA - default=true)
KubeProxyDrainingTerminatingNodes=true|false (ALPHA - default=false)
KubeletCgroupDriverFromCRI=true|false (ALPHA - default=false)
KubeletInUserNamespace=true|false (ALPHA - default=false)
KubeletPodResourcesDynamicResources=true|false (ALPHA - default=false)
KubeletPodResourcesGet=true|false (ALPHA - default=false)
KubeletSeparateDiskGC=true|false (ALPHA - default=false)
KubeletTracing=true|false (BETA - default=true)
LegacyServiceAccountTokenCleanUp=true|false (BETA - default=true)
LoadBalancerIPMode=true|false (ALPHA - default=false)
LocalStorageCapacityIsolationFSQuotaMonitoring=true|false (ALPHA - default=false)
LogarithmicScaleDown=true|false (BETA - default=true)
LoggingAlphaOptions=true|false (ALPHA - default=false)
LoggingBetaOptions=true|false (BETA - default=true)
MatchLabelKeysInPodAffinity=true|false (ALPHA - default=false)
MatchLabelKeysInPodTopologySpread=true|false (BETA - default=true)
MaxUnavailableStatefulSet=true|false (ALPHA - default=false)
MemoryManager=true|false (BETA - default=true)
MemoryQoS=true|false (ALPHA - default=false)
MinDomainsInPodTopologySpread=true|false (BETA - default=true)
MultiCIDRServiceAllocator=true|false (ALPHA - default=false)
NFTablesProxyMode=true|false (ALPHA - default=false)
NewVolumeManagerReconstruction=true|false (BETA - default=true)
NodeInclusionPolicyInPodTopologySpread=true|false (BETA - default=true)
NodeLogQuery=true|false (ALPHA - default=false)
NodeSwap=true|false (BETA - default=false)
OpenAPIEnums=true|false (BETA - default=true)
PDBUnhealthyPodEvictionPolicy=true|false (BETA - default=true)
PersistentVolumeLastPhaseTransitionTime=true|false (BETA - default=true)
PodAndContainerStatsFromCRI=true|false (ALPHA - default=false)
PodDeletionCost=true|false (BETA - default=true)
PodDisruptionConditions=true|false (BETA - default=true)
PodHostIPs=true|false (BETA - default=true)
PodIndexLabel=true|false (BETA - default=true)
PodLifecycleSleepAction=true|false (ALPHA - default=false)
PodReadyToStartContainersCondition=true|false (BETA - default=true)
PodSchedulingReadiness=true|false (BETA - default=true)
ProcMountType=true|false (ALPHA - default=false)
QOSReserved=true|false (ALPHA - default=false)
RecoverVolumeExpansionFailure=true|false (ALPHA - default=false)
RotateKubeletServerCertificate=true|false (BETA - default=true)
RuntimeClassInImageCriApi=true|false (ALPHA - default=false)
SELinuxMountReadWriteOncePod=true|false (BETA - default=true)
SchedulerQueueingHints=true|false (BETA - default=false)
SecurityContextDeny=true|false (ALPHA - default=false)
SeparateTaintEvictionController=true|false (BETA - default=true)
ServiceAccountTokenJTI=true|false (ALPHA - default=false)
ServiceAccountTokenNodeBinding=true|false (ALPHA - default=false)
ServiceAccountTokenNodeBindingValidation=true|false (ALPHA - default=false)
ServiceAccountTokenPodNodeInfo=true|false (ALPHA - default=false)
SidecarContainers=true|false (BETA - default=true)
SizeMemoryBackedVolumes=true|false (BETA - default=true)
StableLoadBalancerNodeSet=true|false (BETA - default=true)
StatefulSetAutoDeletePVC=true|false (BETA - default=true)
StatefulSetStartOrdinal=true|false (BETA - default=true)
StorageVersionAPI=true|false (ALPHA - default=false)
StorageVersionHash=true|false (BETA - default=true)
StructuredAuthenticationConfiguration=true|false (ALPHA - default=false)
StructuredAuthorizationConfiguration=true|false (ALPHA - default=false)
TopologyAwareHints=true|false (BETA - default=true)
TopologyManagerPolicyAlphaOptions=true|false (ALPHA - default=false)
TopologyManagerPolicyBetaOptions=true|false (BETA - default=true)
TopologyManagerPolicyOptions=true|false (BETA - default=true)
TranslateStreamCloseWebsocketRequests=true|false (ALPHA - default=false)
UnauthenticatedHTTP2DOSMitigation=true|false (BETA - default=true)
UnknownVersionInteroperabilityProxy=true|false (ALPHA - default=false)
UserNamespacesPodSecurityStandards=true|false (ALPHA - default=false)
UserNamespacesSupport=true|false (ALPHA - default=false)
ValidatingAdmissionPolicy=true|false (BETA - default=false)
VolumeAttributesClass=true|false (ALPHA - default=false)
VolumeCapacityPriority=true|false (ALPHA - default=false)
WatchList=true|false (ALPHA - default=false)
WinDSR=true|false (ALPHA - default=false)
WinOverlay=true|false (BETA - default=true)
WindowsHostNetwork=true|false (ALPHA - default=true)
ZeroLimitedNominalConcurrencyShares=true|false (BETA - default=false)
(DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--file-check-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 20s


Duration between checking config files for new data. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--hairpin-mode string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: promiscuous-bridge


How should the kubelet setup hairpin NAT. This allows endpoints of a Service to load balance back to themselves if they should try to access their own Service. Valid values are &quot;promiscuous-bridge&quot;, &quot;hairpin-veth&quot; and &quot;none&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--healthz-bind-address string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 127.0.0.1


The IP address for the healthz server to serve on (set to &quot;0.0.0.0&quot; or &quot;::&quot; for listening in all interfaces and IP families). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--healthz-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10248


The port of the localhost healthz endpoint (set to 0 to disable). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



-h, --help


help for kubelet



--hostname-override string


If non-empty, will use this string as identification instead of the actual hostname. If --cloud-provider is set, the cloud provider determines the name of the node (consult cloud provider documentation to determine if and how the hostname is used).



--http-check-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 20s


Duration between checking HTTP for new data. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--image-credential-provider-bin-dir string


The path to the directory where credential provider plugin binaries are located.



--image-credential-provider-config string


The path to the credential provider plugin config file.



--image-gc-high-threshold int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 85


The percent of disk usage after which image garbage collection is always run. Values must be within the range [0, 100], To disable image garbage collection, set to 100.   (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--image-gc-low-threshold int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 80


The percent of disk usage before which image garbage collection is never run. Lowest disk usage to garbage collect to. Values must be within the range [0, 100] and should not be larger than that of --image-gc-high-threshold. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--image-service-endpoint string


The endpoint of remote image service. If not specified, it will be the same with --container-runtime-endpoint by default. UNIX domain socket are supported on Linux, while `npipe` and `tcp` endpoints are supported on Windows. Examples: unix:///path/to/runtime.sock, npipe:////./pipe/runtime. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--keep-terminated-pod-volumes


Keep terminated pod volumes mounted to the node after the pod terminates. Can be useful for debugging volume related issues. (DEPRECATED: will be removed in a future version)



--kernel-memcg-notification


If enabled, the kubelet will integrate with the kernel memcg notification to determine if memory eviction thresholds are crossed rather than polling. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kube-api-burst int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 100


Burst to use while talking with kubernetes API server. The number must be >= 0. If 0 will use default burst (100). Doesn't cover events and node heartbeat apis which rate limiting is controlled by a different set of flags. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kube-api-content-type string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: application/vnd.kubernetes.protobuf


Content type of requests sent to apiserver. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kube-api-qps int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 50


QPS to use while talking with kubernetes API server. The number must be &gt;= 0. If 0 will use default QPS (50). Doesn't cover events and node heartbeat apis which rate limiting is controlled by a different set of flags. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kube-reserved strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: &lt;None&gt;


A set of &lt;resource name&gt;=&lt;resource quantity&gt; (e.g. &quot;cpu=200m,memory=500Mi,ephemeral-storage=1Gi,pid='100'&quot;) pairs that describe resources reserved for kubernetes system components. Currently cpu, memory and local ephemeral-storage for root file system are supported. See here for more detail. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kube-reserved-cgroup string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: ''


Absolute name of the top level cgroup that is used to manage kubernetes components for which compute resources were reserved via --kube-reserved flag. Ex. &quot;/kube-reserved&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--kubeconfig string


Path to a kubeconfig file, specifying how to connect to the API server. Providing --kubeconfig enables API server mode, omitting --kubeconfig enables standalone mode. 



--kubelet-cgroups string


Optional absolute name of cgroups to create and run the kubelet in. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--local-storage-capacity-isolation&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, local ephemeral storage isolation is enabled. Otherwise, local storage isolation feature will be disabled. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--lock-file string


&lt;Warning: Alpha feature&gt; The path to file for kubelet to use as a lock file.



--log-flush-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5s


Maximum number of seconds between log flushes.



--log-json-info-buffer-size string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: '0'


[Alpha] In JSON format with split output streams, the info messages can be buffered for a while to increase performance. The default value of zero bytes disables buffering. The size can be specified as number of bytes (512), multiples of 1000 (1K), multiples of 1024 (2Ki), or powers of those (3M, 4G, 5Mi, 6Gi). Enable the LoggingAlphaOptions feature gate to use this. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--log-json-split-stream


[Alpha] In JSON format, write error messages to stderr and info messages to stdout. The default is to write a single stream to stdout. Enable the LoggingAlphaOptions feature gate to use this. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--logging-format string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: text


Sets the log format. Permitted formats: &quot;json&quot; (gated by LoggingBetaOptions, &quot;text&quot;). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--make-iptables-util-chains&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, kubelet will ensure iptables utility rules are present on host. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--manifest-url string


URL for accessing additional Pod specifications to run. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--manifest-url-header strings


Comma-separated list of HTTP headers to use when accessing the URL provided to --manifest-url. Multiple headers with the same name will be added in the same order provided. This flag can be repeatedly invoked. For example: --manifest-url-header 'a:hello,b:again,c:world' --manifest-url-header 'b:beautiful' (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--max-open-files int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1000000


Number of files that can be opened by kubelet process. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--max-pods int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 110


Number of Pods that can run on this kubelet. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--maximum-dead-containers int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: -1


Maximum number of old instances of containers to retain globally. Each container takes up some disk space. To disable, set to a negative number. (DEPRECATED: Use --eviction-hard or --eviction-soft instead. Will be removed in a future version.)


 
--maximum-dead-containers-per-container int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1


Maximum number of old instances to retain per container.  Each container takes up some disk space. (DEPRECATED: Use --eviction-hard or --eviction-soft instead. Will be removed in a future version.)



--memory-manager-policy string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: None


Memory Manager policy to use. Possible values: &quot;None&quot;, &quot;Static&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--minimum-container-ttl-duration duration


Minimum age for a finished container before it is garbage collected. Examples: &quot;300ms&quot;, &quot;10s&quot; or &quot;2h45m&quot;. (DEPRECATED: Use --eviction-hard or --eviction-soft instead. Will be removed in a future version.)



--minimum-image-ttl-duration duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2m0s


Minimum age for an unused image before it is garbage collected. Examples: &quot;300ms&quot;, &quot;10s&quot; or &quot;2h45m&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--node-ip string


IP address (or comma-separated dual-stack IP addresses) of the node. If unset, kubelet will use the node's default IPv4 address, if any, or its default IPv6 address if it has no IPv4 addresses. You can pass &quot;::&quot; to make it prefer the default IPv6 address rather than the default IPv4 address.



--node-labels &lt;key=value pairs&gt;


&lt;Warning: Alpha feature&gt;Labels to add when registering the node in the cluster. Labels must be key=value pairs separated by ','. Labels in the 'kubernetes.io' namespace must begin with an allowed prefix ('kubelet.kubernetes.io', 'node.kubernetes.io') or be in the specifically allowed set ('beta.kubernetes.io/arch', 'beta.kubernetes.io/instance-type', 'beta.kubernetes.io/os', 'failure-domain.beta.kubernetes.io/region', 'failure-domain.beta.kubernetes.io/zone', 'kubernetes.io/arch', 'kubernetes.io/hostname', 'kubernetes.io/os', 'node.kubernetes.io/instance-type', 'topology.kubernetes.io/region', 'topology.kubernetes.io/zone')



--node-status-max-images int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 50


The maximum number of images to report in node.status.images. If -1 is specified, no cap will be applied. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--node-status-update-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10s


Specifies how often kubelet posts node status to master. Note: be cautious when changing the constant, it must work with nodeMonitorGracePeriod in Node controller. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--oom-score-adj int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: -999


The oom-score-adj value for kubelet process. Values must be within the range [-1000, 1000]. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--pod-cidr string


The CIDR to use for pod IP addresses, only used in standalone mode. In cluster mode, this is obtained from the master. For IPv6, the maximum number of IP's allocated is 65536 (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--pod-infra-container-image string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: registry.k8s.io/pause:3.9


Specified image will not be pruned by the image garbage collector. CRI implementations have their own configuration to set this image. (DEPRECATED: will be removed in 1.27. Image garbage collector will get sandbox image information from CRI.)



--pod-manifest-path string


Path to the directory containing static pod files to run, or the path to a single static pod file. Files starting with dots will be ignored. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--pod-max-pids int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: -1


Set the maximum number of processes per pod. If -1, the kubelet defaults to the node allocatable PID capacity. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--pods-per-core int32


Number of Pods per core that can run on this kubelet. The total number of pods on this kubelet cannot exceed --max-pods, so --max-pods will be used if this calculation results in a larger number of pods allowed on the kubelet. A value of 0 disables this limit. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10250


The port for the kubelet to serve on. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--protect-kernel-defaults


Default kubelet behaviour for kernel tuning. If set, kubelet errors if any of kernel tunables is different than kubelet defaults. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--provider-id string


Unique identifier for identifying the node in a machine database, i.e cloud provider.



--qos-reserved string


&lt;Warning: Alpha feature&gt; A set of &lt;resource name&gt;=&lt;percentage&gt; (e.g. &quot;memory=50%&quot;) pairs that describe how pod resource requests are reserved at the QoS level. Currently only memory is supported. Requires the QOSReserved feature gate to be enabled. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--read-only-port int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10255


The read-only port for the kubelet to serve on with no authentication/authorization (set to 0 to disable). (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--register-node&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Register the node with the API server. If --kubeconfig is not provided, this flag is irrelevant, as the kubelet won't have an API server to register with. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--register-schedulable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Register the node as schedulable. Won't have any effect if --register-node is false. (DEPRECATED: will be removed in a future version)
  


--register-with-taints string


Register the node with the given list of taints (comma separated &lt;key&gt;=&lt;value&gt;:&lt;effect&gt;). No-op if --register-node is false. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--registry-burst int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10


Maximum size of a bursty pulls, temporarily allows pulls to burst to this number, while still not exceeding --registry-qps. Only used if --registry-qps is greater than 0. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--registry-qps int32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5


If &gt; 0, limit registry pull QPS to this value.  If 0, unlimited. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--reserved-cpus string


A comma-separated list of CPUs or CPU ranges that are reserved for system and kubernetes usage. This specific list will supersede cpu counts in --system-reserved and --kube-reserved. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--reserved-memory string


A comma-separated list of memory reservations for NUMA nodes. (e.g. &quot;--reserved-memory 0:memory=1Gi,hugepages-1M=2Gi --reserved-memory 1:memory=2Gi&quot;). The total sum for each memory type should be equal to the sum of --kube-reserved, --system-reserved and --eviction-threshold. See here for more details. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--resolv-conf string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: /etc/resolv.conf


Resolver configuration file used as the basis for the container DNS resolution configuration. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--root-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: /var/lib/kubelet


Directory path for managing kubelet files (volume mounts, etc).



--rotate-certificates


Auto rotate the kubelet client certificates by requesting new certificates from the kube-apiserver when the certificate expiration approaches. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--rotate-server-certificates


Auto-request and rotate the kubelet serving certificates by requesting new certificates from the kube-apiserver when the certificate expiration approaches. Requires the RotateKubeletServerCertificate feature gate to be enabled, and approval of the submitted CertificateSigningRequest objects. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--runonce


If true, exit after spawning pods from local manifests or remote urls. Exclusive with --enable-server (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--runtime-cgroups string


Optional absolute name of cgroups to create and run the runtime in.



--runtime-request-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2m0s


Timeout of all runtime requests except long running request - pull, logs, exec and attach. When timeout exceeded, kubelet will cancel the request, throw out an error and retry later. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--seccomp-default


Enable the use of RuntimeDefault as the default seccomp profile for all workloads.



--serialize-image-pulls&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Pull images one at a time. We recommend *not* changing the default value on nodes that run docker daemon with version &lt; 1.9 or an aufs storage backend. Issue #10959 has more details. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--streaming-connection-idle-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 4h0m0s


Maximum time a streaming connection can be idle before the connection is automatically closed. 0 indicates no timeout. Example: 5m. Note: All connections to the kubelet server have a maximum duration of 4 hours.  (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--sync-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


Max period between synchronizing running containers and config. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--system-cgroups string


Optional absolute name of cgroups in which to place all non-kernel processes that are not already inside a cgroup under '/'. Empty for no container. Rolling back the flag requires a reboot. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--system-reserved string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: &lt;none&gt;


A set of &lt;resource name&gt;=&lt;resource quantity&gt; (e.g. &quot;cpu=200m,memory=500Mi,ephemeral-storage=1Gi,pid='100'&quot;) pairs that describe resources reserved for non-kubernetes components. Currently only cpu and memory and local ephemeral storage for root file system are supported. See here for more detail. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--system-reserved-cgroup string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: ''


Absolute name of the top level cgroup that is used to manage non-kubernetes components for which compute resources were reserved via --system-reserved flag. Ex. /system-reserved. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--tls-cert-file string


File containing x509 certificate used for serving HTTPS (with intermediate certs, if any, concatenated after server cert). If --tls-cert-file and --tls-private-key-file are not provided, a self-signed certificate and key are generated for the public address and saved to the directory passed to --cert-dir. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--tls-cipher-suites string


Comma-separated list of cipher suites for the server. If omitted, the default Go cipher suites will be used.
Preferred values:
TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384, TLS_CHACHA20_POLY1305_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305, TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305, TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_RSA_WITH_AES_128_GCM_SHA256, TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_256_GCM_SHA384
Insecure values:
TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_ECDSA_WITH_RC4_128_SHA, TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_RSA_WITH_RC4_128_SHA, TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256, TLS_RSA_WITH_RC4_128_SHA.
(DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--tls-min-version string


Minimum TLS version supported. Possible values: &quot;VersionTLS10&quot;, &quot;VersionTLS11&quot;, &quot;VersionTLS12&quot;, &quot;VersionTLS13&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--tls-private-key-file string


File containing x509 private key matching --tls-cert-file. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)




--topology-manager-policy string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 'none'


Topology Manager policy to use. Possible values: &quot;none&quot;, &quot;best-effort&quot;, &quot;restricted&quot;, &quot;single-numa-node&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--topology-manager-policy-options string


A set of &lt;key&gt;=&lt;value&gt; topology manager policy options to use, to fine tune their behaviour. If not supplied, keep the default behaviour. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--topology-manager-scope string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: container


Scope to which topology hints are applied. Topology manager collects hints from hint providers and applies them to the defined scope to ensure the pod admission. Possible values: &quot;container&quot;, &quot;pod&quot;. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



-v, --v Level


Number for the log level verbosity



--version version[=true]


Print version information and quit; --version=vX.Y.Z... sets the reported version.



--vmodule &lt;A list of 'pattern=N' strings&gt;


Comma-separated list of pattern=N settings for file-filtered logging (only works for text log format).



--volume-plugin-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: /usr/libexec/kubernetes/kubelet-plugins/volume/exec/


The full path of the directory in which to search for additional third party volume plugins. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)



--volume-stats-agg-period duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


Specifies interval for kubelet to calculate and cache the volume disk usage for all pods and volumes. To disable volume calculations, set to a negative number. (DEPRECATED: This parameter should be set via the config file specified by the kubelet's --config flag. See kubelet-config-file for more information.)


