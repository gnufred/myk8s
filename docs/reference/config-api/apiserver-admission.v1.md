---
title: kube-apiserver Admission (v1)
content_type: tool-reference
package: admission.k8s.io/v1
auto_generated: true
---


## Resource Types 


- [AdmissionReview](#admission-k8s-io-v1-AdmissionReview)
  

## `AdmissionReview`     {#admission-k8s-io-v1-AdmissionReview}
    


AdmissionReview describes an admission review request/response.



FieldDescription

    
apiVersionstringadmission.k8s.io/v1
kindstringAdmissionReview
    
  
request
AdmissionRequest


   Request describes the attributes for the admission request.


response
AdmissionResponse


   Response describes the attributes for the admission response.





## `AdmissionRequest`     {#admission-k8s-io-v1-AdmissionRequest}
    

**Appears in:**

- [AdmissionReview](#admission-k8s-io-v1-AdmissionReview)


AdmissionRequest describes the admission.Attributes for the admission request.



FieldDescription

    
  
uid [Required]
k8s.io/apimachinery/pkg/types.UID


   UID is an identifier for the individual request/response. It allows us to distinguish instances of requests which are
otherwise identical (parallel requests, requests when earlier requests did not modify etc)
The UID is meant to track the round trip (request/response) between the KAS and the WebHook, not the user request.
It is suitable for correlating log entries between the webhook and apiserver, for either auditing or debugging.


kind [Required]
meta/v1.GroupVersionKind


   Kind is the fully-qualified type of object being submitted (for example, v1.Pod or autoscaling.v1.Scale)


resource [Required]
meta/v1.GroupVersionResource


   Resource is the fully-qualified resource being requested (for example, v1.pods)


subResource
string


   SubResource is the subresource being requested, if any (for example, &quot;status&quot; or &quot;scale&quot;)


requestKind
meta/v1.GroupVersionKind


   RequestKind is the fully-qualified type of the original API request (for example, v1.Pod or autoscaling.v1.Scale).
If this is specified and differs from the value in &quot;kind&quot;, an equivalent match and conversion was performed.
For example, if deployments can be modified via apps/v1 and apps/v1beta1, and a webhook registered a rule of
apiGroups:[&quot;apps&quot;], apiVersions:[&quot;v1&quot;], resources: [&quot;deployments&quot;] and matchPolicy: Equivalent,
an API request to apps/v1beta1 deployments would be converted and sent to the webhook
with kind: {group:&quot;apps&quot;, version:&quot;v1&quot;, kind:&quot;Deployment&quot;} (matching the rule the webhook registered for),
and requestKind: {group:&quot;apps&quot;, version:&quot;v1beta1&quot;, kind:&quot;Deployment&quot;} (indicating the kind of the original API request).
See documentation for the &quot;matchPolicy&quot; field in the webhook configuration type for more details.


requestResource
meta/v1.GroupVersionResource


   RequestResource is the fully-qualified resource of the original API request (for example, v1.pods).
If this is specified and differs from the value in &quot;resource&quot;, an equivalent match and conversion was performed.
For example, if deployments can be modified via apps/v1 and apps/v1beta1, and a webhook registered a rule of
apiGroups:[&quot;apps&quot;], apiVersions:[&quot;v1&quot;], resources: [&quot;deployments&quot;] and matchPolicy: Equivalent,
an API request to apps/v1beta1 deployments would be converted and sent to the webhook
with resource: {group:&quot;apps&quot;, version:&quot;v1&quot;, resource:&quot;deployments&quot;} (matching the resource the webhook registered for),
and requestResource: {group:&quot;apps&quot;, version:&quot;v1beta1&quot;, resource:&quot;deployments&quot;} (indicating the resource of the original API request).
See documentation for the &quot;matchPolicy&quot; field in the webhook configuration type.


requestSubResource
string


   RequestSubResource is the name of the subresource of the original API request, if any (for example, &quot;status&quot; or &quot;scale&quot;)
If this is specified and differs from the value in &quot;subResource&quot;, an equivalent match and conversion was performed.
See documentation for the &quot;matchPolicy&quot; field in the webhook configuration type.


name
string


   Name is the name of the object as presented in the request.  On a CREATE operation, the client may omit name and
rely on the server to generate the name.  If that is the case, this field will contain an empty string.


namespace
string


   Namespace is the namespace associated with the request (if any).


operation [Required]
Operation


   Operation is the operation being performed. This may be different than the operation
requested. e.g. a patch can result in either a CREATE or UPDATE Operation.


userInfo [Required]
authentication/v1.UserInfo


   UserInfo is information about the requesting user


object
k8s.io/apimachinery/pkg/runtime.RawExtension


   Object is the object from the incoming request.


oldObject
k8s.io/apimachinery/pkg/runtime.RawExtension


   OldObject is the existing object. Only populated for DELETE and UPDATE requests.


dryRun
bool


   DryRun indicates that modifications will definitely not be persisted for this request.
Defaults to false.


options
k8s.io/apimachinery/pkg/runtime.RawExtension


   Options is the operation option structure of the operation being performed.
e.g. meta.k8s.io/v1.DeleteOptions or meta.k8s.io/v1.CreateOptions. This may be
different than the options the caller provided. e.g. for a patch request the performed
Operation might be a CREATE, in which case the Options will a
meta.k8s.io/v1.CreateOptions even though the caller provided meta.k8s.io/v1.PatchOptions.





## `AdmissionResponse`     {#admission-k8s-io-v1-AdmissionResponse}
    

**Appears in:**

- [AdmissionReview](#admission-k8s-io-v1-AdmissionReview)


AdmissionResponse describes an admission response.



FieldDescription

    
  
uid [Required]
k8s.io/apimachinery/pkg/types.UID


   UID is an identifier for the individual request/response.
This must be copied over from the corresponding AdmissionRequest.


allowed [Required]
bool


   Allowed indicates whether or not the admission request was permitted.


status
meta/v1.Status


   Result contains extra details into why an admission request was denied.
This field IS NOT consulted in any way if &quot;Allowed&quot; is &quot;true&quot;.


patch
[]byte


   The patch body. Currently we only support &quot;JSONPatch&quot; which implements RFC 6902.


patchType
PatchType


   The type of Patch. Currently we only allow &quot;JSONPatch&quot;.


auditAnnotations
map[string]string


   AuditAnnotations is an unstructured key value map set by remote admission controller (e.g. error=image-blacklisted).
MutatingAdmissionWebhook and ValidatingAdmissionWebhook admission controller will prefix the keys with
admission webhook name (e.g. imagepolicy.example.com/error=image-blacklisted). AuditAnnotations will be provided by
the admission webhook to add additional context to the audit log for this request.


warnings
[]string


   warnings is a list of warning messages to return to the requesting API client.
Warning messages describe a problem the client making the API request should correct or be aware of.
Limit warnings to 120 characters if possible.
Warnings over 256 characters and large numbers of warnings may be truncated.





## `Operation`     {#admission-k8s-io-v1-Operation}
    
(Alias of `string`)

**Appears in:**

- [AdmissionRequest](#admission-k8s-io-v1-AdmissionRequest)


Operation is the type of resource operation being checked for admission control




## `PatchType`     {#admission-k8s-io-v1-PatchType}
    
(Alias of `string`)

**Appears in:**

- [AdmissionResponse](#admission-k8s-io-v1-AdmissionResponse)


PatchType is the type of patch being used to represent the mutated object



  