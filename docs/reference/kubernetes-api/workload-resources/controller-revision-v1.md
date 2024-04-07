---
api_metadata:
  apiVersion: "apps/v1"
  import: "k8s.io/api/apps/v1"
  kind: "ControllerRevision"
content_type: "api_reference"
description: "ControllerRevision implements an immutable snapshot of state data."
title: "ControllerRevision"
weight: 7
auto_generated: true
---



`apiVersion: apps/v1`

`import "k8s.io/api/apps/v1"`


## ControllerRevision {#ControllerRevision}

ControllerRevision implements an immutable snapshot of state data. Clients are responsible for serializing and deserializing the objects that contain their internal state. Once a ControllerRevision has been successfully created, it can not be updated. The API Server will fail validation of all requests that attempt to mutate the Data field. ControllerRevisions may, however, be deleted. Note that, due to its use by both the DaemonSet and StatefulSet controllers for update and rollback, this object is beta. However, it may be subject to name and representation changes in future releases, and clients should not depend on its stability. It is primarily for internal use by controllers.



- **apiVersion**: apps/v1


- **kind**: ControllerRevision


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **revision** (int64), required

  Revision indicates the revision of the state represented by Data.

- **data** (RawExtension)

  Data is the serialized representation of the state.

  
  *RawExtension is used to hold extensions in external versions.
  
  To use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.
  
  // Internal package:
  
  	type MyAPIObject struct {
  		runtime.TypeMeta `json:",inline"`
  		MyPlugin runtime.Object `json:"myPlugin"`
  	}
  
  	type PluginA struct {
  		AOption string `json:"aOption"`
  	}
  
  // External package:
  
  	type MyAPIObject struct {
  		runtime.TypeMeta `json:",inline"`
  		MyPlugin runtime.RawExtension `json:"myPlugin"`
  	}
  
  	type PluginA struct {
  		AOption string `json:"aOption"`
  	}
  
  // On the wire, the JSON will look something like this:
  
  	{
  		"kind":"MyAPIObject",
  		"apiVersion":"v1",
  		"myPlugin": {
  			"kind":"PluginA",
  			"aOption":"foo",
  		},
  	}
  
  So what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)*





## ControllerRevisionList {#ControllerRevisionList}

ControllerRevisionList is a resource containing a list of ControllerRevision objects.



- **apiVersion**: apps/v1


- **kind**: ControllerRevisionList


- **metadata** (}}">ListMeta)

  More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **items** ([]}}">ControllerRevision), required

  Items is the list of ControllerRevisions





## Operations {#Operations}










### `get` read the specified ControllerRevision

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/controllerrevisions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ControllerRevision


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ControllerRevision): OK

401: Unauthorized


### `list` list or watch objects of kind ControllerRevision

#### HTTP Request

GET /apis/apps/v1/namespaces/{namespace}/controllerrevisions

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


200 (}}">ControllerRevisionList): OK

401: Unauthorized


### `list` list or watch objects of kind ControllerRevision

#### HTTP Request

GET /apis/apps/v1/controllerrevisions

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


200 (}}">ControllerRevisionList): OK

401: Unauthorized


### `create` create a ControllerRevision

#### HTTP Request

POST /apis/apps/v1/namespaces/{namespace}/controllerrevisions

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ControllerRevision, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ControllerRevision): OK

201 (}}">ControllerRevision): Created

202 (}}">ControllerRevision): Accepted

401: Unauthorized


### `update` replace the specified ControllerRevision

#### HTTP Request

PUT /apis/apps/v1/namespaces/{namespace}/controllerrevisions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ControllerRevision


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">ControllerRevision, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ControllerRevision): OK

201 (}}">ControllerRevision): Created

401: Unauthorized


### `patch` partially update the specified ControllerRevision

#### HTTP Request

PATCH /apis/apps/v1/namespaces/{namespace}/controllerrevisions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ControllerRevision


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


200 (}}">ControllerRevision): OK

201 (}}">ControllerRevision): Created

401: Unauthorized


### `delete` delete a ControllerRevision

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/controllerrevisions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ControllerRevision


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


### `deletecollection` delete collection of ControllerRevision

#### HTTP Request

DELETE /apis/apps/v1/namespaces/{namespace}/controllerrevisions

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

