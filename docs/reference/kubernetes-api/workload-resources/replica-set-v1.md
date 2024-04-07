---
api_metadata:
  apiVersion: "apps/v1"
  import: "k8s.io/api/apps/v1"
  kind: "ReplicaSet"
content_type: "api_reference"
description: "ReplicaSet ensures that a specified number of pod replicas are running at any given time."
title: "ReplicaSet"
weight: 4
auto_generated: true
---



`apiVersion: apps/v1`

`import "k8s.io/api/apps/v1"`


## ReplicaSet {#ReplicaSet}

ReplicaSet ensures that a specified number of pod replicas are running at any given time.



- **apiVersion**: apps/v1


- **kind**: ReplicaSet


- **metadata** (}}">ObjectMeta)

  If the Labels of a ReplicaSet are empty, they are defaulted to be the same as the Pod(s) that the ReplicaSet manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">ReplicaSetSpec)

  Spec defines the specification of the desired behavior of the ReplicaSet. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

- **status** (}}">ReplicaSetStatus)

  Status is the most recently observed status of the ReplicaSet. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## ReplicaSetSpec {#ReplicaSetSpec}

ReplicaSetSpec is the specification of a ReplicaSet.



- **selector** (}}">LabelSelector), required

  Selector is a label query over pods that should match the replica count. Label keys and values that must match in order to be controlled by this replica set. It must match the pod template's labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors

- **template** (}}">PodTemplateSpec)

  Template is the object that describes the pod that will be created if insufficient replicas are detected. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template

- **replicas** (int32)

  Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller

- **minReadySeconds** (int32)

  Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)





## ReplicaSetStatus {#ReplicaSetStatus}

ReplicaSetStatus represents the current status of a ReplicaSet.



- **replicas** (int32), required

  Replicas is the most recently observed number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller

- **availableReplicas** (int32)

  The number of available replicas (ready for at least minReadySeconds) for this replica set.

- **readyReplicas** (int32)

  readyReplicas is the number of pods targeted by this ReplicaSet with a Ready Condition.

- **fullyLabeledReplicas** (int32)

  The number of pods that have labels matching the labels of the pod template of the replicaset.

- **conditions** ([]ReplicaSetCondition)

  *Patch strategy: merge on key `type`*
  
  Represents the latest available observations of a replica set's current state.

  
  *ReplicaSetCondition describes the state of a replica set at a certain point.*

  - **conditions.status** (string), required

    Status of the condition, one of True, False, Unknown.

  - **conditions.type** (string), required

    Type of replica set condition.

  - **conditions.lastTransitionTime** (Time)

    The last time the condition transitioned from one status to another.

    
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **conditions.message** (string)

    A human readable message indicating details about the transition.

  - **conditions.reason** (string)

    The reason for the condition's last transition.

- **observedGeneration** (int64)

  ObservedGeneration reflects the generation of the most recently observed ReplicaSet.





## ReplicaSetList {#ReplicaSetList}

ReplicaSetList is a collection of ReplicaSets.



- **apiVersion**: apps/v1


- **kind**: ReplicaSetList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">ReplicaSet), required

  List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller





## Operations {#Operations}










### `get` read the specified ReplicaSet

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/replicasets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicaSet): OK

401: Unauthorized


### `get` read status of the specified ReplicaSet

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/replicasets/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicaSet): OK

401: Unauthorized


### `list` list or watch objects of kind ReplicaSet

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/replicasets

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


200 (}}">ReplicaSetList): OK

401: Unauthorized


### `list` list or watch objects of kind ReplicaSet

#### HTTP Request

GET /apis/apps/v1/replicasets

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


200 (}}">ReplicaSetList): OK

401: Unauthorized


### `create` create a ReplicaSet

#### HTTP Request

POST /apis/apps/v1/namespaces/{namespace}/replicasets

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicaSet, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicaSet): OK

201 (}}">ReplicaSet): Created

202 (}}">ReplicaSet): Accepted

401: Unauthorized


### `update` replace the specified ReplicaSet

#### HTTP Request

PUT /apis/apps/v1/namespaces/{namespace}/replicasets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicaSet, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicaSet): OK

201 (}}">ReplicaSet): Created

401: Unauthorized


### `update` replace status of the specified ReplicaSet

#### HTTP Request

PUT /apis/apps/v1/namespaces/{namespace}/replicasets/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ReplicaSet, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ReplicaSet): OK

201 (}}">ReplicaSet): Created

401: Unauthorized


### `patch` partially update the specified ReplicaSet

#### HTTP Request

PATCH /apis/apps/v1/namespaces/{namespace}/replicasets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


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


200 (}}">ReplicaSet): OK

201 (}}">ReplicaSet): Created

401: Unauthorized


### `patch` partially update status of the specified ReplicaSet

#### HTTP Request

PATCH /apis/apps/v1/namespaces/{namespace}/replicasets/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


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


200 (}}">ReplicaSet): OK

201 (}}">ReplicaSet): Created

401: Unauthorized


### `delete` delete a ReplicaSet

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/replicasets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ReplicaSet


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


### `deletecollection` delete collection of ReplicaSet

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/replicasets

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

