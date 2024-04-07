---
title: kube-controller-manager Configuration (v1alpha1)
content_type: tool-reference
package: kubecontrollermanager.config.k8s.io/v1alpha1
auto_generated: true
---


## Resource Types 


- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)
- [LeaderMigrationConfiguration](#controllermanager-config-k8s-io-v1alpha1-LeaderMigrationConfiguration)
- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)
  
    
    

## `NodeControllerConfiguration`     {#NodeControllerConfiguration}
    

**Appears in:**

- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)


NodeControllerConfiguration contains elements describing NodeController.



FieldDescription

    
  
ConcurrentNodeSyncs [Required]
int32


   ConcurrentNodeSyncs is the number of workers
concurrently synchronizing nodes





## `ServiceControllerConfiguration`     {#ServiceControllerConfiguration}
    

**Appears in:**

- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


ServiceControllerConfiguration contains elements describing ServiceController.



FieldDescription

    
  
ConcurrentServiceSyncs [Required]
int32


   concurrentServiceSyncs is the number of services that are
allowed to sync concurrently. Larger number = more responsive service
management, but more CPU (and network) load.




  

## `CloudControllerManagerConfiguration`     {#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration}
    


CloudControllerManagerConfiguration contains elements describing cloud-controller manager.



FieldDescription

    
apiVersionstringcloudcontrollermanager.config.k8s.io/v1alpha1
kindstringCloudControllerManagerConfiguration
    
  
Generic [Required]
GenericControllerManagerConfiguration


   Generic holds configuration for a generic controller-manager


KubeCloudShared [Required]
KubeCloudSharedConfiguration


   KubeCloudSharedConfiguration holds configuration for shared related features
both in cloud controller manager and kube-controller manager.


NodeController [Required]
NodeControllerConfiguration


   NodeController holds configuration for node controller
related features.


ServiceController [Required]
ServiceControllerConfiguration


   ServiceControllerConfiguration holds configuration for ServiceController
related features.


NodeStatusUpdateFrequency [Required]
meta/v1.Duration


   NodeStatusUpdateFrequency is the frequency at which the controller updates nodes' status


Webhook [Required]
WebhookConfiguration


   Webhook is the configuration for cloud-controller-manager hosted webhooks





## `CloudProviderConfiguration`     {#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudProviderConfiguration}
    

**Appears in:**

- [KubeCloudSharedConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-KubeCloudSharedConfiguration)


CloudProviderConfiguration contains basically elements about cloud provider.



FieldDescription

    
  
Name [Required]
string


   Name is the provider for cloud services.


CloudConfigFile [Required]
string


   cloudConfigFile is the path to the cloud provider configuration file.





## `KubeCloudSharedConfiguration`     {#cloudcontrollermanager-config-k8s-io-v1alpha1-KubeCloudSharedConfiguration}
    

**Appears in:**

- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


KubeCloudSharedConfiguration contains elements shared by both kube-controller manager
and cloud-controller manager, but not genericconfig.



FieldDescription

    
  
CloudProvider [Required]
CloudProviderConfiguration


   CloudProviderConfiguration holds configuration for CloudProvider related features.


ExternalCloudVolumePlugin [Required]
string


   externalCloudVolumePlugin specifies the plugin to use when cloudProvider is &quot;external&quot;.
It is currently used by the in repo cloud providers to handle node and volume control in the KCM.


UseServiceAccountCredentials [Required]
bool


   useServiceAccountCredentials indicates whether controllers should be run with
individual service account credentials.


AllowUntaggedCloud [Required]
bool


   run with untagged cloud instances


RouteReconciliationPeriod [Required]
meta/v1.Duration


   routeReconciliationPeriod is the period for reconciling routes created for Nodes by cloud provider..


NodeMonitorPeriod [Required]
meta/v1.Duration


   nodeMonitorPeriod is the period for syncing NodeStatus in NodeController.


ClusterName [Required]
string


   clusterName is the instance prefix for the cluster.


ClusterCIDR [Required]
string


   clusterCIDR is CIDR Range for Pods in cluster.


AllocateNodeCIDRs [Required]
bool


   AllocateNodeCIDRs enables CIDRs for Pods to be allocated and, if
ConfigureCloudRoutes is true, to be set on the cloud provider.


CIDRAllocatorType [Required]
string


   CIDRAllocatorType determines what kind of pod CIDR allocator will be used.


