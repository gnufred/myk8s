---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "Namespace"
content_type: "api_reference"
description: "Namespace provides a scope for Names."
title: "Namespace"
weight: 2
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## Namespace {#Namespace}

Namespace provides a scope for Names. Use of multiple namespaces is optional.



- **apiVersion**: v1


- **kind**: Namespace


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">NamespaceSpec)

  Spec defines the behavior of the Namespace. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

- **status** (}}">NamespaceStatus)

  Status describes the current status of a Namespace. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## NamespaceSpec {#NamespaceSpec}

NamespaceSpec describes the attributes on a Namespace.



- **finalizers** ([]string)

  Finalizers is an opaque list of values that must be empty to permanently remove object from storage. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/





## NamespaceStatus {#NamespaceStatus}

NamespaceStatus is information about the current status of a Namespace.



- **conditions** ([]NamespaceCondition)

  *Patch strategy: merge on key `type`*
  
  Represents the latest available observations of a namespace's current state.

  
  *NamespaceCondition contains details about state of namespace.*

  - **conditions.status** (string), required

    Status of the condition, one of True, False, Unknown.

  - **conditions.type** (string), required

    Type of namespace controller condition.

  - **conditions.lastTransitionTime** (Time)


    
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **conditions.message** (string)


  - **conditions.reason** (string)


- **phase** (string)

  Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/





## NamespaceList {#NamespaceList}

NamespaceList is a list of Namespaces.



- **apiVersion**: v1


- **kind**: NamespaceList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">Namespace), required

  Items is the list of Namespace objects in the list. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/





## Operations {#Operations}










### `get` read the specified Namespace

#### HTTP Request

GET /api/v1/namespaces/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

401: Unauthorized


### `get` read status of the specified Namespace

#### HTTP Request

GET /api/v1/namespaces/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

401: Unauthorized


### `list` list or watch objects of kind Namespace

#### HTTP Request

GET /api/v1/namespaces

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


200 (}}">NamespaceList): OK

401: Unauthorized


### `create` create a Namespace

#### HTTP Request

POST /api/v1/namespaces

#### Parameters


- **body**: }}">Namespace, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

201 (}}">Namespace): Created

202 (}}">Namespace): Accepted

401: Unauthorized


### `update` replace the specified Namespace

#### HTTP Request

PUT /api/v1/namespaces/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


- **body**: }}">Namespace, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

201 (}}">Namespace): Created

401: Unauthorized


### `update` replace finalize of the specified Namespace

#### HTTP Request

PUT /api/v1/namespaces/{name}/finalize

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


- **body**: }}">Namespace, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

201 (}}">Namespace): Created

401: Unauthorized


### `update` replace status of the specified Namespace

#### HTTP Request

PUT /api/v1/namespaces/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


- **body**: }}">Namespace, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Namespace): OK

201 (}}">Namespace): Created

401: Unauthorized


### `patch` partially update the specified Namespace

#### HTTP Request

PATCH /api/v1/namespaces/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


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


200 (}}">Namespace): OK

201 (}}">Namespace): Created

401: Unauthorized


### `patch` partially update status of the specified Namespace

#### HTTP Request

PATCH /api/v1/namespaces/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


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


200 (}}">Namespace): OK

201 (}}">Namespace): Created

401: Unauthorized


### `delete` delete a Namespace

#### HTTP Request

DELETE /api/v1/namespaces/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Namespace


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


200 (}}">Status): OK

202 (}}">Status): Accepted

401: Unauthorized

