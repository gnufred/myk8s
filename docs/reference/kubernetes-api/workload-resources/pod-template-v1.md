---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "PodTemplate"
content_type: "api_reference"
description: "PodTemplate describes a template for creating copies of a predefined pod."
title: "PodTemplate"
weight: 2
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## PodTemplate {#PodTemplate}

PodTemplate describes a template for creating copies of a predefined pod.



- **apiVersion**: v1


- **kind**: PodTemplate


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **template** (}}">PodTemplateSpec)

  Template defines the pods that will be created from this pod template. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## PodTemplateSpec {#PodTemplateSpec}

PodTemplateSpec describes the data a pod should have when created from a template



- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">PodSpec)

  Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## PodTemplateList {#PodTemplateList}

PodTemplateList is a list of PodTemplates.



- **apiVersion**: v1


- **kind**: PodTemplateList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">PodTemplate), required

  List of pod templates





## Operations {#Operations}










### `get` read the specified PodTemplate

#### HTTP Request

GET /api/v1/namespaces/{namespace}/podtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodTemplate


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodTemplate): OK

401: Unauthorized


### `list` list or watch objects of kind PodTemplate

#### HTTP Request

GET /api/v1/namespaces/{namespace}/podtemplates

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


200 (}}">PodTemplateList): OK

401: Unauthorized


### `list` list or watch objects of kind PodTemplate

#### HTTP Request

GET /api/v1/podtemplates

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


200 (}}">PodTemplateList): OK

401: Unauthorized


### `create` create a PodTemplate

#### HTTP Request

POST /api/v1/namespaces/{namespace}/podtemplates

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">PodTemplate, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodTemplate): OK

201 (}}">PodTemplate): Created

202 (}}">PodTemplate): Accepted

401: Unauthorized


### `update` replace the specified PodTemplate

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/podtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodTemplate


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">PodTemplate, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PodTemplate): OK

201 (}}">PodTemplate): Created

401: Unauthorized


### `patch` partially update the specified PodTemplate

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/podtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodTemplate


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


200 (}}">PodTemplate): OK

201 (}}">PodTemplate): Created

401: Unauthorized


### `delete` delete a PodTemplate

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/podtemplates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodTemplate


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


200 (}}">PodTemplate): OK

202 (}}">PodTemplate): Accepted

401: Unauthorized


### `deletecollection` delete collection of PodTemplate

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/podtemplates

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

