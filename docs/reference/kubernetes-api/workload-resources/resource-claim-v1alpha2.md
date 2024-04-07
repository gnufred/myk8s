---
api_metadata:
  apiVersion: "resource.k8s.io/v1alpha2"
  import: "k8s.io/api/resource/v1alpha2"
  kind: "ResourceClaim"
content_type: "api_reference"
description: "ResourceClaim describes which resources are needed by a resource consumer."
title: "ResourceClaim v1alpha2"
weight: 15
auto_generated: true
---



`apiVersion: resource.k8s.io/v1alpha2`

`import "k8s.io/api/resource/v1alpha2"`


## ResourceClaim {#ResourceClaim}

ResourceClaim describes which resources are needed by a resource consumer. Its status tracks whether the resource has been allocated and what the resulting attributes are.

This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClaim


- **metadata** (}}">ObjectMeta)

  Standard object metadata

- **spec** (}}">ResourceClaimSpec), required

  Spec describes the desired attributes of a resource that then needs to be allocated. It can only be set once when creating the ResourceClaim.

- **status** (}}">ResourceClaimStatus)

  Status describes whether the resource is available and with which attributes.





## ResourceClaimSpec {#ResourceClaimSpec}

ResourceClaimSpec defines how a resource is to be allocated.



- **resourceClassName** (string), required

  ResourceClassName references the driver and additional parameters via the name of a ResourceClass that was created as part of the driver deployment.

- **allocationMode** (string)

  Allocation can start immediately or when a Pod wants to use the resource. "WaitForFirstConsumer" is the default.

- **parametersRef** (ResourceClaimParametersReference)

  ParametersRef references a separate object with arbitrary parameters that will be used by the driver when allocating a resource for the claim.
  
  The object must be in the same namespace as the ResourceClaim.

  
  *ResourceClaimParametersReference contains enough information to let you locate the parameters for a ResourceClaim. The object must be in the same namespace as the ResourceClaim.*

  - **parametersRef.kind** (string), required

    Kind is the type of resource being referenced. This is the same value as in the parameter object's metadata, for example "ConfigMap".

  - **parametersRef.name** (string), required

    Name is the name of resource being referenced.

  - **parametersRef.apiGroup** (string)

    APIGroup is the group for the resource being referenced. It is empty for the core API. This matches the group in the APIVersion that is used when creating the resources.





## ResourceClaimStatus {#ResourceClaimStatus}

ResourceClaimStatus tracks whether the resource has been allocated and what the resulting attributes are.



- **allocation** (AllocationResult)

  Allocation is set by the resource driver once a resource or set of resources has been allocated successfully. If this is not specified, the resources have not been allocated yet.

  
  *AllocationResult contains attributes of an allocated resource.*

  - **allocation.availableOnNodes** (NodeSelector)

    This field will get set by the resource driver after it has allocated the resource to inform the scheduler where it can schedule Pods using the ResourceClaim.
    
    Setting this field is optional. If null, the resource is available everywhere.

    
    *A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.*

    - **allocation.availableOnNodes.nodeSelectorTerms** ([]NodeSelectorTerm), required

      Required. A list of node selector terms. The terms are ORed.

      
      *A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.*

      - **allocation.availableOnNodes.nodeSelectorTerms.matchExpressions** ([]}}">NodeSelectorRequirement)

        A list of node selector requirements by node's labels.

      - **allocation.availableOnNodes.nodeSelectorTerms.matchFields** ([]}}">NodeSelectorRequirement)

        A list of node selector requirements by node's fields.

  - **allocation.resourceHandles** ([]ResourceHandle)

    *Atomic: will be replaced during a merge*
    
    ResourceHandles contain the state associated with an allocation that should be maintained throughout the lifetime of a claim. Each ResourceHandle contains data that should be passed to a specific kubelet plugin once it lands on a node. This data is returned by the driver after a successful allocation and is opaque to Kubernetes. Driver documentation may explain to users how to interpret this data if needed.
    
    Setting this field is optional. It has a maximum size of 32 entries. If null (or empty), it is assumed this allocation will be processed by a single kubelet plugin with no ResourceHandle data attached. The name of the kubelet plugin invoked will match the DriverName set in the ResourceClaimStatus this AllocationResult is embedded in.

    
    *ResourceHandle holds opaque resource data for processing by a specific kubelet plugin.*

    - **allocation.resourceHandles.data** (string)

      Data contains the opaque data associated with this ResourceHandle. It is set by the controller component of the resource driver whose name matches the DriverName set in the ResourceClaimStatus this ResourceHandle is embedded in. It is set at allocation time and is intended for processing by the kubelet plugin whose name matches the DriverName set in this ResourceHandle.
      
      The maximum size of this field is 16KiB. This may get increased in the future, but not reduced.

    - **allocation.resourceHandles.driverName** (string)

      DriverName specifies the name of the resource driver whose kubelet plugin should be invoked to process this ResourceHandle's data once it lands on a node. This may differ from the DriverName set in ResourceClaimStatus this ResourceHandle is embedded in.

  - **allocation.shareable** (boolean)

    Shareable determines whether the resource supports more than one consumer at a time.

- **deallocationRequested** (boolean)

  DeallocationRequested indicates that a ResourceClaim is to be deallocated.
  
  The driver then must deallocate this claim and reset the field together with clearing the Allocation field.
  
  While DeallocationRequested is set, no new consumers may be added to ReservedFor.

- **driverName** (string)

  DriverName is a copy of the driver name from the ResourceClass at the time when allocation started.

