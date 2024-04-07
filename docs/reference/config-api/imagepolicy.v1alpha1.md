---
title: Image Policy API (v1alpha1)
content_type: tool-reference
package: imagepolicy.k8s.io/v1alpha1
auto_generated: true
---


## Resource Types 


- [ImageReview](#imagepolicy-k8s-io-v1alpha1-ImageReview)
  

## `ImageReview`     {#imagepolicy-k8s-io-v1alpha1-ImageReview}
    


ImageReview checks if the set of images in a pod are allowed.



FieldDescription

    
apiVersionstringimagepolicy.k8s.io/v1alpha1
kindstringImageReview
    
  
metadata
meta/v1.ObjectMeta


   Standard object's metadata.
More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
Refer to the Kubernetes API documentation for the fields of the metadata field.

spec [Required]
ImageReviewSpec


   Spec holds information about the pod being evaluated


status
ImageReviewStatus


   Status is filled in by the backend and indicates whether the pod should be allowed.





## `ImageReviewContainerSpec`     {#imagepolicy-k8s-io-v1alpha1-ImageReviewContainerSpec}
    

**Appears in:**

- [ImageReviewSpec](#imagepolicy-k8s-io-v1alpha1-ImageReviewSpec)


ImageReviewContainerSpec is a description of a container within the pod creation request.



FieldDescription

    
  
image
string


   This can be in the form image:tag or image@SHA:012345679abcdef.





## `ImageReviewSpec`     {#imagepolicy-k8s-io-v1alpha1-ImageReviewSpec}
    

**Appears in:**

- [ImageReview](#imagepolicy-k8s-io-v1alpha1-ImageReview)


ImageReviewSpec is a description of the pod creation request.



FieldDescription

    
  
containers
[]ImageReviewContainerSpec


   Containers is a list of a subset of the information in each container of the Pod being created.


annotations
map[string]string


   Annotations is a list of key-value pairs extracted from the Pod's annotations.
It only includes keys which match the pattern *.image-policy.k8s.io/*.
It is up to each webhook backend to determine how to interpret these annotations, if at all.


namespace
string


   Namespace is the namespace the pod is being created in.





## `ImageReviewStatus`     {#imagepolicy-k8s-io-v1alpha1-ImageReviewStatus}
    

**Appears in:**

- [ImageReview](#imagepolicy-k8s-io-v1alpha1-ImageReview)


ImageReviewStatus is the result of the review for the pod creation request.



FieldDescription

    
  
allowed [Required]
bool


   Allowed indicates that all images were allowed to be run.


reason
string


   Reason should be empty unless Allowed is false in which case it
may contain a short description of what is wrong.  Kubernetes
may truncate excessively long errors when displaying to the user.


auditAnnotations
map[string]string


   AuditAnnotations will be added to the attributes object of the
admission controller request using 'AddAnnotation'.  The keys should
be prefix-less (i.e., the admission controller will add an
appropriate prefix).




  