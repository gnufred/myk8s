---
api_metadata:
  apiVersion: "resource.k8s.io/v1alpha2"
  import: "k8s.io/api/resource/v1alpha2"
  kind: "ResourceClass"
content_type: "api_reference"
description: "ResourceClass is used by administrators to influence how resources are allocated."
title: "ResourceClass v1alpha2"
weight: 17
auto_generated: true
---



`apiVersion: resource.k8s.io/v1alpha2`

`import "k8s.io/api/resource/v1alpha2"`


## ResourceClass {#ResourceClass}

ResourceClass is used by administrators to influence how resources are allocated.

This is an alpha type and requires enabling the DynamicResourceAllocation feature gate.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClass


- **metadata** (}}">ObjectMeta)

  Standard object metadata

- **driverName** (string), required

  DriverName defines the name of the dynamic resource driver that is used for allocation of a ResourceClaim that uses this class.
  
  Resource drivers have a unique name in forward domain order (acme.example.com).

- **parametersRef** (ResourceClassParametersReference)

  ParametersRef references an arbitrary separate object that may hold parameters that will be used by the driver when allocating a resource that uses this class. A dynamic resource driver can distinguish between parameters stored here and and those stored in ResourceClaimSpec.

  
  *ResourceClassParametersReference contains enough information to let you locate the parameters for a ResourceClass.*

  - **parametersRef.kind** (string), required

    Kind is the type of resource being referenced. This is the same value as in the parameter object's metadata.

  - **parametersRef.name** (string), required

    Name is the name of resource being referenced.

  - **parametersRef.apiGroup** (string)

    APIGroup is the group for the resource being referenced. It is empty for the core API. This matches the group in the APIVersion that is used when creating the resources.

  - **parametersRef.namespace** (string)

    Namespace that contains the referenced resource. Must be empty for cluster-scoped resources and non-empty for namespaced resources.

- **suitableNodes** (NodeSelector)

  Only nodes matching the selector will be considered by the scheduler when trying to find a Node that fits a Pod when that Pod uses a ResourceClaim that has not been allocated yet.
  
  Setting this field is optional. If null, all nodes are candidates.

  
  *A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.*

  - **suitableNodes.nodeSelectorTerms** ([]NodeSelectorTerm), required

    Required. A list of node selector terms. The terms are ORed.

    
    *A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.*

    - **suitableNodes.nodeSelectorTerms.matchExpressions** ([]}}">NodeSelectorRequirement)

      A list of node selector requirements by node's labels.

    - **suitableNodes.nodeSelectorTerms.matchFields** ([]}}">NodeSelectorRequirement)

      A list of node selector requirements by node's fields.





## ResourceClassList {#ResourceClassList}

ResourceClassList is a collection of classes.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClassList


- **metadata** (}}">ListMeta)

  Standard list metadata

- **items** ([]}}">ResourceClass), required

  Items is the list of resource classes.





## Operations {#Operations}










### `get` read the specified ResourceClass

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/resourceclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClass


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClass): OK

401: Unauthorized


### `list` list or watch objects of kind ResourceClass

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/resourceclasses

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


200 (}}">ResourceClassList): OK

401: Unauthorized


### `create` create a ResourceClass

#### HTTP Request

POST /apis/resource.k8s.io/v1alpha2/resourceclasses

#### Parameters


- **body**: }}">ResourceClass, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClass): OK

201 (}}">ResourceClass): Created

202 (}}">ResourceClass): Accepted

401: Unauthorized


### `update` replace the specified ResourceClass

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/resourceclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClass


- **body**: }}">ResourceClass, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClass): OK

201 (}}">ResourceClass): Created

401: Unauthorized


### `patch` partially update the specified ResourceClass

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/resourceclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClass


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


200 (}}">ResourceClass): OK

201 (}}">ResourceClass): Created

401: Unauthorized


### `delete` delete a ResourceClass

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/resourceclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClass


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


200 (}}">ResourceClass): OK

202 (}}">ResourceClass): Accepted

401: Unauthorized


### `deletecollection` delete collection of ResourceClass

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/resourceclasses

#### Parameters


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

