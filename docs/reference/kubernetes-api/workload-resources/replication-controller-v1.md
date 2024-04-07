---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "ReplicationController"
content_type: "api_reference"
description: "ReplicationController represents the configuration of a replication controller."
title: "ReplicationController"
weight: 3
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## ReplicationController {#ReplicationController}

ReplicationController represents the configuration of a replication controller.



- **apiVersion**: v1


- **kind**: ReplicationController


- **metadata** (}}">ObjectMeta)

  If the Labels of a ReplicationController are empty, they are defaulted to be the same as the Pod(s) that the replication controller manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">ReplicationControllerSpec)

  Spec defines the specification of the desired behavior of the replication controller. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

- **status** (}}">ReplicationControllerStatus)

  Status is the most recently observed status of the replication controller. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## ReplicationControllerSpec {#ReplicationControllerSpec}

ReplicationControllerSpec is the specification of a replication controller.



- **selector** (map[string]string)

  Selector is a label query over pods that should match the Replicas count. If Selector is empty, it is defaulted to the labels present on the Pod template. Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors

- **template** (}}">PodTemplateSpec)

  Template is the object that describes the pod that will be created if insufficient replicas are detected. This takes precedence over a TemplateRef. The only allowed template.spec.restartPolicy value is "Always". More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template

- **replicas** (int32)

  Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller

- **minReadySeconds** (int32)

  Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)





## ReplicationControllerStatus {#ReplicationControllerStatus}

ReplicationControllerStatus represents the current status of a replication controller.



- **replicas** (int32), required

  Replicas is the most recently observed number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller

- **availableReplicas** (int32)

  The number of available replicas (ready for at least minReadySeconds) for this replication controller.

- **readyReplicas** (int32)

  The number of ready replicas for this replication controller.

- **fullyLabeledReplicas** (int32)

  The number of pods that have labels matching the labels of the pod template of the replication controller.

- **conditions** ([]ReplicationControllerCondition)

  *Patch strategy: merge on key `type`*
  
  Represents the latest available observations of a replication controller's current state.

  
  *ReplicationControllerCondition describes the state of a replication controller at a certain point.*

  - **conditions.status** (string), required

    Status of the condition, one of True, False, Unknown.

  - **conditions.type** (string), required

    Type of replication controller condition.

  - **conditions.lastTransitionTime** (Time)

    The last time the condition transitioned from one status to another.

    
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **conditions.message** (string)

    A human readable message indicating details about the transition.

  - **conditions.reason** (string)

    The reason for the condition's last transition.

- **observedGeneration** (int64)

  ObservedGeneration reflects the generation of the most recently observed replication controller.





## ReplicationControllerList {#ReplicationControllerList}

ReplicationControllerList is a collection of replication controllers.



- **apiVersion**: v1


- **kind**: ReplicationControllerList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">ReplicationController), required

  List of replication controllers. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller





## Operations {#Operations}










### `get` read the specified ReplicationController

#### HTTP Request

GET /api/v1/namespaces/{namespace}/replicationcontrollers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicationController): OK

401: Unauthorized


### `get` read status of the specified ReplicationController

#### HTTP Request

GET /api/v1/namespaces/{namespace}/replicationcontrollers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicationController): OK

401: Unauthorized


### `list` list or watch objects of kind ReplicationController

#### HTTP Request

GET /api/v1/namespaces/{namespace}/replicationcontrollers

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


200 (}}">ReplicationControllerList): OK

401: Unauthorized


### `list` list or watch objects of kind ReplicationController

#### HTTP Request

GET /api/v1/replicationcontrollers

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


200 (}}">ReplicationControllerList): OK

401: Unauthorized


### `create` create a ReplicationController

#### HTTP Request

POST /api/v1/namespaces/{namespace}/replicationcontrollers

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicationController, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicationController): OK

201 (}}">ReplicationController): Created

202 (}}">ReplicationController): Accepted

401: Unauthorized


### `update` replace the specified ReplicationController

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/replicationcontrollers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicationController, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicationController): OK

201 (}}">ReplicationController): Created

401: Unauthorized


### `update` replace status of the specified ReplicationController

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/replicationcontrollers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicationController, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicationController): OK

201 (}}">ReplicationController): Created

401: Unauthorized


### `patch` partially update the specified ReplicationController

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/replicationcontrollers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


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


200 (}}">ReplicationController): OK

201 (}}">ReplicationController): Created

401: Unauthorized


### `patch` partially update status of the specified ReplicationController

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/replicationcontrollers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


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


200 (}}">ReplicationController): OK

201 (}}">ReplicationController): Created

401: Unauthorized


### `delete` delete a ReplicationController

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/replicationcontrollers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicationController


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


200 (}}">Status): OK

202 (}}">Status): Accepted

401: Unauthorized


### `deletecollection` delete collection of ReplicationController

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/replicationcontrollers

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

