---
api_metadata:
  apiVersion: "scheduling.k8s.io/v1"
  import: "k8s.io/api/scheduling/v1"
  kind: "PriorityClass"
content_type: "api_reference"
description: "PriorityClass defines mapping from a priority class name to the priority integer value."
title: "PriorityClass"
weight: 13
auto_generated: true
---



`apiVersion: scheduling.k8s.io/v1`

`import "k8s.io/api/scheduling/v1"`


## PriorityClass {#PriorityClass}

PriorityClass defines mapping from a priority class name to the priority integer value. The value can be any valid integer.



- **apiVersion**: scheduling.k8s.io/v1


- **kind**: PriorityClass


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **value** (int32), required

  value represents the integer value of this priority class. This is the actual priority that pods receive when they have the name of this class in their pod spec.

- **description** (string)

  description is an arbitrary string that usually provides guidelines on when this priority class should be used.

- **globalDefault** (boolean)

  globalDefault specifies whether this PriorityClass should be considered as the default priority for pods that do not have any priority class. Only one PriorityClass can be marked as `globalDefault`. However, if more than one PriorityClasses exists with their `globalDefault` field set to true, the smallest value of such global default PriorityClasses will be used as the default priority.

- **preemptionPolicy** (string)

  preemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.





## PriorityClassList {#PriorityClassList}

PriorityClassList is a collection of priority classes.



- **apiVersion**: scheduling.k8s.io/v1


- **kind**: PriorityClassList


- **metadata** (}}">ListMeta)

  Standard list metadata More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **items** ([]}}">PriorityClass), required

  items is the list of PriorityClasses





## Operations {#Operations}










### `get` read the specified PriorityClass

#### HTTP Request

GET /apis/scheduling.k8s.io/v1/priorityclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PriorityClass


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PriorityClass): OK

401: Unauthorized


### `list` list or watch objects of kind PriorityClass

#### HTTP Request

GET /apis/scheduling.k8s.io/v1/priorityclasses

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


200 (}}">PriorityClassList): OK

401: Unauthorized


### `create` create a PriorityClass

#### HTTP Request

POST /apis/scheduling.k8s.io/v1/priorityclasses

#### Parameters


- **body**: }}">PriorityClass, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PriorityClass): OK

201 (}}">PriorityClass): Created

202 (}}">PriorityClass): Accepted

401: Unauthorized


### `update` replace the specified PriorityClass

#### HTTP Request

PUT /apis/scheduling.k8s.io/v1/priorityclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PriorityClass


- **body**: }}">PriorityClass, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">PriorityClass): OK

201 (}}">PriorityClass): Created

401: Unauthorized


### `patch` partially update the specified PriorityClass

#### HTTP Request

PATCH /apis/scheduling.k8s.io/v1/priorityclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PriorityClass


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


200 (}}">PriorityClass): OK

201 (}}">PriorityClass): Created

401: Unauthorized


### `delete` delete a PriorityClass

#### HTTP Request

DELETE /apis/scheduling.k8s.io/v1/priorityclasses/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PriorityClass


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


### `deletecollection` delete collection of PriorityClass

#### HTTP Request

DELETE /apis/scheduling.k8s.io/v1/priorityclasses

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

