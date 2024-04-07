---
title: kube-apiserver
content_type: tool-reference
weight: 30
auto_generated: true
---





## {{% heading "synopsis" %}}


The Kubernetes API server validates and configures data
for the api objects which include pods, services, replicationcontrollers, and
others. The API Server services REST operations and provides the frontend to the
cluster's shared state through which all other components interact.

```
kube-apiserver [flags]
```

## {{% heading "options" %}}

   







--admission-control-config-file string


File with admission control configuration.



--advertise-address string


The IP address on which to advertise the apiserver to members of the cluster. This address must be reachable by the rest of the cluster. If blank, the --bind-address will be used. If --bind-address is unspecified, the host's default interface will be used.



--aggregator-reject-forwarding-redirect&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Aggregator reject forwarding redirect response back to client.



--allow-metric-labels stringToString&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: []


The map from metric-label to value allow-list of this label. The key's format is &lt;MetricName&gt;,&lt;LabelName&gt;. The value's format is &lt;allowed_value&gt;,&lt;allowed_value&gt;...e.g. metric1,label1='v1,v2,v3', metric1,label2='v1,v2,v3' metric2,label1='v1,v2,v3'.



--allow-metric-labels-manifest string


The path to the manifest file that contains the allow-list mapping. The format of the file is the same as the flag --allow-metric-labels. Note that the flag --allow-metric-labels will override the manifest file.



--allow-privileged


If true, allow privileged containers. [default=false]



--anonymous-auth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enables anonymous requests to the secure port of the API server. Requests that are not rejected by another authentication method are treated as anonymous requests. Anonymous requests have a username of system:anonymous, and a group name of system:unauthenticated.



--api-audiences strings


Identifiers of the API. The service account token authenticator will validate that tokens used against the API are bound to at least one of these audiences. If the --service-account-issuer flag is configured and this flag is not, this field defaults to a single element list containing the issuer URL.



--audit-log-batch-buffer-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10000


The size of the buffer to store events before batching and writing. Only used in batch mode.



--audit-log-batch-max-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1


The maximum size of a batch. Only used in batch mode.



--audit-log-batch-max-wait duration


The amount of time to wait before force writing the batch that hadn't reached the max size. Only used in batch mode.



--audit-log-batch-throttle-burst int


Maximum number of requests sent at the same moment if ThrottleQPS was not utilized before. Only used in batch mode.



--audit-log-batch-throttle-enable


Whether batching throttling is enabled. Only used in batch mode.



--audit-log-batch-throttle-qps float


Maximum average number of batches per second. Only used in batch mode.



--audit-log-compress


If set, the rotated log files will be compressed using gzip.



--audit-log-format string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "json"


Format of saved audits. &quot;legacy&quot; indicates 1-line text format for each event. &quot;json&quot; indicates structured json format. Known formats are legacy,json.



--audit-log-maxage int


The maximum number of days to retain old audit log files based on the timestamp encoded in their filename.



--audit-log-maxbackup int


The maximum number of old audit log files to retain. Setting a value of 0 will mean there's no restriction on the number of files.



--audit-log-maxsize int


The maximum size in megabytes of the audit log file before it gets rotated.



--audit-log-mode string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "blocking"


Strategy for sending audit events. Blocking indicates sending events should block server responses. Batch causes the backend to buffer and write events asynchronously. Known modes are batch,blocking,blocking-strict.



--audit-log-path string


If set, all requests coming to the apiserver will be logged to this file.  '-' means standard out.



--audit-log-truncate-enabled


Whether event and batch truncating is enabled.



--audit-log-truncate-max-batch-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10485760


Maximum size of the batch sent to the underlying backend. Actual serialized size can be several hundreds of bytes greater. If a batch exceeds this limit, it is split into several batches of smaller size.



--audit-log-truncate-max-event-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 102400


Maximum size of the audit event sent to the underlying backend. If the size of an event is greater than this number, first request and response are removed, and if this doesn't reduce the size enough, event is discarded.



--audit-log-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "audit.k8s.io/v1"


API group and version used for serializing audit events written to log.



--audit-policy-file string


Path to the file that defines the audit policy configuration.



--audit-webhook-batch-buffer-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10000


The size of the buffer to store events before batching and writing. Only used in batch mode.



--audit-webhook-batch-max-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 400


The maximum size of a batch. Only used in batch mode.



--audit-webhook-batch-max-wait duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 30s


The amount of time to wait before force writing the batch that hadn't reached the max size. Only used in batch mode.



--audit-webhook-batch-throttle-burst int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 15


Maximum number of requests sent at the same moment if ThrottleQPS was not utilized before. Only used in batch mode.



--audit-webhook-batch-throttle-enable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Whether batching throttling is enabled. Only used in batch mode.



--audit-webhook-batch-throttle-qps float&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10


Maximum average number of batches per second. Only used in batch mode.



--audit-webhook-config-file string


Path to a kubeconfig formatted file that defines the audit webhook configuration.



