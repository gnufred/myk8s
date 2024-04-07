---
api_metadata:
  apiVersion: "batch/v1"
  import: "k8s.io/api/batch/v1"
  kind: "CronJob"
content_type: "api_reference"
description: "CronJob represents the configuration of a single cron job."
title: "CronJob"
weight: 10
auto_generated: true
---



`apiVersion: batch/v1`

`import "k8s.io/api/batch/v1"`


## CronJob {#CronJob}

CronJob represents the configuration of a single cron job.



- **apiVersion**: batch/v1


- **kind**: CronJob


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">CronJobSpec)

  Specification of the desired behavior of a cron job, including the schedule. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

- **status** (}}">CronJobStatus)

  Current status of a cron job. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## CronJobSpec {#CronJobSpec}

CronJobSpec describes how the job execution will look like and when it will actually run.



- **jobTemplate** (JobTemplateSpec), required

  Specifies the job that will be created when executing a CronJob.

  
  *JobTemplateSpec describes the data a Job should have when created from a template*

  - **jobTemplate.metadata** (}}">ObjectMeta)

    Standard object's metadata of the jobs created from this template. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

  - **jobTemplate.spec** (}}">JobSpec)

    Specification of the desired behavior of the job. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

- **schedule** (string), required

  The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.

- **timeZone** (string)

  The time zone name for the given schedule, see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones. If not specified, this will default to the time zone of the kube-controller-manager process. The set of valid time zone names and the time zone offset is loaded from the system-wide time zone database by the API server during CronJob validation and the controller manager during execution. If no system-wide time zone database can be found a bundled version of the database is used instead. If the time zone name becomes invalid during the lifetime of a CronJob or due to a change in host configuration, the controller will stop creating new new Jobs and will create a system event with the reason UnknownTimeZone. More information can be found in https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#time-zones

- **concurrencyPolicy** (string)

  Specifies how to treat concurrent executions of a Job. Valid values are:
  
  - "Allow" (default): allows CronJobs to run concurrently; - "Forbid": forbids concurrent runs, skipping next run if previous run hasn't finished yet; - "Replace": cancels currently running job and replaces it with a new one

- **startingDeadlineSeconds** (int64)

  Optional deadline in seconds for starting the job if it misses scheduled time for any reason.  Missed jobs executions will be counted as failed ones.

- **suspend** (boolean)

  This flag tells the controller to suspend subsequent executions, it does not apply to already started executions.  Defaults to false.

- **successfulJobsHistoryLimit** (int32)

  The number of successful finished jobs to retain. Value must be non-negative integer. Defaults to 3.

- **failedJobsHistoryLimit** (int32)

  The number of failed finished jobs to retain. Value must be non-negative integer. Defaults to 1.





## CronJobStatus {#CronJobStatus}

CronJobStatus represents the current state of a cron job.



- **active** ([]}}">ObjectReference)

  *Atomic: will be replaced during a merge*
  
  A list of pointers to currently running jobs.

- **lastScheduleTime** (Time)

  Information when was the last time the job was successfully scheduled.

  
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **lastSuccessfulTime** (Time)

  Information when was the last time the job successfully completed.

  
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*





## CronJobList {#CronJobList}

CronJobList is a collection of cron jobs.



- **apiVersion**: batch/v1


- **kind**: CronJobList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **items** ([]}}">CronJob), required

  items is the list of CronJobs.





## Operations {#Operations}










### `get` read the specified CronJob

#### HTTP Request

GET /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">CronJob): OK

401: Unauthorized


### `get` read status of the specified CronJob

#### HTTP Request

GET /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">CronJob): OK

401: Unauthorized


### `list` list or watch objects of kind CronJob

#### HTTP Request

GET /apis/batch/v1/namespaces/{namespace}/cronjobs

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


200 (}}">CronJobList): OK

401: Unauthorized


### `list` list or watch objects of kind CronJob

#### HTTP Request

GET /apis/batch/v1/cronjobs

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


200 (}}">CronJobList): OK

401: Unauthorized


### `create` create a CronJob

#### HTTP Request

POST /apis/batch/v1/namespaces/{namespace}/cronjobs

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">CronJob, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">CronJob): OK

201 (}}">CronJob): Created

202 (}}">CronJob): Accepted

401: Unauthorized


### `update` replace the specified CronJob

#### HTTP Request

PUT /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">CronJob, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">CronJob): OK

201 (}}">CronJob): Created

401: Unauthorized


### `update` replace status of the specified CronJob

#### HTTP Request

PUT /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">CronJob, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">CronJob): OK

201 (}}">CronJob): Created

401: Unauthorized


### `patch` partially update the specified CronJob

#### HTTP Request

PATCH /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


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


200 (}}">CronJob): OK

201 (}}">CronJob): Created

401: Unauthorized


### `patch` partially update status of the specified CronJob

#### HTTP Request

PATCH /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


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


200 (}}">CronJob): OK

201 (}}">CronJob): Created

401: Unauthorized


### `delete` delete a CronJob

#### HTTP Request

DELETE /apis/batch/v1/namespaces/{namespace}/cronjobs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the CronJob


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


### `deletecollection` delete collection of CronJob

#### HTTP Request

DELETE /apis/batch/v1/namespaces/{namespace}/cronjobs

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