ConfigureCloudRoutes [Required]
bool


   configureCloudRoutes enables CIDRs allocated with allocateNodeCIDRs
to be configured on the cloud provider.


NodeSyncPeriod [Required]
meta/v1.Duration


   nodeSyncPeriod is the period for syncing nodes from cloudprovider. Longer
periods will result in fewer calls to cloud provider, but may delay addition
of new nodes to cluster.





## `WebhookConfiguration`     {#cloudcontrollermanager-config-k8s-io-v1alpha1-WebhookConfiguration}
    

**Appears in:**

- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)


WebhookConfiguration contains configuration related to
cloud-controller-manager hosted webhooks



FieldDescription

    
  
Webhooks [Required]
[]string


   Webhooks is the list of webhooks to enable or disable
'*' means &quot;all enabled by default webhooks&quot;
'foo' means &quot;enable 'foo'&quot;
'-foo' means &quot;disable 'foo'&quot;
first item for a particular name wins




  
  

## `LeaderMigrationConfiguration`     {#controllermanager-config-k8s-io-v1alpha1-LeaderMigrationConfiguration}
    

**Appears in:**

- [GenericControllerManagerConfiguration](#controllermanager-config-k8s-io-v1alpha1-GenericControllerManagerConfiguration)


LeaderMigrationConfiguration provides versioned configuration for all migrating leader locks.



FieldDescription

    
apiVersionstringcontrollermanager.config.k8s.io/v1alpha1
kindstringLeaderMigrationConfiguration
    
  
leaderName [Required]
string


   LeaderName is the name of the leader election resource that protects the migration
E.g. 1-20-KCM-to-1-21-CCM


resourceLock [Required]
string


   ResourceLock indicates the resource object type that will be used to lock
Should be &quot;leases&quot; or &quot;endpoints&quot;


controllerLeaders [Required]
[]ControllerLeaderConfiguration


   ControllerLeaders contains a list of migrating leader lock configurations





## `ControllerLeaderConfiguration`     {#controllermanager-config-k8s-io-v1alpha1-ControllerLeaderConfiguration}
    

**Appears in:**

- [LeaderMigrationConfiguration](#controllermanager-config-k8s-io-v1alpha1-LeaderMigrationConfiguration)


ControllerLeaderConfiguration provides the configuration for a migrating leader lock.



FieldDescription

    
  
name [Required]
string


   Name is the name of the controller being migrated
E.g. service-controller, route-controller, cloud-node-controller, etc


component [Required]
string


   Component is the name of the component in which the controller should be running.
E.g. kube-controller-manager, cloud-controller-manager, etc
Or '*' meaning the controller can be run under any component that participates in the migration





## `GenericControllerManagerConfiguration`     {#controllermanager-config-k8s-io-v1alpha1-GenericControllerManagerConfiguration}
    

**Appears in:**

- [CloudControllerManagerConfiguration](#cloudcontrollermanager-config-k8s-io-v1alpha1-CloudControllerManagerConfiguration)

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


GenericControllerManagerConfiguration holds configuration for a generic controller-manager.



FieldDescription

    
  
Port [Required]
int32


   port is the port that the controller-manager's http service runs on.


Address [Required]
string


   address is the IP address to serve on (set to 0.0.0.0 for all interfaces).


MinResyncPeriod [Required]
meta/v1.Duration


   minResyncPeriod is the resync period in reflectors; will be random between
minResyncPeriod and 2*minResyncPeriod.


ClientConnection [Required]
ClientConnectionConfiguration


   ClientConnection specifies the kubeconfig file and client connection
settings for the proxy server to use when communicating with the apiserver.


ControllerStartInterval [Required]
meta/v1.Duration


   How long to wait between starting controller managers


LeaderElection [Required]
LeaderElectionConfiguration


   leaderElection defines the configuration of leader election client.


Controllers [Required]
[]string


   Controllers is the list of controllers to enable or disable
'*' means &quot;all enabled by default controllers&quot;
'foo' means &quot;enable 'foo'&quot;
'-foo' means &quot;disable 'foo'&quot;
first item for a particular name wins


Debugging [Required]
DebuggingConfiguration


   DebuggingConfiguration holds configuration for Debugging related features.


LeaderMigrationEnabled [Required]
bool


   LeaderMigrationEnabled indicates whether Leader Migration should be enabled for the controller manager.


LeaderMigration [Required]
LeaderMigrationConfiguration


   LeaderMigration holds the configuration for Leader Migration.




  
  

## `KubeControllerManagerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration}
    


KubeControllerManagerConfiguration contains elements describing kube-controller manager.



FieldDescription

    
apiVersionstringkubecontrollermanager.config.k8s.io/v1alpha1
kindstringKubeControllerManagerConfiguration
    
  
Generic [Required]
GenericControllerManagerConfiguration


   Generic holds configuration for a generic controller-manager


KubeCloudShared [Required]
KubeCloudSharedConfiguration


   KubeCloudSharedConfiguration holds configuration for shared related features
both in cloud controller manager and kube-controller manager.


AttachDetachController [Required]
AttachDetachControllerConfiguration


   AttachDetachControllerConfiguration holds configuration for
AttachDetachController related features.


CSRSigningController [Required]
CSRSigningControllerConfiguration


   CSRSigningControllerConfiguration holds configuration for
CSRSigningController related features.


DaemonSetController [Required]
DaemonSetControllerConfiguration


   DaemonSetControllerConfiguration holds configuration for DaemonSetController
related features.


DeploymentController [Required]
DeploymentControllerConfiguration


   DeploymentControllerConfiguration holds configuration for
DeploymentController related features.


StatefulSetController [Required]
StatefulSetControllerConfiguration


   StatefulSetControllerConfiguration holds configuration for
StatefulSetController related features.


DeprecatedController [Required]
DeprecatedControllerConfiguration


   DeprecatedControllerConfiguration holds configuration for some deprecated
features.


EndpointController [Required]
EndpointControllerConfiguration


   EndpointControllerConfiguration holds configuration for EndpointController
related features.


EndpointSliceController [Required]
EndpointSliceControllerConfiguration


   EndpointSliceControllerConfiguration holds configuration for
EndpointSliceController related features.


EndpointSliceMirroringController [Required]
EndpointSliceMirroringControllerConfiguration


   EndpointSliceMirroringControllerConfiguration holds configuration for
EndpointSliceMirroringController related features.


EphemeralVolumeController [Required]
EphemeralVolumeControllerConfiguration


   EphemeralVolumeControllerConfiguration holds configuration for EphemeralVolumeController
related features.


GarbageCollectorController [Required]
GarbageCollectorControllerConfiguration


   GarbageCollectorControllerConfiguration holds configuration for
GarbageCollectorController related features.


HPAController [Required]
HPAControllerConfiguration


   HPAControllerConfiguration holds configuration for HPAController related features.


JobController [Required]
JobControllerConfiguration


   JobControllerConfiguration holds configuration for JobController related features.


CronJobController [Required]
CronJobControllerConfiguration


   CronJobControllerConfiguration holds configuration for CronJobController related features.


LegacySATokenCleaner [Required]
LegacySATokenCleanerConfiguration


   LegacySATokenCleanerConfiguration holds configuration for LegacySATokenCleaner related features.


NamespaceController [Required]
NamespaceControllerConfiguration


   NamespaceControllerConfiguration holds configuration for NamespaceController
related features.


NodeIPAMController [Required]
NodeIPAMControllerConfiguration


   NodeIPAMControllerConfiguration holds configuration for NodeIPAMController
related features.


NodeLifecycleController [Required]
NodeLifecycleControllerConfiguration


   NodeLifecycleControllerConfiguration holds configuration for
NodeLifecycleController related features.


PersistentVolumeBinderController [Required]
PersistentVolumeBinderControllerConfiguration


   PersistentVolumeBinderControllerConfiguration holds configuration for
PersistentVolumeBinderController related features.


PodGCController [Required]
PodGCControllerConfiguration


   PodGCControllerConfiguration holds configuration for PodGCController
related features.


ReplicaSetController [Required]
ReplicaSetControllerConfiguration


   ReplicaSetControllerConfiguration holds configuration for ReplicaSet related features.


ReplicationController [Required]
ReplicationControllerConfiguration


   ReplicationControllerConfiguration holds configuration for
ReplicationController related features.


ResourceQuotaController [Required]
ResourceQuotaControllerConfiguration


   ResourceQuotaControllerConfiguration holds configuration for
ResourceQuotaController related features.


SAController [Required]
SAControllerConfiguration


   SAControllerConfiguration holds configuration for ServiceAccountController
related features.


ServiceController [Required]
ServiceControllerConfiguration


   ServiceControllerConfiguration holds configuration for ServiceController
related features.


TTLAfterFinishedController [Required]
TTLAfterFinishedControllerConfiguration


   TTLAfterFinishedControllerConfiguration holds configuration for
TTLAfterFinishedController related features.


ValidatingAdmissionPolicyStatusController [Required]
ValidatingAdmissionPolicyStatusControllerConfiguration


   ValidatingAdmissionPolicyStatusControllerConfiguration holds configuration for
ValidatingAdmissionPolicyStatusController related features.





## `AttachDetachControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-AttachDetachControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


AttachDetachControllerConfiguration contains elements describing AttachDetachController.



FieldDescription

    
  
DisableAttachDetachReconcilerSync [Required]
bool


   Reconciler runs a periodic loop to reconcile the desired state of the with
the actual state of the world by triggering attach detach operations.
This flag enables or disables reconcile.  Is false by default, and thus enabled.


ReconcilerSyncLoopPeriod [Required]
meta/v1.Duration


   ReconcilerSyncLoopPeriod is the amount of time the reconciler sync states loop
wait between successive executions. Is set to 5 sec by default.





## `CSRSigningConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-CSRSigningConfiguration}
    

**Appears in:**

- [CSRSigningControllerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-CSRSigningControllerConfiguration)


CSRSigningConfiguration holds information about a particular CSR signer



FieldDescription

    
  
CertFile [Required]
string


   certFile is the filename containing a PEM-encoded
X509 CA certificate used to issue certificates


KeyFile [Required]
string


   keyFile is the filename containing a PEM-encoded
RSA or ECDSA private key used to issue certificates





## `CSRSigningControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-CSRSigningControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


CSRSigningControllerConfiguration contains elements describing CSRSigningController.



FieldDescription

    
  
ClusterSigningCertFile [Required]
string


   clusterSigningCertFile is the filename containing a PEM-encoded
X509 CA certificate used to issue cluster-scoped certificates


ClusterSigningKeyFile [Required]
string


   clusterSigningCertFile is the filename containing a PEM-encoded
RSA or ECDSA private key used to issue cluster-scoped certificates


KubeletServingSignerConfiguration [Required]
CSRSigningConfiguration


   kubeletServingSignerConfiguration holds the certificate and key used to issue certificates for the kubernetes.io/kubelet-serving signer


KubeletClientSignerConfiguration [Required]
CSRSigningConfiguration


   kubeletClientSignerConfiguration holds the certificate and key used to issue certificates for the kubernetes.io/kube-apiserver-client-kubelet


KubeAPIServerClientSignerConfiguration [Required]
CSRSigningConfiguration


   kubeAPIServerClientSignerConfiguration holds the certificate and key used to issue certificates for the kubernetes.io/kube-apiserver-client


LegacyUnknownSignerConfiguration [Required]
CSRSigningConfiguration


   legacyUnknownSignerConfiguration holds the certificate and key used to issue certificates for the kubernetes.io/legacy-unknown


ClusterSigningDuration [Required]
meta/v1.Duration


   clusterSigningDuration is the max length of duration signed certificates will be given.
Individual CSRs may request shorter certs by setting spec.expirationSeconds.





## `CronJobControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-CronJobControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


CronJobControllerConfiguration contains elements describing CrongJob2Controller.



FieldDescription

    
  
ConcurrentCronJobSyncs [Required]
int32


   concurrentCronJobSyncs is the number of job objects that are
allowed to sync concurrently. Larger number = more responsive jobs,
but more CPU (and network) load.





## `DaemonSetControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-DaemonSetControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


DaemonSetControllerConfiguration contains elements describing DaemonSetController.



FieldDescription

    
  
ConcurrentDaemonSetSyncs [Required]
int32


   concurrentDaemonSetSyncs is the number of daemonset objects that are
allowed to sync concurrently. Larger number = more responsive daemonset,
but more CPU (and network) load.





## `DeploymentControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-DeploymentControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


DeploymentControllerConfiguration contains elements describing DeploymentController.



FieldDescription

    
  
ConcurrentDeploymentSyncs [Required]
int32


   concurrentDeploymentSyncs is the number of deployment objects that are
allowed to sync concurrently. Larger number = more responsive deployments,
but more CPU (and network) load.





## `DeprecatedControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-DeprecatedControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


DeprecatedControllerConfiguration contains elements be deprecated.




## `EndpointControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-EndpointControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


EndpointControllerConfiguration contains elements describing EndpointController.



FieldDescription

    
  
ConcurrentEndpointSyncs [Required]
int32


   concurrentEndpointSyncs is the number of endpoint syncing operations
that will be done concurrently. Larger number = faster endpoint updating,
but more CPU (and network) load.


EndpointUpdatesBatchPeriod [Required]
meta/v1.Duration


   EndpointUpdatesBatchPeriod describes the length of endpoint updates batching period.
Processing of pod changes will be delayed by this duration to join them with potential
upcoming updates and reduce the overall number of endpoints updates.





## `EndpointSliceControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-EndpointSliceControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


EndpointSliceControllerConfiguration contains elements describing
EndpointSliceController.



FieldDescription

    
  
ConcurrentServiceEndpointSyncs [Required]
int32


   concurrentServiceEndpointSyncs is the number of service endpoint syncing
operations that will be done concurrently. Larger number = faster
endpoint slice updating, but more CPU (and network) load.


MaxEndpointsPerSlice [Required]
int32


   maxEndpointsPerSlice is the maximum number of endpoints that will be
added to an EndpointSlice. More endpoints per slice will result in fewer
and larger endpoint slices, but larger resources.


EndpointUpdatesBatchPeriod [Required]
meta/v1.Duration


   EndpointUpdatesBatchPeriod describes the length of endpoint updates batching period.
Processing of pod changes will be delayed by this duration to join them with potential
upcoming updates and reduce the overall number of endpoints updates.





## `EndpointSliceMirroringControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-EndpointSliceMirroringControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


EndpointSliceMirroringControllerConfiguration contains elements describing
EndpointSliceMirroringController.



FieldDescription

    
  
MirroringConcurrentServiceEndpointSyncs [Required]
int32


   mirroringConcurrentServiceEndpointSyncs is the number of service endpoint
syncing operations that will be done concurrently. Larger number = faster
endpoint slice updating, but more CPU (and network) load.


MirroringMaxEndpointsPerSubset [Required]
int32


   mirroringMaxEndpointsPerSubset is the maximum number of endpoints that
will be mirrored to an EndpointSlice for an EndpointSubset.


MirroringEndpointUpdatesBatchPeriod [Required]
meta/v1.Duration


   mirroringEndpointUpdatesBatchPeriod can be used to batch EndpointSlice
updates. All updates triggered by EndpointSlice changes will be delayed
by up to 'mirroringEndpointUpdatesBatchPeriod'. If other addresses in the
same Endpoints resource change in that period, they will be batched to a
single EndpointSlice update. Default 0 value means that each Endpoints
update triggers an EndpointSlice update.





## `EphemeralVolumeControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-EphemeralVolumeControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


EphemeralVolumeControllerConfiguration contains elements describing EphemeralVolumeController.



FieldDescription

    
  
ConcurrentEphemeralVolumeSyncs [Required]
int32


   ConcurrentEphemeralVolumeSyncseSyncs is the number of ephemeral volume syncing operations
that will be done concurrently. Larger number = faster ephemeral volume updating,
but more CPU (and network) load.





## `GarbageCollectorControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-GarbageCollectorControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


GarbageCollectorControllerConfiguration contains elements describing GarbageCollectorController.



FieldDescription

    
  
EnableGarbageCollector [Required]
bool


   enables the generic garbage collector. MUST be synced with the
corresponding flag of the kube-apiserver. WARNING: the generic garbage
collector is an alpha feature.


ConcurrentGCSyncs [Required]
int32


   concurrentGCSyncs is the number of garbage collector workers that are
allowed to sync concurrently.


GCIgnoredResources [Required]
[]GroupResource


   gcIgnoredResources is the list of GroupResources that garbage collection should ignore.





## `GroupResource`     {#kubecontrollermanager-config-k8s-io-v1alpha1-GroupResource}
    

**Appears in:**

- [GarbageCollectorControllerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-GarbageCollectorControllerConfiguration)


GroupResource describes an group resource.



FieldDescription

    
  
Group [Required]
string


   group is the group portion of the GroupResource.


Resource [Required]
string


   resource is the resource portion of the GroupResource.





## `HPAControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-HPAControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


HPAControllerConfiguration contains elements describing HPAController.



FieldDescription

    
  
ConcurrentHorizontalPodAutoscalerSyncs [Required]
int32


   ConcurrentHorizontalPodAutoscalerSyncs is the number of HPA objects that are allowed to sync concurrently.
Larger number = more responsive HPA processing, but more CPU (and network) load.


HorizontalPodAutoscalerSyncPeriod [Required]
meta/v1.Duration


   HorizontalPodAutoscalerSyncPeriod is the period for syncing the number of
pods in horizontal pod autoscaler.


HorizontalPodAutoscalerUpscaleForbiddenWindow [Required]
meta/v1.Duration


   HorizontalPodAutoscalerUpscaleForbiddenWindow is a period after which next upscale allowed.


HorizontalPodAutoscalerDownscaleStabilizationWindow [Required]
meta/v1.Duration


   HorizontalPodAutoscalerDowncaleStabilizationWindow is a period for which autoscaler will look
backwards and not scale down below any recommendation it made during that period.


HorizontalPodAutoscalerDownscaleForbiddenWindow [Required]
meta/v1.Duration


   HorizontalPodAutoscalerDownscaleForbiddenWindow is a period after which next downscale allowed.


HorizontalPodAutoscalerTolerance [Required]
float64


   HorizontalPodAutoscalerTolerance is the tolerance for when
resource usage suggests upscaling/downscaling


HorizontalPodAutoscalerCPUInitializationPeriod [Required]
meta/v1.Duration


   HorizontalPodAutoscalerCPUInitializationPeriod is the period after pod start when CPU samples
might be skipped.


HorizontalPodAutoscalerInitialReadinessDelay [Required]
meta/v1.Duration


   HorizontalPodAutoscalerInitialReadinessDelay is period after pod start during which readiness
changes are treated as readiness being set for the first time. The only effect of this is that
HPA will disregard CPU samples from unready pods that had last readiness change during that
period.





## `JobControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-JobControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


JobControllerConfiguration contains elements describing JobController.



FieldDescription

    
  
ConcurrentJobSyncs [Required]
int32


   concurrentJobSyncs is the number of job objects that are
allowed to sync concurrently. Larger number = more responsive jobs,
but more CPU (and network) load.





## `LegacySATokenCleanerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-LegacySATokenCleanerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


LegacySATokenCleanerConfiguration contains elements describing LegacySATokenCleaner



FieldDescription

    
  
CleanUpPeriod [Required]
meta/v1.Duration


   CleanUpPeriod is the period of time since the last usage of an
auto-generated service account token before it can be deleted.





## `NamespaceControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-NamespaceControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


NamespaceControllerConfiguration contains elements describing NamespaceController.



FieldDescription

    
  
NamespaceSyncPeriod [Required]
meta/v1.Duration


   namespaceSyncPeriod is the period for syncing namespace life-cycle
updates.


ConcurrentNamespaceSyncs [Required]
int32


   concurrentNamespaceSyncs is the number of namespace objects that are
allowed to sync concurrently.





## `NodeIPAMControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-NodeIPAMControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


NodeIPAMControllerConfiguration contains elements describing NodeIpamController.



FieldDescription

    
  
ServiceCIDR [Required]
string


   serviceCIDR is CIDR Range for Services in cluster.


SecondaryServiceCIDR [Required]
string


   secondaryServiceCIDR is CIDR Range for Services in cluster. This is used in dual stack clusters. SecondaryServiceCIDR must be of different IP family than ServiceCIDR


NodeCIDRMaskSize [Required]
int32


   NodeCIDRMaskSize is the mask size for node cidr in cluster.


NodeCIDRMaskSizeIPv4 [Required]
int32


   NodeCIDRMaskSizeIPv4 is the mask size for node cidr in dual-stack cluster.


NodeCIDRMaskSizeIPv6 [Required]
int32


   NodeCIDRMaskSizeIPv6 is the mask size for node cidr in dual-stack cluster.





## `NodeLifecycleControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-NodeLifecycleControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


NodeLifecycleControllerConfiguration contains elements describing NodeLifecycleController.



FieldDescription

    
  
NodeEvictionRate [Required]
float32


   nodeEvictionRate is the number of nodes per second on which pods are deleted in case of node failure when a zone is healthy


SecondaryNodeEvictionRate [Required]
float32


   secondaryNodeEvictionRate is the number of nodes per second on which pods are deleted in case of node failure when a zone is unhealthy


NodeStartupGracePeriod [Required]
meta/v1.Duration


   nodeStartupGracePeriod is the amount of time which we allow starting a node to
be unresponsive before marking it unhealthy.


NodeMonitorGracePeriod [Required]
meta/v1.Duration


   nodeMontiorGracePeriod is the amount of time which we allow a running node to be
unresponsive before marking it unhealthy. Must be N times more than kubelet's
nodeStatusUpdateFrequency, where N means number of retries allowed for kubelet
to post node status.


PodEvictionTimeout [Required]
meta/v1.Duration


   podEvictionTimeout is the grace period for deleting pods on failed nodes.


LargeClusterSizeThreshold [Required]
int32


   secondaryNodeEvictionRate is implicitly overridden to 0 for clusters smaller than or equal to largeClusterSizeThreshold


UnhealthyZoneThreshold [Required]
float32


   Zone is treated as unhealthy in nodeEvictionRate and secondaryNodeEvictionRate when at least
unhealthyZoneThreshold (no less than 3) of Nodes in the zone are NotReady





## `PersistentVolumeBinderControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-PersistentVolumeBinderControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


PersistentVolumeBinderControllerConfiguration contains elements describing
PersistentVolumeBinderController.



FieldDescription

    
  
PVClaimBinderSyncPeriod [Required]
meta/v1.Duration


   pvClaimBinderSyncPeriod is the period for syncing persistent volumes
and persistent volume claims.


VolumeConfiguration [Required]
VolumeConfiguration


   volumeConfiguration holds configuration for volume related features.


VolumeHostCIDRDenylist [Required]
[]string


   DEPRECATED: VolumeHostCIDRDenylist is a list of CIDRs that should not be reachable by the
controller from plugins.


VolumeHostAllowLocalLoopback [Required]
bool


   DEPRECATED: VolumeHostAllowLocalLoopback indicates if local loopback hosts (127.0.0.1, etc)
should be allowed from plugins.





## `PersistentVolumeRecyclerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-PersistentVolumeRecyclerConfiguration}
    

**Appears in:**

- [VolumeConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-VolumeConfiguration)


PersistentVolumeRecyclerConfiguration contains elements describing persistent volume plugins.



FieldDescription

    
  
MaximumRetry [Required]
int32


   maximumRetry is number of retries the PV recycler will execute on failure to recycle
PV.


MinimumTimeoutNFS [Required]
int32


   minimumTimeoutNFS is the minimum ActiveDeadlineSeconds to use for an NFS Recycler
pod.


PodTemplateFilePathNFS [Required]
string


   podTemplateFilePathNFS is the file path to a pod definition used as a template for
NFS persistent volume recycling


IncrementTimeoutNFS [Required]
int32


   incrementTimeoutNFS is the increment of time added per Gi to ActiveDeadlineSeconds
for an NFS scrubber pod.


PodTemplateFilePathHostPath [Required]
string


   podTemplateFilePathHostPath is the file path to a pod definition used as a template for
HostPath persistent volume recycling. This is for development and testing only and
will not work in a multi-node cluster.


MinimumTimeoutHostPath [Required]
int32


   minimumTimeoutHostPath is the minimum ActiveDeadlineSeconds to use for a HostPath
Recycler pod.  This is for development and testing only and will not work in a multi-node
cluster.


IncrementTimeoutHostPath [Required]
int32


   incrementTimeoutHostPath is the increment of time added per Gi to ActiveDeadlineSeconds
for a HostPath scrubber pod.  This is for development and testing only and will not work
in a multi-node cluster.





## `PodGCControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-PodGCControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


PodGCControllerConfiguration contains elements describing PodGCController.



FieldDescription

    
  
TerminatedPodGCThreshold [Required]
int32


   terminatedPodGCThreshold is the number of terminated pods that can exist
before the terminated pod garbage collector starts deleting terminated pods.
If &lt;= 0, the terminated pod garbage collector is disabled.





## `ReplicaSetControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-ReplicaSetControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


ReplicaSetControllerConfiguration contains elements describing ReplicaSetController.



FieldDescription

    
  
ConcurrentRSSyncs [Required]
int32


   concurrentRSSyncs is the number of replica sets that are  allowed to sync
concurrently. Larger number = more responsive replica  management, but more
CPU (and network) load.





## `ReplicationControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-ReplicationControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


ReplicationControllerConfiguration contains elements describing ReplicationController.



FieldDescription

    
  
ConcurrentRCSyncs [Required]
int32


   concurrentRCSyncs is the number of replication controllers that are
allowed to sync concurrently. Larger number = more responsive replica
management, but more CPU (and network) load.





## `ResourceQuotaControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-ResourceQuotaControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


ResourceQuotaControllerConfiguration contains elements describing ResourceQuotaController.



FieldDescription

    
  
ResourceQuotaSyncPeriod [Required]
meta/v1.Duration


   resourceQuotaSyncPeriod is the period for syncing quota usage status
in the system.


ConcurrentResourceQuotaSyncs [Required]
int32


   concurrentResourceQuotaSyncs is the number of resource quotas that are
allowed to sync concurrently. Larger number = more responsive quota
management, but more CPU (and network) load.





## `SAControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-SAControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


SAControllerConfiguration contains elements describing ServiceAccountController.



FieldDescription

    
  
ServiceAccountKeyFile [Required]
string


   serviceAccountKeyFile is the filename containing a PEM-encoded private RSA key
used to sign service account tokens.


ConcurrentSATokenSyncs [Required]
int32


   concurrentSATokenSyncs is the number of service account token syncing operations
that will be done concurrently.


RootCAFile [Required]
string


   rootCAFile is the root certificate authority will be included in service
account's token secret. This must be a valid PEM-encoded CA bundle.





## `StatefulSetControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-StatefulSetControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


StatefulSetControllerConfiguration contains elements describing StatefulSetController.



FieldDescription

    
  
ConcurrentStatefulSetSyncs [Required]
int32


   concurrentStatefulSetSyncs is the number of statefulset objects that are
allowed to sync concurrently. Larger number = more responsive statefulsets,
but more CPU (and network) load.





## `TTLAfterFinishedControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-TTLAfterFinishedControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


TTLAfterFinishedControllerConfiguration contains elements describing TTLAfterFinishedController.



FieldDescription

    
  
ConcurrentTTLSyncs [Required]
int32


   concurrentTTLSyncs is the number of TTL-after-finished collector workers that are
allowed to sync concurrently.





## `ValidatingAdmissionPolicyStatusControllerConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-ValidatingAdmissionPolicyStatusControllerConfiguration}
    

**Appears in:**

- [KubeControllerManagerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-KubeControllerManagerConfiguration)


ValidatingAdmissionPolicyStatusControllerConfiguration contains elements describing ValidatingAdmissionPolicyStatusController.



FieldDescription

    
  
ConcurrentPolicySyncs [Required]
int32


   ConcurrentPolicySyncs is the number of policy objects that are
allowed to sync concurrently. Larger number = quicker type checking,
but more CPU (and network) load.
The default value is 5.





## `VolumeConfiguration`     {#kubecontrollermanager-config-k8s-io-v1alpha1-VolumeConfiguration}
    

**Appears in:**

- [PersistentVolumeBinderControllerConfiguration](#kubecontrollermanager-config-k8s-io-v1alpha1-PersistentVolumeBinderControllerConfiguration)


VolumeConfiguration contains all enumerated flags meant to configure all volume
plugins. From this config, the controller-manager binary will create many instances of
volume.VolumeConfig, each containing only the configuration needed for that plugin which
are then passed to the appropriate plugin. The ControllerManager binary is the only part
of the code which knows what plugins are supported and which flags correspond to each plugin.



FieldDescription

    
  
EnableHostPathProvisioning [Required]
bool


   enableHostPathProvisioning enables HostPath PV provisioning when running without a
cloud provider. This allows testing and development of provisioning features. HostPath
provisioning is not supported in any way, won't work in a multi-node cluster, and
should not be used for anything other than testing or development.


EnableDynamicProvisioning [Required]
bool


   enableDynamicProvisioning enables the provisioning of volumes when running within an environment
that supports dynamic provisioning. Defaults to true.


PersistentVolumeRecyclerConfiguration [Required]
PersistentVolumeRecyclerConfiguration


   persistentVolumeRecyclerConfiguration holds configuration for persistent volume plugins.


FlexVolumePluginDir [Required]
string


   volumePluginDir is the full path of the directory in which the flex
volume plugin should search for additional third party volume plugins




  