--audit-webhook-initial-backoff duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10s


The amount of time to wait before retrying the first failed request.



--audit-webhook-mode string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "batch"


Strategy for sending audit events. Blocking indicates sending events should block server responses. Batch causes the backend to buffer and write events asynchronously. Known modes are batch,blocking,blocking-strict.



--audit-webhook-truncate-enabled


Whether event and batch truncating is enabled.



--audit-webhook-truncate-max-batch-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 10485760


Maximum size of the batch sent to the underlying backend. Actual serialized size can be several hundreds of bytes greater. If a batch exceeds this limit, it is split into several batches of smaller size.



--audit-webhook-truncate-max-event-size int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 102400


Maximum size of the audit event sent to the underlying backend. If the size of an event is greater than this number, first request and response are removed, and if this doesn't reduce the size enough, event is discarded.



--audit-webhook-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "audit.k8s.io/v1"


API group and version used for serializing audit events written to webhook.



--authentication-config string


File with Authentication Configuration to configure the JWT Token authenticator. Note: This feature is in Alpha since v1.29.--feature-gate=StructuredAuthenticationConfiguration=true needs to be set for enabling this feature.This feature is mutually exclusive with the oidc-* flags.



--authentication-token-webhook-cache-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2m0s


The duration to cache responses from the webhook token authenticator.



--authentication-token-webhook-config-file string


File with webhook configuration for token authentication in kubeconfig format. The API server will query the remote service to determine authentication for bearer tokens.



--authentication-token-webhook-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "v1beta1"


The API version of the authentication.k8s.io TokenReview to send to and expect from the webhook.



--authorization-config string


File with Authorization Configuration to configure the authorizer chain.Note: This feature is in Alpha since v1.29.--feature-gate=StructuredAuthorizationConfiguration=true feature flag needs to be set to true for enabling the functionality.This feature is mutually exclusive with the other --authorization-mode and --authorization-webhook-* flags.



--authorization-mode strings


Ordered list of plug-ins to do authorization on secure port. Defaults to AlwaysAllow if --authorization-config is not used. Comma-delimited list of: AlwaysAllow,AlwaysDeny,ABAC,Webhook,RBAC,Node.



--authorization-policy-file string


File with authorization policy in json line by line format, used with --authorization-mode=ABAC, on the secure port.



--authorization-webhook-cache-authorized-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5m0s


The duration to cache 'authorized' responses from the webhook authorizer.



--authorization-webhook-cache-unauthorized-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 30s


The duration to cache 'unauthorized' responses from the webhook authorizer.



--authorization-webhook-config-file string


File with webhook configuration in kubeconfig format, used with --authorization-mode=Webhook. The API server will query the remote service to determine access on the API server's secure port.



--authorization-webhook-version string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "v1beta1"


The API version of the authorization.k8s.io SubjectAccessReview to send to and expect from the webhook.



--azure-container-registry-config string


Path to the file containing Azure container registry configuration information.



--bind-address string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 0.0.0.0


The IP address on which to listen for the --secure-port port. The associated interface(s) must be reachable by the rest of the cluster, and by CLI/web clients. If blank or an unspecified address (0.0.0.0 or ::), all interfaces and IP address families will be used.



--cert-dir string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/var/run/kubernetes"


The directory where the TLS certs are located. If --tls-cert-file and --tls-private-key-file are provided, this flag will be ignored.



--client-ca-file string


If set, any request presenting a client certificate signed by one of the authorities in the client-ca-file is authenticated with an identity corresponding to the CommonName of the client certificate.



--cloud-provider-gce-l7lb-src-cidrs cidrs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 130.211.0.0/22,35.191.0.0/16


CIDRs opened in GCE firewall for L7 LB traffic proxy &amp; health checks



--contention-profiling


Enable block profiling, if profiling is enabled



--cors-allowed-origins strings


List of allowed origins for CORS, comma separated. An allowed origin can be a regular expression to support subdomain matching. If this list is empty CORS will not be enabled. Please ensure each expression matches the entire hostname by anchoring to the start with '^' or including the '//' prefix, and by anchoring to the end with '$' or including the ':' port separator suffix. Examples of valid expressions are '//example.com(:|$)' and '^https://example.com(:|$)'



--debug-socket-path string


Use an unprotected (no authn/authz) unix-domain socket for profiling with the given path



--default-not-ready-toleration-seconds int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 300


Indicates the tolerationSeconds of the toleration for notReady:NoExecute that is added by default to every pod that does not already have such a toleration.



--default-unreachable-toleration-seconds int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 300


Indicates the tolerationSeconds of the toleration for unreachable:NoExecute that is added by default to every pod that does not already have such a toleration.



--delete-collection-workers int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1


Number of workers spawned for DeleteCollection call. These are used to speed up namespace cleanup.



--disable-admission-plugins strings


