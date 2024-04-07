---
api_metadata:
  apiVersion: "discovery.k8s.io/v1"
  import: "k8s.io/api/discovery/v1"
  kind: "EndpointSlice"
content_type: "api_reference"
description: "EndpointSlice represents a subset of the endpoints that implement a service."
title: "EndpointSlice"
weight: 3
auto_generated: true
---



`apiVersion: discovery.k8s.io/v1`

`import "k8s.io/api/discovery/v1"`


## EndpointSlice {#EndpointSlice}

EndpointSlice represents a subset of the endpoints that implement a service. For a given service there may be multiple EndpointSlice objects, selected by labels, which must be joined to produce the full set of endpoints.



- **apiVersion**: discovery.k8s.io/v1


- **kind**: EndpointSlice


- **metadata** (}}">ObjectMeta)

  Standard object's metadata.

- **addressType** (string), required

  addressType specifies the type of address carried by this EndpointSlice. All addresses in this slice must be the same type. This field is immutable after creation. The following address types are currently supported: * IPv4: Represents an IPv4 Address. * IPv6: Represents an IPv6 Address. * FQDN: Represents a Fully Qualified Domain Name.

- **endpoints** ([]Endpoint), required

  *Atomic: will be replaced during a merge*
  
  endpoints is a list of unique endpoints in this slice. Each slice may include a maximum of 1000 endpoints.

  
  *Endpoint represents a single logical "backend" implementing a service.*

  - **endpoints.addresses** ([]string), required

    *Set: unique values will be kept during a merge*
    
    addresses of this endpoint. The contents of this field are interpreted according to the corresponding EndpointSlice addressType field. Consumers must handle different types of addresses in the context of their own capabilities. This must contain at least one address but no more than 100. These are all assumed to be fungible and clients may choose to only use the first element. Refer to: https://issue.k8s.io/106267

  - **endpoints.conditions** (EndpointConditions)

    conditions contains information about the current status of the endpoint.

    
    *EndpointConditions represents the current condition of an endpoint.*

    - **endpoints.conditions.ready** (boolean)

      ready indicates that this endpoint is prepared to receive traffic, according to whatever system is managing the endpoint. A nil value indicates an unknown state. In most cases consumers should interpret this unknown state as ready. For compatibility reasons, ready should never be "true" for terminating endpoints, except when the normal readiness behavior is being explicitly overridden, for example when the associated Service has set the publishNotReadyAddresses flag.

    - **endpoints.conditions.serving** (boolean)

      serving is identical to ready except that it is set regardless of the terminating state of endpoints. This condition should be set to true for a ready endpoint that is terminating. If nil, consumers should defer to the ready condition.

    - **endpoints.conditions.terminating** (boolean)

      terminating indicates that this endpoint is terminating. A nil value indicates an unknown state. Consumers should interpret this unknown state to mean that the endpoint is not terminating.

  - **endpoints.deprecatedTopology** (map[string]string)

    deprecatedTopology contains topology information part of the v1beta1 API. This field is deprecated, and will be removed when the v1beta1 API is removed (no sooner than kubernetes v1.24).  While this field can hold values, it is not writable through the v1 API, and any attempts to write to it will be silently ignored. Topology information can be found in the zone and nodeName fields instead.

  - **endpoints.hints** (EndpointHints)

    hints contains information associated with how an endpoint should be consumed.

    
    *EndpointHints provides hints describing how an endpoint should be consumed.*

    - **endpoints.hints.forZones** ([]ForZone)

      *Atomic: will be replaced during a merge*
      
      forZones indicates the zone(s) this endpoint should be consumed by to enable topology aware routing.

      
      *ForZone provides information about which zones should consume this endpoint.*

      - **endpoints.hints.forZones.name** (string), required

        name represents the name of the zone.

  - **endpoints.hostname** (string)

    hostname of this endpoint. This field may be used by consumers of endpoints to distinguish endpoints from each other (e.g. in DNS names). Multiple endpoints which use the same hostname should be considered fungible (e.g. multiple A values in DNS). Must be lowercase and pass DNS Label (RFC 1123) validation.

  - **endpoints.nodeName** (string)

    nodeName represents the name of the Node hosting this endpoint. This can be used to determine endpoints local to a Node.

  - **endpoints.targetRef** (}}">ObjectReference)

    targetRef is a reference to a Kubernetes object that represents this endpoint.

  - **endpoints.zone** (string)

    zone is the name of the Zone this endpoint exists in.

