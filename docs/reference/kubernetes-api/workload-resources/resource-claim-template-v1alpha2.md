---
api_metadata:
  apiVersion: "resource.k8s.io/v1alpha2"
  import: "k8s.io/api/resource/v1alpha2"
  kind: "ResourceClaimTemplate"
content_type: "api_reference"
description: "ResourceClaimTemplate is used to produce ResourceClaim objects."
title: "ResourceClaimTemplate v1alpha2"
weight: 16
auto_generated: true
---



`apiVersion: resource.k8s.io/v1alpha2`

`import "k8s.io/api/resource/v1alpha2"`


## ResourceClaimTemplate {#ResourceClaimTemplate}

ResourceClaimTemplate is used to produce ResourceClaim objects.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClaimTemplate


- **metadata** (}}">ObjectMeta)

  Standard object metadata

- **spec** (}}">ResourceClaimTemplateSpec), required

  Describes the ResourceClaim that is to be generated.
  
  This field is immutable. A ResourceClaim will get created by the control plane for a Pod when needed and then not get updated anymore.





## ResourceClaimTemplateSpec {#ResourceClaimTemplateSpec}

ResourceClaimTemplateSpec contains the metadata and fields for a ResourceClaim.



- **spec** (}}">ResourceClaimSpec), required

  Spec for the ResourceClaim. The entire content is copied unchanged into the ResourceClaim that gets created from this template. The same fields as in a ResourceClaim are also valid here.

- **metadata** (}}">ObjectMeta)

  ObjectMeta may contain labels and annotations that will be copied into the PVC when creating it. No other fields are allowed and will be rejected during validation.





## ResourceClaimTemplateList {#ResourceClaimTemplateList}

ResourceClaimTemplateList is a collection of claim templates.



- **apiVersion**: resource.k8s.io/v1alpha2


- **kind**: ResourceClaimTemplateList


- **metadata** (}}">ListMeta)

  Standard list metadata

- **items** ([]}}">ResourceClaimTemplate), required

  Items is the list of resource claim templates.





## Operations {#Operations}










### `get` read the specified ResourceClaimTemplate

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaimTemplate


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaimTemplate): OK

401: Unauthorized


### `list` list or watch objects of kind ResourceClaimTemplate

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates

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


200 (}}">ResourceClaimTemplateList): OK

401: Unauthorized


### `list` list or watch objects of kind ResourceClaimTemplate

#### HTTP Request

GET /apis/resource.k8s.io/v1alpha2/resourceclaimtemplates

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


200 (}}">ResourceClaimTemplateList): OK

401: Unauthorized


### `create` create a ResourceClaimTemplate

#### HTTP Request

POST /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ResourceClaimTemplate, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaimTemplate): OK

201 (}}">ResourceClaimTemplate): Created

202 (}}">ResourceClaimTemplate): Accepted

401: Unauthorized


### `update` replace the specified ResourceClaimTemplate

#### HTTP Request

PUT /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaimTemplate


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ResourceClaimTemplate, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ResourceClaimTemplate): OK

201 (}}">ResourceClaimTemplate): Created

401: Unauthorized


### `patch` partially update the specified ResourceClaimTemplate

#### HTTP Request

PATCH /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaimTemplate


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


200 (}}">ResourceClaimTemplate): OK

201 (}}">ResourceClaimTemplate): Created

401: Unauthorized


### `delete` delete a ResourceClaimTemplate

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ResourceClaimTemplate


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


200 (}}">ResourceClaimTemplate): OK

202 (}}">ResourceClaimTemplate): Accepted

401: Unauthorized


### `deletecollection` delete collection of ResourceClaimTemplate

#### HTTP Request

DELETE /apis/resource.k8s.io/v1alpha2/namespaces/{namespace}/resourceclaimtemplates

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

