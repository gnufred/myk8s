---
api_metadata:
  apiVersion: "resource.k8s.io/v1alpha2"
  import: "k8s.io/api/resource/v1alpha2"
  kind: "PodSchedulingContext"
content_type: "api_reference"
description: "PodSchedulingContext objects hold information that is needed to schedule a Pod with ResourceClaims that use \"WaitForFirstConsumer\" allocation mode."
title: "PodSchedulingContext v1alpha2"
weight: 14
auto_generated: true
---



`apiVersion: resource.k8s.io/v1alpha2`

`import "k8s.io/api/resource/v1alpha2"`


## PodSchedulingContext {#PodSchedulingContext}

PodSchedulingContext objects hold information that is needed to schedule a Pod with ResourceClaims that use "WaitForFirstConsumer" allocation mode.

This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: PodSchedulingContext


- **metadata** (}}">ObjectMeta)

  Standard object metadata

- **spec** (}}">PodSchedulingContextSpec), required

  Spec describes where resources for the Pod are needed.

- **status** (}}">PodSchedulingContextStatus)

  Status describes where resources for the Pod can be allocated.





## PodSchedulingContextSpec {#PodSchedulingContextSpec}

PodSchedulingContextSpec describes where resources for the Pod are needed.



- **potentialNodes** ([]string)

  *Set: unique values will be kept during a merge*
  
  PotentialNodes lists nodes where the Pod might be able to run.
  
  The size of this field is limited to 128. This is large enough for many clusters. Larger clusters may need more attempts to find a node that suits all pending resources. This may get increased in the future, but not reduced.

- **selectedNode** (string)

  SelectedNode is the node for which allocation of ResourceClaims that are referenced by the Pod and that use "WaitForFirstConsumer" allocation is to be attempted.





## PodSchedulingContextStatus {#PodSchedulingContextStatus}

PodSchedulingContextStatus describes where resources for the Pod can be allocated.



- **resourceClaims** ([]ResourceClaimSchedulingStatus)

  *Map: unique values on key name will be kept during a merge*
  
  ResourceClaims describes resource availability for each pod.spec.resourceClaim entry where the corresponding ResourceClaim uses "WaitForFirstConsumer" allocation mode.

  
  *ResourceClaimSchedulingStatus contains information about one particular ResourceClaim with "WaitForFirstConsumer" allocation mode.*

  - **resourceClaims.name** (string)

    Name matches the pod.spec.resourceClaims[*].Name field.

  - **resourceClaims.unsuitableNodes** ([]string)

    *Set: unique values will be kept during a merge*
    
    UnsuitableNodes lists nodes that the ResourceClaim cannot be allocated for.
    
    The size of this field is limited to 128, the same as for PodSchedulingSpec.PotentialNodes. This may get increased in the future, but not reduced.





## PodSchedulingContextList {#PodSchedulingContextList}

PodSchedulingContextList is a collection of Pod scheduling objects.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: PodSchedulingContextList


- **metadata** (}}">ListMeta)

  Standard list metadata

- **items** ([]}}">PodSchedulingContext), required

  Items is the list of PodSchedulingContext objects.





## Operations {#Operations}










### `get` read the specified PodSchedulingContext

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodSchedulingContext): OK

401: Unauthorized


### `get` read status of the specified PodSchedulingContext

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodSchedulingContext): OK

401: Unauthorized


### `list` list or watch objects of kind PodSchedulingContext

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts

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


200 (}}">PodSchedulingContextList): OK

401: Unauthorized


### `list` list or watch objects of kind PodSchedulingContext

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/podschedulingcontexts

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


200 (}}">PodSchedulingContextList): OK

401: Unauthorized


### `create` create a PodSchedulingContext

#### HTTP Request

POST /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">PodSchedulingContext, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodSchedulingContext): OK

201 (}}">PodSchedulingContext): Created

202 (}}">PodSchedulingContext): Accepted

401: Unauthorized


### `update` replace the specified PodSchedulingContext

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">PodSchedulingContext, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodSchedulingContext): OK

201 (}}">PodSchedulingContext): Created

401: Unauthorized


### `update` replace status of the specified PodSchedulingContext

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">PodSchedulingContext, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodSchedulingContext): OK

201 (}}">PodSchedulingContext): Created

401: Unauthorized


### `patch` partially update the specified PodSchedulingContext

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


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


200 (}}">PodSchedulingContext): OK

201 (}}">PodSchedulingContext): Created

401: Unauthorized


### `patch` partially update status of the specified PodSchedulingContext

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


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


200 (}}">PodSchedulingContext): OK

201 (}}">PodSchedulingContext): Created

401: Unauthorized


### `delete` delete a PodSchedulingContext

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodSchedulingContext


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


200 (}}">PodSchedulingContext): OK

202 (}}">PodSchedulingContext): Accepted

401: Unauthorized


### `deletecollection` delete collection of PodSchedulingContext

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/podschedulingcontexts

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