admission plugins that should be disabled although they are in the default enabled plugins list (NamespaceLifecycle, LimitRanger, ServiceAccount, TaintNodesByCondition, PodSecurity, Priority, DefaultTolerationSeconds, DefaultStorageClass, StorageObjectInUseProtection, PersistentVolumeClaimResize, RuntimeClass, CertificateApproval, CertificateSigning, ClusterTrustBundleAttest, CertificateSubjectRestriction, DefaultIngressClass, MutatingAdmissionWebhook, ValidatingAdmissionPolicy, ValidatingAdmissionWebhook, ResourceQuota). Comma-delimited list of admission plugins: AlwaysAdmit, AlwaysDeny, AlwaysPullImages, CertificateApproval, CertificateSigning, CertificateSubjectRestriction, ClusterTrustBundleAttest, DefaultIngressClass, DefaultStorageClass, DefaultTolerationSeconds, DenyServiceExternalIPs, EventRateLimit, ExtendedResourceToleration, ImagePolicyWebhook, LimitPodHardAntiAffinityTopology, LimitRanger, MutatingAdmissionWebhook, NamespaceAutoProvision, NamespaceExists, NamespaceLifecycle, NodeRestriction, OwnerReferencesPermissionEnforcement, PersistentVolumeClaimResize, PersistentVolumeLabel, PodNodeSelector, PodSecurity, PodTolerationRestriction, Priority, ResourceQuota, RuntimeClass, SecurityContextDeny, ServiceAccount, StorageObjectInUseProtection, TaintNodesByCondition, ValidatingAdmissionPolicy, ValidatingAdmissionWebhook. The order of plugins in this flag does not matter.



--disabled-metrics strings


This flag provides an escape hatch for misbehaving metrics. You must provide the fully qualified metric name in order to disable it. Disclaimer: disabling metrics is higher in precedence than showing hidden metrics.



--egress-selector-config-file string


File with apiserver egress selector configuration.



--enable-admission-plugins strings


admission plugins that should be enabled in addition to default enabled ones (NamespaceLifecycle, LimitRanger, ServiceAccount, TaintNodesByCondition, PodSecurity, Priority, DefaultTolerationSeconds, DefaultStorageClass, StorageObjectInUseProtection, PersistentVolumeClaimResize, RuntimeClass, CertificateApproval, CertificateSigning, ClusterTrustBundleAttest, CertificateSubjectRestriction, DefaultIngressClass, MutatingAdmissionWebhook, ValidatingAdmissionPolicy, ValidatingAdmissionWebhook, ResourceQuota). Comma-delimited list of admission plugins: AlwaysAdmit, AlwaysDeny, AlwaysPullImages, CertificateApproval, CertificateSigning, CertificateSubjectRestriction, ClusterTrustBundleAttest, DefaultIngressClass, DefaultStorageClass, DefaultTolerationSeconds, DenyServiceExternalIPs, EventRateLimit, ExtendedResourceToleration, ImagePolicyWebhook, LimitPodHardAntiAffinityTopology, LimitRanger, MutatingAdmissionWebhook, NamespaceAutoProvision, NamespaceExists, NamespaceLifecycle, NodeRestriction, OwnerReferencesPermissionEnforcement, PersistentVolumeClaimResize, PersistentVolumeLabel, PodNodeSelector, PodSecurity, PodTolerationRestriction, Priority, ResourceQuota, RuntimeClass, SecurityContextDeny, ServiceAccount, StorageObjectInUseProtection, TaintNodesByCondition, ValidatingAdmissionPolicy, ValidatingAdmissionWebhook. The order of plugins in this flag does not matter.



--enable-aggregator-routing


Turns on aggregator routing requests to endpoints IP rather than cluster IP.



--enable-bootstrap-token-auth


Enable to allow secrets of type 'bootstrap.kubernetes.io/token' in the 'kube-system' namespace to be used for TLS bootstrapping authentication.



--enable-garbage-collector&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enables the generic garbage collector. MUST be synced with the corresponding flag of the kube-controller-manager.



--enable-priority-and-fairness&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, replace the max-in-flight handler with an enhanced one that queues and dispatches with priority and fairness



--encryption-provider-config string


The file containing configuration for encryption providers to be used for storing secrets in etcd



--encryption-provider-config-automatic-reload


Determines if the file set by --encryption-provider-config should be automatically reloaded if the disk contents change. Setting this to true disables the ability to uniquely identify distinct KMS plugins via the API server healthz endpoints.



--endpoint-reconciler-type string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "lease"


Use an endpoint reconciler (master-count, lease, none) master-count is deprecated, and will be removed in a future version.



--etcd-cafile string


SSL Certificate Authority file used to secure etcd communication.



--etcd-certfile string


SSL certification file used to secure etcd communication.



--etcd-compaction-interval duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5m0s


The interval of compaction requests. If 0, the compaction request from apiserver is disabled.



--etcd-count-metric-poll-period duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


Frequency of polling etcd for number of resources per type. 0 disables the metric collection.



