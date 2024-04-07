---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "Binding"
content_type: "api_reference"
description: "Binding ties one object to another; for example, a pod is bound to a node by a scheduler."
title: "Binding"
weight: 9
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## Binding {#Binding}

Binding ties one object to another; for example, a pod is bound to a node by a scheduler. Deprecated in 1.7, please use the bindings subresource of pods instead.



- **apiVersion**: v1


- **kind**: Binding


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **target** (}}">ObjectReference), required

  The target object that you want to bind to the standard object.





## Operations {#Operations}










### `create` create a Binding

#### HTTP Request

POST /api/v1/namespaces/{namespace}/bindings

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Binding, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Binding): OK

201 (}}">Binding): Created

202 (}}">Binding): Accepted

401: Unauthorized


### `create` create binding of a Pod

#### HTTP Request

POST /api/v1/namespaces/{namespace}/pods/{name}/binding

#### Parameters


- **name** (*in path*): string, required

  name of the Binding


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Binding, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Binding): OK

201 (}}">Binding): Created

202 (}}">Binding): Accepted

401: Unauthorized

