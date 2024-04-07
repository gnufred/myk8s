---
api_metadata:
  apiVersion: "autoscaling/v1"
  import: "k8s.io/api/autoscaling/v1"
  kind: "HorizontalPodAutoscaler"
content_type: "api_reference"
description: "configuration of a horizontal pod autoscaler."
title: "HorizontalPodAutoscaler"
weight: 11
auto_generated: true
---



`apiVersion: autoscaling/v1`

`import "k8s.io/api/autoscaling/v1"`


## HorizontalPodAutoscaler {#HorizontalPodAutoscaler}

configuration of a horizontal pod autoscaler.



- **apiVersion**: autoscaling/v1


- **kind**: HorizontalPodAutoscaler


- **metadata** (}}">ObjectMeta)

  Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">HorizontalPodAutoscalerSpec)

  spec defines the behaviour of autoscaler. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status.

- **status** (}}">HorizontalPodAutoscalerStatus)

  status is the current information about the autoscaler.





## HorizontalPodAutoscalerSpec {#HorizontalPodAutoscalerSpec}

specification of a horizontal pod autoscaler.



- **maxReplicas** (int32), required

  maxReplicas is the upper limit for the number of pods that can be set by the autoscaler; cannot be smaller than MinReplicas.

- **scaleTargetRef** (CrossVersionObjectReference), required

  reference to scaled resource; horizontal pod autoscaler will learn the current resource consumption and will set the desired number of pods by using its Scale subresource.

  
  *CrossVersionObjectReference contains enough information to let you identify the referred resource.*

  - **scaleTargetRef.kind** (string), required

    kind is the kind of the referent; More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

  - **scaleTargetRef.name** (string), required

    name is the name of the referent; More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names

  - **scaleTargetRef.apiVersion** (string)

    apiVersion is the API version of the referent

- **minReplicas** (int32)

  minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down.  It defaults to 1 pod.  minReplicas is allowed to be 0 if the alpha feature gate HPAScaleToZero is enabled and at least one Object or External metric is configured.  Scaling is active as long as at least one metric value is available.

- **targetCPUUtilizationPercentage** (int32)

  targetCPUUtilizationPercentage is the target average CPU utilization (represented as a percentage of requested CPU) over all the pods; if not specified the default autoscaling policy will be used.





## HorizontalPodAutoscalerStatus {#HorizontalPodAutoscalerStatus}

current status of a horizontal pod autoscaler



- **currentReplicas** (int32), required

  currentReplicas is the current number of replicas of pods managed by this autoscaler.

- **desiredReplicas** (int32), required

  desiredReplicas is the  desired number of replicas of pods managed by this autoscaler.

- **currentCPUUtilizationPercentage** (int32)

  currentCPUUtilizationPercentage is the current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g. 70 means that an average pod is using now 70% of its requested CPU.

- **lastScaleTime** (Time)

  lastScaleTime is the last time the HorizontalPodAutoscaler scaled the number of pods; used by the autoscaler to control how often the number of pods is changed.

  
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **observedGeneration** (int64)

  observedGeneration is the most recent generation observed by this autoscaler.





## HorizontalPodAutoscalerList {#HorizontalPodAutoscalerList}

list of horizontal pod autoscaler objects.



- **apiVersion**: autoscaling/v1


- **kind**: HorizontalPodAutoscalerList


- **metadata** (}}">ListMeta)

  Standard list metadata.

- **items** ([]}}">HorizontalPodAutoscaler), required

  items is the list of horizontal pod autoscaler objects.





## Operations {#Operations}










### `get` read the specified HorizontalPodAutoscaler

#### HTTP Request

GET /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">HorizontalPodAutoscaler): OK

401: Unauthorized


### `get` read status of the specified HorizontalPodAutoscaler

#### HTTP Request

GET /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">HorizontalPodAutoscaler): OK

401: Unauthorized


### `list` list or watch objects of kind HorizontalPodAutoscaler

#### HTTP Request

GET /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers

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


200 (}}">HorizontalPodAutoscalerList): OK

401: Unauthorized


### `list` list or watch objects of kind HorizontalPodAutoscaler

#### HTTP Request

GET /apis/autoscaling/v1/horizontalpodautoscalers

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


200 (}}">HorizontalPodAutoscalerList): OK

401: Unauthorized


### `create` create a HorizontalPodAutoscaler

#### HTTP Request

POST /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">HorizontalPodAutoscaler, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">HorizontalPodAutoscaler): OK

201 (}}">HorizontalPodAutoscaler): Created

202 (}}">HorizontalPodAutoscaler): Accepted

401: Unauthorized


### `update` replace the specified HorizontalPodAutoscaler

#### HTTP Request

PUT /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">HorizontalPodAutoscaler, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">HorizontalPodAutoscaler): OK

201 (}}">HorizontalPodAutoscaler): Created

401: Unauthorized


### `update` replace status of the specified HorizontalPodAutoscaler

#### HTTP Request

PUT /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">HorizontalPodAutoscaler, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">HorizontalPodAutoscaler): OK

201 (}}">HorizontalPodAutoscaler): Created

401: Unauthorized


### `patch` partially update the specified HorizontalPodAutoscaler

#### HTTP Request

PATCH /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


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


200 (}}">HorizontalPodAutoscaler): OK

201 (}}">HorizontalPodAutoscaler): Created

401: Unauthorized


### `patch` partially update status of the specified HorizontalPodAutoscaler

#### HTTP Request

PATCH /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


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


200 (}}">HorizontalPodAutoscaler): OK

201 (}}">HorizontalPodAutoscaler): Created

401: Unauthorized


### `delete` delete a HorizontalPodAutoscaler

#### HTTP Request

DELETE /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the HorizontalPodAutoscaler


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


### `deletecollection` delete collection of HorizontalPodAutoscaler

#### HTTP Request

DELETE /apis/autoscaling/v1/namespaces/{namespace}/horizontalpodautoscalers

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

