---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "Secret"
content_type: "api_reference"
description: "Secret holds secret data of a certain type."
title: "Secret"
weight: 2
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## Secret {#Secret}

Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.



- **apiVersion**: v1


- **kind**: Secret


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **data** (map[string][]byte)

  Data contains the secret data. Each key must consist of alphanumeric characters, '-', '_' or '.'. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4

- **immutable** (boolean)

  Immutable, if set to true, ensures that data stored in the Secret cannot be updated (only object metadata can be modified). If not set to true, the field can be modified at any time. Defaulted to nil.

- **stringData** (map[string]string)

  stringData allows specifying non-binary secret data in string form. It is provided as a write-only input field for convenience. All keys and values are merged into the data field on write, overwriting any existing values. The stringData field is never output when reading from the API.

- **type** (string)

  Used to facilitate programmatic handling of secret data. More info: https://kubernetes.io/docs/concepts/configuration/secret/#secret-types





## SecretList {#SecretList}

SecretList is a list of Secret.



- **apiVersion**: v1


- **kind**: SecretList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">Secret), required

  Items is a list of secret objects. More info: https://kubernetes.io/docs/concepts/configuration/secret





## Operations {#Operations}










### `get` read the specified Secret

#### HTTP Request

GET /api/v1/namespaces/{namespace}/secrets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Secret


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Secret): OK

401: Unauthorized


### `list` list or watch objects of kind Secret

#### HTTP Request

GET /api/v1/namespaces/{namespace}/secrets

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


200 (}}">SecretList): OK

401: Unauthorized


### `list` list or watch objects of kind Secret

#### HTTP Request

GET /api/v1/secrets

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


200 (}}">SecretList): OK

401: Unauthorized


### `create` create a Secret

#### HTTP Request

POST /api/v1/namespaces/{namespace}/secrets

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Secret, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Secret): OK

201 (}}">Secret): Created

202 (}}">Secret): Accepted

401: Unauthorized


### `update` replace the specified Secret

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/secrets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Secret


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Secret, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Secret): OK

201 (}}">Secret): Created

401: Unauthorized


### `patch` partially update the specified Secret

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/secrets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Secret


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


200 (}}">Secret): OK

201 (}}">Secret): Created

401: Unauthorized


### `delete` delete a Secret

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/secrets/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Secret


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


### `deletecollection` delete collection of Secret

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/secrets

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