--etcd-db-metric-poll-interval duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 30s


The interval of requests to poll etcd and update metric. 0 disables the metric collection



--etcd-healthcheck-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2s


The timeout to use when checking etcd health.



--etcd-keyfile string


SSL key file used to secure etcd communication.



--etcd-prefix string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "/registry"


The prefix to prepend to all resource paths in etcd.



--etcd-readycheck-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 2s


The timeout to use when checking etcd readiness



--etcd-servers strings


List of etcd servers to connect with (scheme://ip:port), comma separated.



--etcd-servers-overrides strings


Per-resource etcd servers overrides, comma separated. The individual override format: group/resource#servers, where servers are URLs, semicolon separated. Note that this applies only to resources compiled into this server binary.



--event-ttl duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1h0m0s


Amount of time to retain events.



--external-hostname string


The hostname to use when generating externalized URLs for this master (e.g. Swagger API Docs or OpenID Discovery).



--feature-gates &lt;comma-separated 'key=True|False' pairs&gt;


A set of key=value pairs that describe feature gates for alpha/experimental features. Options are:APIResponseCompression=true|false (BETA - default=true)APIServerIdentity=true|false (BETA - default=true)APIServerTracing=true|false (BETA - default=true)AdmissionWebhookMatchConditions=true|false (BETA - default=true)AggregatedDiscoveryEndpoint=true|false (BETA - default=true)AllAlpha=true|false (ALPHA - default=false)AllBeta=true|false (BETA - default=false)AnyVolumeDataSource=true|false (BETA - default=true)AppArmor=true|false (BETA - default=true)CPUManagerPolicyAlphaOptions=true|false (ALPHA - default=false)CPUManagerPolicyBetaOptions=true|false (BETA - default=true)CPUManagerPolicyOptions=true|false (BETA - default=true)CRDValidationRatcheting=true|false (ALPHA - default=false)CSIMigrationPortworx=true|false (BETA - default=false)CSIVolumeHealth=true|false (ALPHA - default=false)CloudControllerManagerWebhook=true|false (ALPHA - default=false)CloudDualStackNodeIPs=true|false (BETA - default=true)ClusterTrustBundle=true|false (ALPHA - default=false)ClusterTrustBundleProjection=true|false (ALPHA - default=false)ComponentSLIs=true|false (BETA - default=true)ConsistentListFromCache=true|false (ALPHA - default=false)ContainerCheckpoint=true|false (ALPHA - default=false)ContextualLogging=true|false (ALPHA - default=false)CronJobsScheduledAnnotation=true|false (BETA - default=true)CrossNamespaceVolumeDataSource=true|false (ALPHA - default=false)CustomCPUCFSQuotaPeriod=true|false (ALPHA - default=false)DevicePluginCDIDevices=true|false (BETA - default=true)DisableCloudProviders=true|false (BETA - default=true)DisableKubeletCloudCredentialProviders=true|false (BETA - default=true)DisableNodeKubeProxyVersion=true|false (ALPHA - default=false)DynamicResourceAllocation=true|false (ALPHA - default=false)ElasticIndexedJob=true|false (BETA - default=true)EventedPLEG=true|false (BETA - default=false)GracefulNodeShutdown=true|false (BETA - default=true)GracefulNodeShutdownBasedOnPodPriority=true|false (BETA - default=true)HPAContainerMetrics=true|false (BETA - default=true)HPAScaleToZero=true|false (ALPHA - default=false)HonorPVReclaimPolicy=true|false (ALPHA - default=false)ImageMaximumGCAge=true|false (ALPHA - default=false)InPlacePodVerticalScaling=true|false (ALPHA - default=false)InTreePluginAWSUnregister=true|false (ALPHA - default=false)InTreePluginAzureDiskUnregister=true|false (ALPHA - default=false)InTreePluginAzureFileUnregister=true|false (ALPHA - default=false)InTreePluginGCEUnregister=true|false (ALPHA - default=false)InTreePluginOpenStackUnregister=true|false (ALPHA - default=false)InTreePluginPortworxUnregister=true|false (ALPHA - default=false)InTreePluginvSphereUnregister=true|false (ALPHA - default=false)JobBackoffLimitPerIndex=true|false (BETA - default=true)JobPodFailurePolicy=true|false (BETA - default=true)JobPodReplacementPolicy=true|false (BETA - default=true)KubeProxyDrainingTerminatingNodes=true|false (ALPHA - default=false)KubeletCgroupDriverFromCRI=true|false (ALPHA - default=false)KubeletInUserNamespace=true|false (ALPHA - default=false)KubeletPodResourcesDynamicResources=true|false (ALPHA - default=false)KubeletPodResourcesGet=true|false (ALPHA - default=false)KubeletSeparateDiskGC=true|false (ALPHA - default=false)KubeletTracing=true|false (BETA - default=true)LegacyServiceAccountTokenCleanUp=true|false (BETA - default=true)LoadBalancerIPMode=true|false (ALPHA - default=false)LocalStorageCapacityIsolationFSQuotaMonitoring=true|false (ALPHA - default=false)LogarithmicScaleDown=true|false (BETA - default=true)LoggingAlphaOptions=true|false (ALPHA - default=false)LoggingBetaOptions=true|false (BETA - default=true)MatchLabelKeysInPodAffinity=true|false (ALPHA - default=false)MatchLabelKeysInPodTopologySpread=true|false (BETA - default=true)MaxUnavailableStatefulSet=true|false (ALPHA - default=false)MemoryManager=true|false (BETA - default=true)MemoryQoS=true|false (ALPHA - default=false)MinDomainsInPodTopologySpread=true|false (BETA - default=true)MultiCIDRServiceAllocator=true|false (ALPHA - default=false)NFTablesProxyMode=true|false (ALPHA - default=false)NewVolumeManagerReconstruction=true|false (BETA - default=true)NodeInclusionPolicyInPodTopologySpread=true|false (BETA - default=true)NodeLogQuery=true|false (ALPHA - default=false)NodeSwap=true|false (BETA - default=false)OpenAPIEnums=true|false (BETA - default=true)PDBUnhealthyPodEvictionPolicy=true|false (BETA - default=true)PersistentVolumeLastPhaseTransitionTime=true|false (BETA - default=true)PodAndContainerStatsFromCRI=true|false (ALPHA - default=false)PodDeletionCost=true|false (BETA - default=true)PodDisruptionConditions=true|false (BETA - default=true)PodHostIPs=true|false (BETA - default=true)PodIndexLabel=true|false (BETA - default=true)PodLifecycleSleepAction=true|false (ALPHA - default=false)PodReadyToStartContainersCondition=true|false (BETA - default=true)PodSchedulingReadiness=true|false (BETA - default=true)ProcMountType=true|false (ALPHA - default=false)QOSReserved=true|false (ALPHA - default=false)RecoverVolumeExpansionFailure=true|false (ALPHA - default=false)RotateKubeletServerCertificate=true|false (BETA - default=true)RuntimeClassInImageCriApi=true|false (ALPHA - default=false)SELinuxMountReadWriteOncePod=true|false (BETA - default=true)SchedulerQueueingHints=true|false (BETA - default=false)SecurityContextDeny=true|false (ALPHA - default=false)SeparateTaintEvictionController=true|false (BETA - default=true)ServiceAccountTokenJTI=true|false (ALPHA - default=false)ServiceAccountTokenNodeBinding=true|false (ALPHA - default=false)ServiceAccountTokenNodeBindingValidation=true|false (ALPHA - default=false)ServiceAccountTokenPodNodeInfo=true|false (ALPHA - default=false)SidecarContainers=true|false (BETA - default=true)SizeMemoryBackedVolumes=true|false (BETA - default=true)StableLoadBalancerNodeSet=true|false (BETA - default=true)StatefulSetAutoDeletePVC=true|false (BETA - default=true)StatefulSetStartOrdinal=true|false (BETA - default=true)StorageVersionAPI=true|false (ALPHA - default=false)StorageVersionHash=true|false (BETA - default=true)StructuredAuthenticationConfiguration=true|false (ALPHA - default=false)StructuredAuthorizationConfiguration=true|false (ALPHA - default=false)TopologyAwareHints=true|false (BETA - default=true)TopologyManagerPolicyAlphaOptions=true|false (ALPHA - default=false)TopologyManagerPolicyBetaOptions=true|false (BETA - default=true)TopologyManagerPolicyOptions=true|false (BETA - default=true)TranslateStreamCloseWebsocketRequests=true|false (ALPHA - default=false)UnauthenticatedHTTP2DOSMitigation=true|false (BETA - default=true)UnknownVersionInteroperabilityProxy=true|false (ALPHA - default=false)UserNamespacesPodSecurityStandards=true|false (ALPHA - default=false)UserNamespacesSupport=true|false (ALPHA - default=false)ValidatingAdmissionPolicy=true|false (BETA - default=false)VolumeAttributesClass=true|false (ALPHA - default=false)VolumeCapacityPriority=true|false (ALPHA - default=false)WatchList=true|false (ALPHA - default=false)WinDSR=true|false (ALPHA - default=false)WinOverlay=true|false (BETA - default=true)WindowsHostNetwork=true|false (ALPHA - default=true)ZeroLimitedNominalConcurrencyShares=true|false (BETA - default=false)



--goaway-chance float


To prevent HTTP/2 clients from getting stuck on a single apiserver, randomly close a connection (GOAWAY). The client's other in-flight requests won't be affected, and the client will reconnect, likely landing on a different apiserver after going through the load balancer again. This argument sets the fraction of requests that will be sent a GOAWAY. Clusters with single apiservers, or which don't use a load balancer, should NOT enable this. Min is 0 (off), Max is .02 (1/50 requests); .001 (1/1000) is a recommended starting point.



-h, --help


help for kube-apiserver



--http2-max-streams-per-connection int


The limit that the server gives to clients for the maximum number of streams in an HTTP/2 connection. Zero means to use golang's default.



--kubelet-certificate-authority string


Path to a cert file for the certificate authority.



--kubelet-client-certificate string


Path to a client cert file for TLS.



--kubelet-client-key string


Path to a client key file for TLS.



--kubelet-preferred-address-types strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "Hostname,InternalDNS,InternalIP,ExternalDNS,ExternalIP"


List of the preferred NodeAddressTypes to use for kubelet connections.



--kubelet-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5s


Timeout for kubelet operations.



--kubernetes-service-node-port int


If non-zero, the Kubernetes master service (which apiserver creates/maintains) will be of type NodePort, using this as the value of the port. If zero, the Kubernetes master service will be of type ClusterIP.



--lease-reuse-duration-seconds int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 60


The time in seconds that each lease is reused. A lower value could avoid large number of objects reusing the same lease. Notice that a too small value may cause performance problems at storage layer.



--livez-grace-period duration


This option represents the maximum amount of time it should take for apiserver to complete its startup sequence and become live. From apiserver's start time to when this amount of time has elapsed, /livez will assume that unfinished post-start hooks will complete successfully and therefore return true.



--log-flush-frequency duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 5s


Maximum number of seconds between log flushes



--logging-format string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "text"


Sets the log format. Permitted formats: &quot;text&quot;.



--max-connection-bytes-per-sec int


If non-zero, throttle each user connection to this number of bytes/sec. Currently only applies to long-running requests.



--max-mutating-requests-inflight int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 200


This and --max-requests-inflight are summed to determine the server's total concurrency limit (which must be positive) if --enable-priority-and-fairness is true. Otherwise, this flag limits the maximum number of mutating requests in flight, or a zero value disables the limit completely.



--max-requests-inflight int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 400


This and --max-mutating-requests-inflight are summed to determine the server's total concurrency limit (which must be positive) if --enable-priority-and-fairness is true. Otherwise, this flag limits the maximum number of non-mutating requests in flight, or a zero value disables the limit completely.



--min-request-timeout int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1800


An optional field indicating the minimum number of seconds a handler must keep a request open before timing it out. Currently only honored by the watch request handler, which picks a randomized value above this number as the connection timeout, to spread out load.



--oidc-ca-file string


If set, the OpenID server's certificate will be verified by one of the authorities in the oidc-ca-file, otherwise the host's root CA set will be used.



--oidc-client-id string


The client ID for the OpenID Connect client, must be set if oidc-issuer-url is set.



--oidc-groups-claim string


If provided, the name of a custom OpenID Connect claim for specifying user groups. The claim value is expected to be a string or array of strings. This flag is experimental, please see the authentication documentation for further details.



--oidc-groups-prefix string


If provided, all groups will be prefixed with this value to prevent conflicts with other authentication strategies.



--oidc-issuer-url string


The URL of the OpenID issuer, only HTTPS scheme will be accepted. If set, it will be used to verify the OIDC JSON Web Token (JWT).



--oidc-required-claim &lt;comma-separated 'key=value' pairs&gt;


A key=value pair that describes a required claim in the ID Token. If set, the claim is verified to be present in the ID Token with a matching value. Repeat this flag to specify multiple claims.



--oidc-signing-algs strings&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "RS256"


Comma-separated list of allowed JOSE asymmetric signing algorithms. JWTs with a supported 'alg' header values are: RS256, RS384, RS512, ES256, ES384, ES512, PS256, PS384, PS512. Values are defined by RFC 7518 https://tools.ietf.org/html/rfc7518#section-3.1.



--oidc-username-claim string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "sub"


The OpenID claim to use as the user name. Note that claims other than the default ('sub') is not guaranteed to be unique and immutable. This flag is experimental, please see the authentication documentation for further details.



--oidc-username-prefix string


If provided, all usernames will be prefixed with this value. If not provided, username claims other than 'email' are prefixed by the issuer URL to avoid clashes. To skip any prefixing, provide the value '-'.



--peer-advertise-ip string


If set and the UnknownVersionInteroperabilityProxy feature gate is enabled, this IP will be used by peer kube-apiservers to proxy requests to this kube-apiserver when the request cannot be handled by the peer due to version skew between the kube-apiservers. This flag is only used in clusters configured with multiple kube-apiservers for high availability.



--peer-advertise-port string


If set and the UnknownVersionInteroperabilityProxy feature gate is enabled, this port will be used by peer kube-apiservers to proxy requests to this kube-apiserver when the request cannot be handled by the peer due to version skew between the kube-apiservers. This flag is only used in clusters configured with multiple kube-apiservers for high availability.



--peer-ca-file string


If set and the UnknownVersionInteroperabilityProxy feature gate is enabled, this file will be used to verify serving certificates of peer kube-apiservers. This flag is only used in clusters configured with multiple kube-apiservers for high availability.



--permit-address-sharing


If true, SO_REUSEADDR will be used when binding the port. This allows binding to wildcard IPs like 0.0.0.0 and specific IPs in parallel, and it avoids waiting for the kernel to release sockets in TIME_WAIT state. [default=false]



--permit-port-sharing


If true, SO_REUSEPORT will be used when binding the port, which allows more than one instance to bind on the same address and port. [default=false]



--profiling&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enable profiling via web interface host:port/debug/pprof/



--proxy-client-cert-file string


Client certificate used to prove the identity of the aggregator or kube-apiserver when it must call out during a request. This includes proxying requests to a user api-server and calling out to webhook admission plugins. It is expected that this cert includes a signature from the CA in the --requestheader-client-ca-file flag. That CA is published in the 'extension-apiserver-authentication' configmap in the kube-system namespace. Components receiving calls from kube-aggregator should use that CA to perform their half of the mutual TLS verification.



--proxy-client-key-file string


Private key for the client certificate used to prove the identity of the aggregator or kube-apiserver when it must call out during a request. This includes proxying requests to a user api-server and calling out to webhook admission plugins.



--request-timeout duration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 1m0s


An optional field indicating the duration a handler must keep a request open before timing it out. This is the default request timeout for requests but may be overridden by flags such as --min-request-timeout for specific types of requests.



--requestheader-allowed-names strings


List of client certificate common names to allow to provide usernames in headers specified by --requestheader-username-headers. If empty, any client certificate validated by the authorities in --requestheader-client-ca-file is allowed.



--requestheader-client-ca-file string


Root certificate bundle to use to verify client certificates on incoming requests before trusting usernames in headers specified by --requestheader-username-headers. WARNING: generally do not depend on authorization being already done for incoming requests.



--requestheader-extra-headers-prefix strings


List of request header prefixes to inspect. X-Remote-Extra- is suggested.



--requestheader-group-headers strings


List of request headers to inspect for groups. X-Remote-Group is suggested.



--requestheader-username-headers strings


List of request headers to inspect for usernames. X-Remote-User is common.



--runtime-config &lt;comma-separated 'key=value' pairs&gt;


A set of key=value pairs that enable or disable built-in APIs. Supported options are:v1=true|false for the core API group&lt;group&gt;/&lt;version&gt;=true|false for a specific API group and version (e.g. apps/v1=true)api/all=true|false controls all API versionsapi/ga=true|false controls all API versions of the form v[0-9]+api/beta=true|false controls all API versions of the form v[0-9]+beta[0-9]+api/alpha=true|false controls all API versions of the form v[0-9]+alpha[0-9]+api/legacy is deprecated, and will be removed in a future version



--secure-port int&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 6443


The port on which to serve HTTPS with authentication and authorization. It cannot be switched off with 0.



--service-account-extend-token-expiration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Turns on projected service account expiration extension during token generation, which helps safe transition from legacy token to bound service account token feature. If this flag is enabled, admission injected tokens would be extended up to 1 year to prevent unexpected failure during transition, ignoring value of service-account-max-token-expiration.



--service-account-issuer strings


Identifier of the service account token issuer. The issuer will assert this identifier in &quot;iss&quot; claim of issued tokens. This value is a string or URI. If this option is not a valid URI per the OpenID Discovery 1.0 spec, the ServiceAccountIssuerDiscovery feature will remain disabled, even if the feature gate is set to true. It is highly recommended that this value comply with the OpenID spec: https://openid.net/specs/openid-connect-discovery-1_0.html. In practice, this means that service-account-issuer must be an https URL. It is also highly recommended that this URL be capable of serving OpenID discovery documents at {service-account-issuer}/.well-known/openid-configuration. When this flag is specified multiple times, the first is used to generate tokens and all are used to determine which issuers are accepted.



--service-account-jwks-uri string


Overrides the URI for the JSON Web Key Set in the discovery doc served at /.well-known/openid-configuration. This flag is useful if the discovery docand key set are served to relying parties from a URL other than the API server's external (as auto-detected or overridden with external-hostname).



--service-account-key-file strings


File containing PEM-encoded x509 RSA or ECDSA private or public keys, used to verify ServiceAccount tokens. The specified file can contain multiple keys, and the flag can be specified multiple times with different files. If unspecified, --tls-private-key-file is used. Must be specified when --service-account-signing-key-file is provided



--service-account-lookup&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


If true, validate ServiceAccount tokens exist in etcd as part of authentication.



--service-account-max-token-expiration duration


The maximum validity duration of a token created by the service account token issuer. If an otherwise valid TokenRequest with a validity duration larger than this value is requested, a token will be issued with a validity duration of this value.



--service-account-signing-key-file string


Path to the file that contains the current private key of the service account token issuer. The issuer will sign issued ID tokens with this private key.



--service-cluster-ip-range string


A CIDR notation IP range from which to assign service cluster IPs. This must not overlap with any IP ranges assigned to nodes or pods. Max of two dual-stack CIDRs is allowed.



--service-node-port-range &lt;a string in the form 'N1-N2'&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: 30000-32767


A port range to reserve for services with NodePort visibility.  This must not overlap with the ephemeral port range on nodes.  Example: '30000-32767'. Inclusive at both ends of the range.



--show-hidden-metrics-for-version string


The previous version for which you want to show hidden metrics. Only the previous minor version is meaningful, other values will not be allowed. The format is &lt;major&gt;.&lt;minor&gt;, e.g.: '1.16'. The purpose of this format is make sure you have the opportunity to notice if the next release hides additional metrics, rather than being surprised when they are permanently removed in the release after that.



--shutdown-delay-duration duration


Time to delay the termination. During that time the server keeps serving requests normally. The endpoints /healthz and /livez will return success, but /readyz immediately returns failure. Graceful termination starts after this delay has elapsed. This can be used to allow load balancer to stop sending traffic to this server.



--shutdown-send-retry-after


If true the HTTP Server will continue listening until all non long running request(s) in flight have been drained, during this window all incoming requests will be rejected with a status code 429 and a 'Retry-After' response header, in addition 'Connection: close' response header is set in order to tear down the TCP connection when idle.



--shutdown-watch-termination-grace-period duration


This option, if set, represents the maximum amount of grace period the apiserver will wait for active watch request(s) to drain during the graceful server shutdown window.



--storage-backend string


The storage backend for persistence. Options: 'etcd3' (default).



--storage-media-type string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: "application/vnd.kubernetes.protobuf"


The media type to use to store objects in storage. Some resources or storage backends may only support a specific media type and will ignore this setting. Supported media types: [application/json, application/yaml, application/vnd.kubernetes.protobuf]



--strict-transport-security-directives strings


List of directives for HSTS, comma separated. If this list is empty, then HSTS directives will not be added. Example: 'max-age=31536000,includeSubDomains,preload'



--tls-cert-file string


File containing the default x509 Certificate for HTTPS. (CA cert, if any, concatenated after server cert). If HTTPS serving is enabled, and --tls-cert-file and --tls-private-key-file are not provided, a self-signed certificate and key are generated for the public address and saved to the directory specified by --cert-dir.



--tls-cipher-suites strings


Comma-separated list of cipher suites for the server. If omitted, the default Go cipher suites will be used.Preferred values: TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384, TLS_CHACHA20_POLY1305_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305, TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305, TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_RSA_WITH_AES_128_GCM_SHA256, TLS_RSA_WITH_AES_256_CBC_SHA, TLS_RSA_WITH_AES_256_GCM_SHA384.Insecure values: TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_ECDSA_WITH_RC4_128_SHA, TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, TLS_ECDHE_RSA_WITH_RC4_128_SHA, TLS_RSA_WITH_3DES_EDE_CBC_SHA, TLS_RSA_WITH_AES_128_CBC_SHA256, TLS_RSA_WITH_RC4_128_SHA.



--tls-min-version string


Minimum TLS version supported. Possible values: VersionTLS10, VersionTLS11, VersionTLS12, VersionTLS13



--tls-private-key-file string


File containing the default x509 private key matching --tls-cert-file.



--tls-sni-cert-key string


A pair of x509 certificate and private key file paths, optionally suffixed with a list of domain patterns which are fully qualified domain names, possibly with prefixed wildcard segments. The domain patterns also allow IP addresses, but IPs should only be used if the apiserver has visibility to the IP address requested by a client. If no domain patterns are provided, the names of the certificate are extracted. Non-wildcard matches trump over wildcard matches, explicit domain patterns trump over extracted names. For multiple key/certificate pairs, use the --tls-sni-cert-key multiple times. Examples: &quot;example.crt,example.key&quot; or &quot;foo.crt,foo.key:*.foo.com,foo.com&quot;.



--token-auth-file string


If set, the file that will be used to secure the secure port of the API server via token authentication.



--tracing-config-file string


File with apiserver tracing configuration.



-v, --v int


number for the log level verbosity



--version version[=true]


--version, --version=raw prints version information and quits; --version=vX.Y.Z... sets the reported version



--vmodule pattern=N,...


comma-separated list of pattern=N settings for file-filtered logging (only works for text log format)



--watch-cache&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default: true


Enable watch caching in the apiserver



--watch-cache-sizes strings


Watch cache size settings for some resources (pods, nodes, etc.), comma separated. The individual setting format: resource[.group]#size, where resource is lowercase plural (no version), group is omitted for resources of apiVersion v1 (the legacy core API) and included for others, and size is a number. This option is only meaningful for resources built into the apiserver, not ones defined by CRDs or aggregated from external servers, and is only consulted if the watch-cache is enabled. The only meaningful size setting to supply here is zero, which means to disable watch caching for the associated resource; all non-zero values are equivalent and mean to not disable watch caching for that resource







