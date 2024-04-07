---
api_metadata:
  apiVersion: "authorization.k8s.io/v1"
  import: "k8s.io/api/authorization/v1"
  kind: "SelfSubjectAccessReview"
content_type: "api_reference"
description: "SelfSubjectAccessReview checks whether or the current user can perform an action."
title: "SelfSubjectAccessReview"
weight: 2
auto_generated: true
---



`apiVersion: authorization.k8s.io/v1`

`import "k8s.io/api/authorization/v1"`


## SelfSubjectAccessReview {#SelfSubjectAccessReview}

SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means "in all namespaces".  Self is a special case, because users should always be able to check whether they can perform an action



- **apiVersion**: authorization.k8s.io/v1


- **kind**: SelfSubjectAccessReview


- **metadata** (}}">ObjectMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">SelfSubjectAccessReviewSpec), required

  Spec holds information about the request being evaluated.  user and groups must be empty

- **status** (}}">SubjectAccessReviewStatus)

  Status is filled in by the server and indicates whether the request is allowed or not





## SelfSubjectAccessReviewSpec {#SelfSubjectAccessReviewSpec}

SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set



- **nonResourceAttributes** (NonResourceAttributes)

  NonResourceAttributes describes information for a non-resource access request

  
  *NonResourceAttributes includes the authorization attributes available for non-resource requests to the Authorizer interface*

  - **nonResourceAttributes.path** (string)

    Path is the URL path of the request

  - **nonResourceAttributes.verb** (string)

    Verb is the standard HTTP verb

- **resourceAttributes** (ResourceAttributes)

  ResourceAuthorizationAttributes describes information for a resource access request

  
  *ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface*

  - **resourceAttributes.group** (string)

    Group is the API Group of the Resource.  "*" means all.

  - **resourceAttributes.name** (string)

    Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.

  - **resourceAttributes.namespace** (string)

    Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview

  - **resourceAttributes.resource** (string)

    Resource is one of the existing resource types.  "*" means all.

  - **resourceAttributes.subresource** (string)

    Subresource is one of the existing resource types.  "" means none.

  - **resourceAttributes.verb** (string)

    Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.

  - **resourceAttributes.version** (string)

    Version is the API Version of the Resource.  "*" means all.





## Operations {#Operations}










### `create` create a SelfSubjectAccessReview

#### HTTP Request

POST /apis/authorization.k8s.io/v1/selfsubjectaccessreviews

#### Parameters


- **body**: }}">SelfSubjectAccessReview, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">SelfSubjectAccessReview): OK

201 (}}">SelfSubjectAccessReview): Created

202 (}}">SelfSubjectAccessReview): Accepted

401: Unauthorized

