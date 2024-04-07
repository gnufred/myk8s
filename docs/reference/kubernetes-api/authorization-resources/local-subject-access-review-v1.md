---
api_metadata:
  apiVersion: "authorization.k8s.io/v1"
  import: "k8s.io/api/authorization/v1"
  kind: "LocalSubjectAccessReview"
content_type: "api_reference"
description: "LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace."
title: "LocalSubjectAccessReview"
weight: 1
auto_generated: true
---



`apiVersion: authorization.k8s.io/v1`

`import "k8s.io/api/authorization/v1"`


## LocalSubjectAccessReview {#LocalSubjectAccessReview}

LocalSubjectAccessReview checks whether or not a user or group can perform an action in a given namespace. Having a namespace scoped resource makes it much easier to grant namespace scoped policy that includes permissions checking.



- **apiVersion**: authorization.k8s.io/v1


- **kind**: LocalSubjectAccessReview


- **metadata** (}}">ObjectMeta)

  Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

- **spec** (}}">SubjectAccessReviewSpec), required

  Spec holds information about the request being evaluated.  spec.namespace must be equal to the namespace you made the request against.  If empty, it is defaulted.

- **status** (}}">SubjectAccessReviewStatus)

  Status is filled in by the server and indicates whether the request is allowed or not





## Operations {#Operations}










### `create` create a LocalSubjectAccessReview

#### HTTP Request

POST /apis/authorization.k8s.io/v1/namespaces/{namespace}/localsubjectaccessreviews

#### Parameters


- **namespace** (*in path*): string, required

  }}">namespace


- **body**: }}">LocalSubjectAccessReview, required

  


- **dryRun** (*in query*): string

  }}">dryRun


- **fieldManager** (*in query*): string

  }}">fieldManager


- **fieldValidation** (*in query*): string

  }}">fieldValidation


- **pretty** (*in query*): string

  }}">pretty



#### Response


200 (}}">LocalSubjectAccessReview): OK

201 (}}">LocalSubjectAccessReview): Created

202 (}}">LocalSubjectAccessReview): Accepted

401: Unauthorized

