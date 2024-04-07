---
api_metadata:
  apiVersion: "networking.k8s.io/v1alpha1"
  import: "k8s.io/api/networking/v1alpha1"
  kind: "ClusterCIDR"
content_type: "api_reference"
description: "ClusterCIDR represents a single configuration for per-Node Pod CIDR allocations when the MultiCIDRRangeAllocator is enabled (see the config for kube-controller-manager)."
title: "ClusterCIDR v1alpha1"
weight: 11
auto_generated: true
---



`apiVersion: networking.k8s.io/v1alpha1`

`import "k8s.io/api/networking/v1alpha1"`


## ClusterCIDR {#ClusterCIDR}

ClusterCIDR represents a single configuration for per-Node Pod CIDR allocations when the MultiCIDRRangeAllocator is enabled (see the config for kube-controller-manager).  A cluster may have any number of ClusterCIDR resources, all of which will be considered when allocating a CIDR for a Node.  A ClusterCIDR is eligible to be used for a given Node when the node selector matches the node in question and has free CIDRs to allocate.  In case of multiple matching ClusterCIDR resources, the allocator will attempt to break ties using internal heuristics, but any ClusterCIDR whose node selector matches the Node may be used.



- **apiVersion**: networking.k8s.io/v1alpha1


- **kind**: ClusterCIDR


- **metadata** (}}">ObjectMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">ClusterCIDRSpec)

  spec is the desired state of the ClusterCIDR. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status





## ClusterCIDRSpec {#ClusterCIDRSpec}

ClusterCIDRSpec defines the desired state of ClusterCIDR.



- **perNodeHostBits** (int32), required

  perNodeHostBits defines the number of host bits to be configured per node. A subnet mask determines how much of the address is used for network bits and host bits. For example an IPv4 address of 192.168.0.0/24, splits the address into 24 bits for the network portion and 8 bits for the host portion. To allocate 256 IPs, set this field to 8 (a /24 mask for IPv4 or a /120 for IPv6). Minimum value is 4 (16 IPs). This field is immutable.

- **ipv4** (string)

  ipv4 defines an IPv4 IP block in CIDR notation(e.g. "10.0.0.0/8"). At least one of ipv4 and ipv6 must be specified. This field is immutable.

- **ipv6** (string)

  ipv6 defines an IPv6 IP block in CIDR notation(e.g. "2001:db8::/64"). At least one of ipv4 and ipv6 must be specified. This field is immutable.

- **nodeSelector** (NodeSelector)

  nodeSelector defines which nodes the config is applicable to. An empty or nil nodeSelector selects all nodes. This field is immutable.

  
  *A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.*

  - **nodeSelector.nodeSelectorTerms** ([]NodeSelectorTerm), required

    Required. A list of node selector terms. The terms are ORed.

    
    *A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.*

    - **nodeSelector.nodeSelectorTerms.matchExpressions** ([]}}">NodeSelectorRequirement)

      A list of node selector requirements by node's labels.

    - **nodeSelector.nodeSelectorTerms.matchFields** ([]}}">NodeSelectorRequirement)

      A list of node selector requirements by node's fields.





## ClusterCIDRList {#ClusterCIDRList}

ClusterCIDRList contains a list of ClusterCIDR.



- **apiVersion**: networking.k8s.io/v1alpha1


- **kind**: ClusterCIDRList


- **metadata** (}}">ListMeta)

  Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **items** ([]}}">ClusterCIDR), required

  items is the list of ClusterCIDRs.





## Operations {#Operations}










### `get` read the specified ClusterCIDR

#### HTTP Request

GET /apis/networking.k8s.io/v1alpha1/clustercidrs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ClusterCIDR


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ClusterCIDR): OK

401: Unauthorized


### `list` list or watch objects of kind ClusterCIDR

#### HTTP Request

GET /apis/networking.k8s.io/v1alpha1/clustercidrs

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


200 (}}">ClusterCIDRList): OK

401: Unauthorized


### `create` create a ClusterCIDR

#### HTTP Request

POST /apis/networking.k8s.io/v1alpha1/clustercidrs

#### Parameters


- **body**: }}">ClusterCIDR, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ClusterCIDR): OK

201 (}}">ClusterCIDR): Created

202 (}}">ClusterCIDR): Accepted

401: Unauthorized


### `update` replace the specified ClusterCIDR

#### HTTP Request

PUT /apis/networking.k8s.io/v1alpha1/clustercidrs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ClusterCIDR


- **body**: }}">ClusterCIDR, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">ClusterCIDR): OK

201 (}}">ClusterCIDR): Created

401: Unauthorized


### `patch` partially update the specified ClusterCIDR

#### HTTP Request

PATCH /apis/networking.k8s.io/v1alpha1/clustercidrs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ClusterCIDR


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


200 (}}">ClusterCIDR): OK

201 (}}">ClusterCIDR): Created

401: Unauthorized


### `delete` delete a ClusterCIDR

#### HTTP Request

DELETE /apis/networking.k8s.io/v1alpha1/clustercidrs/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ClusterCIDR


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


### `deletecollection` delete collection of ClusterCIDR

#### HTTP Request

DELETE /apis/networking.k8s.io/v1alpha1/clustercidrs

#### Parameters


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