- **reservedFor** ([]ResourceClaimConsumerReference)

  *Map: unique values on key uid will be kept during a merge*
  
  ReservedFor indicates which entities are currently allowed to use the claim. A Pod which references a ResourceClaim which is not reserved for that Pod will not be started.
  
  There can be at most 32 such reservations. This may get increased in the future, but not reduced.

  
  *ResourceClaimConsumerReference contains enough information to let you locate the consumer of a ResourceClaim. The user must be a resource in the same namespace as the ResourceClaim.*

  - **reservedFor.name** (string), required

    Name is the name of resource being referenced.

  - **reservedFor.resource** (string), required

    Resource is the type of resource being referenced, for example "pods".

  - **reservedFor.uid** (string), required

    UID identifies exactly one incarnation of the resource.

  - **reservedFor.apiGroup** (string)

    APIGroup is the group for the resource being referenced. It is empty for the core API. This matches the group in the APIVersion that is used when creating the resources.





## ResourceClaimList {#ResourceClaimList}

ResourceClaimList is a collection of claims.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClaimList


- **metadata** (}}">ListMeta)

  Standard list metadata

- **items** ([]}}">ResourceClaim), required

  Items is the list of resource claims.





## Operations {#Operations}










### `get` read the specified ResourceClaim

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

401: Unauthorized


### `get` read status of the specified ResourceClaim

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

401: Unauthorized


### `list` list or watch objects of kind ResourceClaim

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **allowWatchBookmarks** (*in query*): boolean

  }}">allowWatchBookmarks


- **continue** (*in query*): string

  }}">continue


- **fieldSelector** (*in query*): string

  }}">fieldSelector


- **labelSelector** (*in query*): string

  }}">labelSelector


- **limit** (*in query*): integer

  }}">limit


- **pretty** (*in query*): string

  }}">pretty


- **resourceVersion** (*in query*): string

  }}">resourceVersion


- **resourceVersionMatch** (*in query*): string

  }}">resourceVersionMatch


- **sendInitialEvents** (*in query*): boolean

  }}">sendInitialEvents


- **timeoutSeconds** (*in query*): integer

  }}">timeoutSeconds


- **watch** (*in query*): boolean

  }}">watch



#### Response


200 (}}">ResourceClaimList): OK

401: Unauthorized


### `list` list or watch objects of kind ResourceClaim

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/resourceclaims

#### Parameters


- **allowWatchBookmarks** (*in query*): boolean

  }}">allowWatchBookmarks


- **continue** (*in query*): string

  }}">continue


- **fieldSelector** (*in query*): string

  }}">fieldSelector


- **labelSelector** (*in query*): string

  }}">labelSelector


- **limit** (*in query*): integer

  }}">limit


- **pretty** (*in query*): string

  }}">pretty


- **resourceVersion** (*in query*): string

  }}">resourceVersion


- **resourceVersionMatch** (*in query*): string

  }}">resourceVersionMatch


- **sendInitialEvents** (*in query*): boolean

  }}">sendInitialEvents


- **timeoutSeconds** (*in query*): integer

  }}">timeoutSeconds


- **watch** (*in query*): boolean

  }}">watch



#### Response


200 (}}">ResourceClaimList): OK

401: Unauthorized


### `create` create a ResourceClaim

#### HTTP Request

POST /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ResourceClaim, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

201 (}}">ResourceClaim): Created

202 (}}">ResourceClaim): Accepted

401: Unauthorized


### `update` replace the specified ResourceClaim

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ResourceClaim, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

201 (}}">ResourceClaim): Created

401: Unauthorized


### `update` replace status of the specified ResourceClaim

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ResourceClaim, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

201 (}}">ResourceClaim): Created

401: Unauthorized


### `patch` partially update the specified ResourceClaim

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Patch, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **force** (*in query*): boolean

  }}">force


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

201 (}}">ResourceClaim): Created

401: Unauthorized


### `patch` partially update status of the specified ResourceClaim

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Patch, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **force** (*in query*): boolean

  }}">force


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaim): OK

201 (}}">ResourceClaim): Created

401: Unauthorized


### `delete` delete a ResourceClaim

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaim


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">DeleteOptions

  


- **dryRun** (*in query*): string

  }}">dryRun


- **gracePeriodSeconds** (*in query*): integer

  }}">gracePeriodSeconds


- **pretty** (*in query*): string

  }}">pretty


- **propagationPolicy** (*in query*): string

  }}">propagationPolicy



#### Response


200 (}}">ResourceClaim): OK

202 (}}">ResourceClaim): Accepted

401: Unauthorized


### `deletecollection` delete collection of ResourceClaim

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaims

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">DeleteOptions

  


- **continue** (*in query*): string

  }}">continue


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldSelector** (*in query*): string

  }}">fieldSelector


- **gracePeriodSeconds** (*in query*): integer

  }}">gracePeriodSeconds


- **labelSelector** (*in query*): string

  }}">labelSelector


- **limit** (*in query*): integer

  }}">limit


- **pretty** (*in query*): string

  }}">pretty


- **propagationPolicy** (*in query*): string

  }}">propagationPolicy


- **resourceVersion** (*in query*): string

  }}">resourceVersion


- **resourceVersionMatch** (*in query*): string

  }}">resourceVersionMatch


- **sendInitialEvents** (*in query*): boolean

  }}">sendInitialEvents


- **timeoutSeconds** (*in query*): integer

  }}">timeoutSeconds



#### Response


200 (}}">Status): OK

401: Unauthorized

