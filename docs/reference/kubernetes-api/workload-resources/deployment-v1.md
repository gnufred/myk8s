---
api_metadata:
  apiVersion: "apps/v1"
  import: "k8s.io/api/apps/v1"
  kind: "Deployment"
content_type: "api_reference"
description: "Deployment enables declarative updates for Pods and ReplicaSets."
title: "Deployment"
weight: 5
auto_generated: true
---



`apiVersion: apps/v1`

`import "k8s.io/api/apps/v1"`


## Deployment {#Deployment}

Deployment enables declarative updates for Pods and ReplicaSets.



- **apiVersion**: apps/v1


- **kind**: Deployment


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">DeploymentSpec)

  Specification of the desired behavior of the Deployment.

- **status** (}}">DeploymentStatus)

  Most recently observed status of the Deployment.





## DeploymentSpec {#DeploymentSpec}

DeploymentSpec is the specification of the desired behavior of the Deployment.



- **selector** (}}">LabelSelector), required

  Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment. It must match the pod template's labels.

- **template** (}}">PodTemplateSpec), required

  Template describes the pods that will be created. The only allowed template.spec.restartPolicy value is "Always".

- **replicas** (int32)

  Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.

- **minReadySeconds** (int32)

  Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)

- **strategy** (DeploymentStrategy)

  *Patch strategy: retainKeys*
  
  The deployment strategy to use to replace existing pods with new ones.

  
  *DeploymentStrategy describes how to replace existing pods with new ones.*

  - **strategy.type** (string)

    Type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.

  - **strategy.rollingUpdate** (RollingUpdateDeployment)

    Rolling update config params. Present only if DeploymentStrategyType = RollingUpdate.

    
    *Spec to control the desired behavior of rolling update.*

    - **strategy.rollingUpdate.maxSurge** (IntOrString)

      The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). This can not be 0 if MaxUnavailable is 0. Absolute number is calculated from percentage by rounding up. Defaults to 25%. Example: when this is set to 30%, the new ReplicaSet can be scaled up immediately when the rolling update starts, such that the total number of old and new pods do not exceed 130% of desired pods. Once old pods have been killed, new ReplicaSet can be scaled up further, ensuring that total number of pods running at any time during the update is at most 130% of desired pods.

      
      *IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.*

    - **strategy.rollingUpdate.maxUnavailable** (IntOrString)

      The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%). Absolute number is calculated from percentage by rounding down. This can not be 0 if MaxSurge is 0. Defaults to 25%. Example: when this is set to 30%, the old ReplicaSet can be scaled down to 70% of desired pods immediately when the rolling update starts. Once new pods are ready, old ReplicaSet can be scaled down further, followed by scaling up the new ReplicaSet, ensuring that the total number of pods available at all times during the update is at least 70% of desired pods.

      
      *IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.*

- **revisionHistoryLimit** (int32)

  The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.

- **progressDeadlineSeconds** (int32)

  The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. Defaults to 600s.

- **paused** (boolean)

  Indicates that the deployment is paused.





## DeploymentStatus {#DeploymentStatus}

DeploymentStatus is the most recently observed status of the Deployment.



- **replicas** (int32)

  Total number of non-terminated pods targeted by this deployment (their labels match the selector).

- **availableReplicas** (int32)

  Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.

- **readyReplicas** (int32)

  readyReplicas is the number of pods targeted by this Deployment with a Ready Condition.

- **unavailableReplicas** (int32)

  Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.

- **updatedReplicas** (int32)

  Total number of non-terminated pods targeted by this deployment that have the desired template spec.

- **collisionCount** (int32)

  Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.

- **conditions** ([]DeploymentCondition)

  *Patch strategy: merge on key `type`*
  
  Represents the latest available observations of a deployment's current state.

  
  *DeploymentCondition describes the state of a deployment at a certain point.*

  - **conditions.status** (string), required

    Status of the condition, one of True, False, Unknown.

  - **conditions.type** (string), required

    Type of deployment condition.

  - **conditions.lastTransitionTime** (Time)

    Last time the condition transitioned from one status to another.

    
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **conditions.lastUpdateTime** (Time)

    The last time this condition was updated.

    
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **conditions.message** (string)

    A human readable message indicating details about the transition.

  - **conditions.reason** (string)

    The reason for the condition's last transition.

- **observedGeneration** (int64)

  The generation observed by the deployment controller.





## DeploymentList {#DeploymentList}

DeploymentList is a list of Deployments.



- **apiVersion**: apps/v1


- **kind**: DeploymentList


- **metadata** (}}">ListMeta)

  Standard list metadata.

- **items** ([]}}">Deployment), required

  Items is the list of Deployments.





## Operations {#Operations}










### `get` read the specified Deployment

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/deployments/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Deployment): OK

401: Unauthorized


### `get` read status of the specified Deployment

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/deployments/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Deployment): OK

401: Unauthorized


### `list` list or watch objects of kind Deployment

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/deployments

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


200 (}}">DeploymentList): OK

401: Unauthorized


### `list` list or watch objects of kind Deployment

#### HTTP Request

GET /apis/apps/v1/deployments

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


200 (}}">DeploymentList): OK

401: Unauthorized


### `create` create a Deployment

#### HTTP Request

POST /apis/apps/v1/namespaces/{namespace}/deployments

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Deployment, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Deployment): OK

201 (}}">Deployment): Created

202 (}}">Deployment): Accepted

401: Unauthorized


### `update` replace the specified Deployment

#### HTTP Request

PUT /apis/apps/v1/namespaces/{namespace}/deployments/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Deployment, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Deployment): OK

201 (}}">Deployment): Created

401: Unauthorized


### `update` replace status of the specified Deployment

#### HTTP Request

PUT /apis/apps/v1/namespaces/{namespace}/deployments/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Deployment, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Deployment): OK

201 (}}">Deployment): Created

401: Unauthorized


### `patch` partially update the specified Deployment

#### HTTP Request

PATCH /apis/apps/v1/namespaces/{namespace}/deployments/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


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


200 (}}">Deployment): OK

201 (}}">Deployment): Created

401: Unauthorized


### `patch` partially update status of the specified Deployment

#### HTTP Request

PATCH /apis/apps/v1/namespaces/{namespace}/deployments/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


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


200 (}}">Deployment): OK

201 (}}">Deployment): Created

401: Unauthorized


### `delete` delete a Deployment

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/deployments/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Deployment


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


### `deletecollection` delete collection of Deployment

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/deployments

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

