---
api_metadata:
  apiVersion: "v1"
  import: "k8s.io/api/core/v1"
  kind: "Endpoints"
content_type: "api_reference"
description: "Endpoints is a collection of endpoints that implement the actual service."
title: "Endpoints"
weight: 2
auto_generated: true
---



`apiVersion: v1`

`import "k8s.io/api/core/v1"`


## Endpoints {#Endpoints}

Endpoints is a collection of endpoints that implement the actual service. Example:

	 Name: "mysvc",
	 Subsets: [
	   {
	     Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
	     Ports: [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
	   },
	   {
	     Addresses: [{"ip": "10.10.3.3"}],
	     Ports: [{"name": "a", "port": 93}, {"name": "b", "port": 76}]
	   },
	]



- **apiVersion**: v1


- **kind**: Endpoints


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **subsets** ([]EndpointSubset)

  The set of all endpoints is the union of all subsets. Addresses are placed into subsets according to the IPs they share. A single address with multiple ports, some of which are ready and some of which are not (because they come from different containers) will result in the address being displayed in different subsets for the different ports. No address will appear in both Addresses and NotReadyAddresses in the same subset. Sets of addresses and ports that comprise a service.

  
  *EndpointSubset is a group of addresses with a common set of ports. The expanded set of endpoints is the Cartesian product of Addresses x Ports. For example, given:
  
  	{
  	  Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
  	  Ports:     [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
  	}
  
  The resulting set of endpoints can be viewed as:
  
  	a: [ 10.10.1.1:8675, 10.10.2.2:8675 ],
  	b: [ 10.10.1.1:309, 10.10.2.2:309 ]*

  - **subsets.addresses** ([]EndpointAddress)

    IP addresses which offer the related ports that are marked as ready. These endpoints should be considered safe for load balancers and clients to utilize.

    
    *EndpointAddress is a tuple that describes single IP address.*

    - **subsets.addresses.ip** (string), required

      The IP of this endpoint. May not be loopback (127.0.0.0/8 or ::1), link-local (169.254.0.0/16 or fe80::/10), or link-local multicast (224.0.0.0/24 or ff02::/16).

    - **subsets.addresses.hostname** (string)

      The Hostname of this endpoint

    - **subsets.addresses.nodeName** (string)

      Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.

    - **subsets.addresses.targetRef** (}}">ObjectReference)

      Reference to object providing the endpoint.

  - **subsets.notReadyAddresses** ([]EndpointAddress)

    IP addresses which offer the related ports but are not currently marked as ready because they have not yet finished starting, have recently failed a readiness check, or have recently failed a liveness check.

    
    *EndpointAddress is a tuple that describes single IP address.*

    - **subsets.notReadyAddresses.ip** (string), required

      The IP of this endpoint. May not be loopback (127.0.0.0/8 or ::1), link-local (169.254.0.0/16 or fe80::/10), or link-local multicast (224.0.0.0/24 or ff02::/16).

    - **subsets.notReadyAddresses.hostname** (string)

      The Hostname of this endpoint

    - **subsets.notReadyAddresses.nodeName** (string)

      Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.

    - **subsets.notReadyAddresses.targetRef** (}}">ObjectReference)

      Reference to object providing the endpoint.

  - **subsets.ports** ([]EndpointPort)

    Port numbers available on the related IP addresses.

    
    *EndpointPort is a tuple that describes a single port.*

    - **subsets.ports.port** (int32), required

      The port number of the endpoint.

    - **subsets.ports.protocol** (string)

      The IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.

    - **subsets.ports.name** (string)

      The name of this port.  This must match the 'name' field in the corresponding ServicePort. Must be a DNS_LABEL. Optional only if one port is defined.

    - **subsets.ports.appProtocol** (string)

      The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax. Valid values are either:
      
      * Un-prefixed protocol names - reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names).
      
      * Kubernetes-defined prefixed names:
        * 'kubernetes.io/h2c' - HTTP/2 over cleartext as described in https://www.rfc-editor.org/rfc/rfc7540
        * 'kubernetes.io/ws'  - WebSocket over cleartext as described in https://www.rfc-editor.org/rfc/rfc6455
        * 'kubernetes.io/wss' - WebSocket over TLS as described in https://www.rfc-editor.org/rfc/rfc6455
      
      * Other protocols should use implementation-defined prefixed names such as mycompany.com/my-custom-protocol.





## EndpointsList {#EndpointsList}

EndpointsList is a list of endpoints.



- **apiVersion**: v1


- **kind**: EndpointsList


- **metadata** (}}">ListMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

- **items** ([]}}">Endpoints), required

  List of endpoints.





## Operations {#Operations}










### `get` read the specified Endpoints

#### HTTP Request

GET /api/v1/namespaces/{namespace}/endpoints/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Endpoints


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Endpoints): OK

401: Unauthorized


### `list` list or watch objects of kind Endpoints

#### HTTP Request

GET /api/v1/namespaces/{namespace}/endpoints

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


200 (}}">EndpointsList): OK

401: Unauthorized


### `list` list or watch objects of kind Endpoints

#### HTTP Request

GET /api/v1/endpoints

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


200 (}}">EndpointsList): OK

401: Unauthorized


### `create` create Endpoints

#### HTTP Request

POST /api/v1/namespaces/{namespace}/endpoints

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Endpoints, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Endpoints): OK

201 (}}">Endpoints): Created

202 (}}">Endpoints): Accepted

401: Unauthorized


### `update` replace the specified Endpoints

#### HTTP Request

PUT /api/v1/namespaces/{namespace}/endpoints/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Endpoints


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">Endpoints, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">Endpoints): OK

201 (}}">Endpoints): Created

401: Unauthorized


### `patch` partially update the specified Endpoints

#### HTTP Request

PATCH /api/v1/namespaces/{namespace}/endpoints/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Endpoints


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


200 (}}">Endpoints): OK

201 (}}">Endpoints): Created

401: Unauthorized


### `delete` delete Endpoints

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/endpoints/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Endpoints


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


### `deletecollection` delete collection of Endpoints

#### HTTP Request

DELETE /api/v1/namespaces/{namespace}/endpoints

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

