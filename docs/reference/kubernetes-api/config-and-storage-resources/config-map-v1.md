---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "ConfigMap"
content_type: "api_reference"
description: "ConfigMap holds configuration data for pods to consume."
title: "ConfigMap"
weight: 1
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## ConfigMap {#ConfigMap}

ConfigMap holds configuration data for pods to consume.



- **apiVersion**: v1


- **kind**: ConfigMap


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **binaryData** (map[string][]byte)

  BinaryData contains the binary data. Each key must consist of alphanumeric characters, '-', '_' or '.'. BinaryData can contain byte sequences that are not in the UTF-8 range. The keys stored in BinaryData must not overlap with the ones in the Data field, this is enforced during validation process. Using this field will require 1.10+ apiserver and kubelet.

- **data** (map[string]string)

  Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'. Values with non-UTF-8 byte sequences must use the BinaryData field. The keys stored in Data must not overlap with the keys in the BinaryData field, this is enforced during validation process.

- **immutable** (boolean)

  Immutable, if set to true, ensures that data stored in the ConfigMap cannot be updated (only object metadata can be modified). If not set to true, the field can be modified at any time. Defaulted to nil.





## ConfigMapList {#ConfigMapList}

ConfigMapList is a resource containing a list of ConfigMap objects.



- **apiVersion**: v1


- **kind**: ConfigMapList


- **metadata** (}}">ListMeta)

  More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **items** ([]}}">ConfigMap), required

  Items is the list of ConfigMaps.





## Operations {#Operations}










### `get` read the specified ConfigMap

#### HTTP Request

GET /api/v1/namespaces/{namespace}/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ConfigMap): OK

401: Unauthorized


### `list` list or watch objects of kind ConfigMap

#### HTTP Request

GET /api/v1/namespaces/{namespace}/configmaps

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


200 (}}">ConfigMapList): OK

401: Unauthorized


### `list` list or watch objects of kind ConfigMap

#### HTTP Request

GET /api/v1/configmaps

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


200 (}}">ConfigMapList): OK

401: Unauthorized


### `create` create a ConfigMap

#### HTTP Request

POST /api/v1/namespaces/{namespace}/configmaps

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ConfigMap, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ConfigMap): OK

201 (}}">ConfigMap): Created

202 (}}">ConfigMap): Accepted

401: Unauthorized


### `update` replace the specified ConfigMap

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ConfigMap, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ConfigMap): OK

201 (}}">ConfigMap): Created

401: Unauthorized


### `patch` partially update the specified ConfigMap

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


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


200 (}}">ConfigMap): OK

201 (}}">ConfigMap): Created

401: Unauthorized


### `delete` delete a ConfigMap

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


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


### `deletecollection` delete collection of ConfigMap

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/configmaps

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