- **ports** ([]EndpointPort)

  *Atomic: will be replaced during a merge*
  
  ports specifies the list of network ports exposed by each endpoint in this slice. Each port must have a unique name. When ports is empty, it indicates that there are no defined ports. When a port is defined with a nil port value, it indicates "all ports". Each slice may include a maximum of 100 ports.

  
  *EndpointPort represents a Port used by an EndpointSlice*

  - **ports.port** (int32)

    port represents the port number of the endpoint. If this is not specified, ports are not restricted and must be interpreted in the context of the specific consumer.

  - **ports.protocol** (string)

    protocol represents the IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.

  - **ports.name** (string)

    name represents the name of this port. All ports in an EndpointSlice must have a unique name. If the EndpointSlice is dervied from a Kubernetes service, this corresponds to the Service.ports[].name. Name must either be an empty string or pass DNS_LABEL validation: * must be no more than 63 characters long. * must consist of lower case alphanumeric characters or '-'. * must start and end with an alphanumeric character. Default is empty string.

  - **ports.appProtocol** (string)

    The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax. Valid values are either:
    
    * Un-prefixed protocol names - reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names).
    
    * Kubernetes-defined prefixed names:
      * 'kubernetes.io/h2c' - HTTP/2 over cleartext as described in https://www.rfc-editor.org/rfc/rfc7540
      * 'kubernetes.io/ws'  - WebSocket over cleartext as described in https://www.rfc-editor.org/rfc/rfc6455
      * 'kubernetes.io/wss' - WebSocket over TLS as described in https://www.rfc-editor.org/rfc/rfc6455
    
    * Other protocols should use implementation-defined prefixed names such as mycompany.com/my-custom-protocol.





## EndpointSliceList {#EndpointSliceList}

EndpointSliceList represents a list of endpoint slices



- **apiVersion**: discovery.k8s.io/v1


- **kind**: EndpointSliceList


- **metadata** (}}">ListMeta)

  Standard list metadata.

- **items** ([]}}">EndpointSlice), required

  items is the list of endpoint slices





## Operations {#Operations}










### `get` read the specified EndpointSlice

#### HTTP Request

GET /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the EndpointSlice


- **namespace** (*in path*): string, required

  }}">namespace


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">EndpointSlice): OK

401: Unauthorized


### `list` list or watch objects of kind EndpointSlice

#### HTTP Request

GET /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices

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


200 (}}">EndpointSliceList): OK

401: Unauthorized


### `list` list or watch objects of kind EndpointSlice

#### HTTP Request

GET /apis/discovery.k8s.io/v1/endpointslices

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


200 (}}">EndpointSliceList): OK

401: Unauthorized


### `create` create an EndpointSlice

#### HTTP Request

POST /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">EndpointSlice, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">EndpointSlice): OK

201 (}}">EndpointSlice): Created

202 (}}">EndpointSlice): Accepted

401: Unauthorized


### `update` replace the specified EndpointSlice

#### HTTP Request

PUT /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the EndpointSlice


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">EndpointSlice, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">EndpointSlice): OK

201 (}}">EndpointSlice): Created

401: Unauthorized


### `patch` partially update the specified EndpointSlice

#### HTTP Request

PATCH /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the EndpointSlice


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


200 (}}">EndpointSlice): OK

201 (}}">EndpointSlice): Created

401: Unauthorized


### `delete` delete an EndpointSlice

#### HTTP Request

DELETE /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the EndpointSlice


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


### `deletecollection` delete collection of EndpointSlice

#### HTTP Request

DELETE /apis/discovery.k8s.io/v1/namespaces/{namespace}/endpointslices

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

