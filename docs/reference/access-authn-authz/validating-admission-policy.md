---
reviewers:
- liggitt
- jpbetz
- cici37
title: Validating Admission Policy
content_type: concept
---



{{}}

This page provides an overview of Validating Admission Policy.




## What is Validating Admission Policy?

Validating admission policies offer a declarative, in-process alternative to validating admission webhooks.

Validating admission policies use the Common Expression Language (CEL) to declare the validation
rules of a policy. 
Validation admission policies are highly configurable, enabling policy authors to define policies
that can be parameterized and scoped to resources as needed by cluster administrators.

## What Resources Make a Policy

A policy is generally made up of three resources:

- The `ValidatingAdmissionPolicy` describes the abstract logic of a policy
  (think: "this policy makes sure a particular label is set to a particular value").

- A `ValidatingAdmissionPolicyBinding` links the above resources together and provides scoping.
  If you only want to require an `owner` label to be set for `Pods`, the binding is where you would
  specify this restriction.

- A parameter resource provides information to a ValidatingAdmissionPolicy to make it a concrete
  statement (think "the `owner` label must be set to something that ends in `.company.com`").
  A native type such as ConfigMap or a CRD defines the schema of a parameter resource.
  `ValidatingAdmissionPolicy` objects specify what Kind they are expecting for their parameter resource.

At least a `ValidatingAdmissionPolicy` and a corresponding  `ValidatingAdmissionPolicyBinding`
must be defined for a policy to have an effect.

If a `ValidatingAdmissionPolicy` does not need to be configured via parameters, simply leave
`spec.paramKind` in  `ValidatingAdmissionPolicy` not specified.

## {{% heading "prerequisites" %}}

- Ensure the `ValidatingAdmissionPolicy` [feature gate](/docs/reference/command-line-tools-reference/feature-gates/) is enabled.
- Ensure that the `admissionregistration.k8s.io/v1beta1` API is enabled.

## Getting Started with Validating Admission Policy

Validating Admission Policy is part of the cluster control-plane. You should write and deploy them
with great caution. The following describes how to quickly experiment with Validating Admission Policy.

### Creating a ValidatingAdmissionPolicy

The following is an example of a ValidatingAdmissionPolicy.

{{% code_sample language="yaml" file="validatingadmissionpolicy/basic-example-policy.yaml" %}}

`spec.validations` contains CEL expressions which use the [Common Expression Language (CEL)](https://github.com/google/cel-spec)
to validate the request. If an expression evaluates to false, the validation check is enforced
according to the `spec.failurePolicy` field.

{{}}
You can quickly test CEL expressions in [CEL Playground](https://playcel.undistro.io).
{{}}

To configure a validating admission policy for use in a cluster, a binding is required.
The following is an example of a ValidatingAdmissionPolicyBinding.:

{{% code_sample language="yaml" file="validatingadmissionpolicy/basic-example-binding.yaml" %}}

When trying to create a deployment with replicas set not satisfying the validation expression, an
error will return containing message:

```none
ValidatingAdmissionPolicy 'demo-policy.example.com' with binding 'demo-binding-test.example.com' denied request: failed expression: object.spec.replicas = 5 && params.optionalNumber }} for more information on how label selectors match resources.

If multiple parameters are found to meet the condition, the policy's rules are
evaluated for each parameter found and the results will be ANDed together.

If `namespace` is provided, only objects of the `paramKind` in the provided
namespace are eligible for selection. Otherwise, when `namespace` is empty and 
`paramKind` is namespace-scoped, the `namespace` used in the request being 
admitted will be used.

#### Authorization checks {#authorization-check} 

We introduced the authorization check for parameter resources.
User is expected to have `read` access to the resources referenced by `paramKind` in
`ValidatingAdmissionPolicy` and `paramRef` in `ValidatingAdmissionPolicyBinding`.

Note that if a resource in `paramKind` fails resolving via the restmapper, `read` access to all
resources of groups is required.

### Failure Policy

`failurePolicy` defines how mis-configurations and CEL expressions evaluating to error from the
admission policy are handled. Allowed values are `Ignore` or `Fail`.

- `Ignore` means that an error calling the ValidatingAdmissionPolicy is ignored and the API
  request is allowed to continue.
- `Fail` means that an error calling the ValidatingAdmissionPolicy causes the admission to fail
  and the API request to be rejected.

Note that the `failurePolicy` is defined inside `ValidatingAdmissionPolicy`:

{{% code_sample language="yaml" file="validatingadmissionpolicy/failure-policy-ignore.yaml" %}}

### Validation Expression

`spec.validations[i].expression` represents the expression which will be evaluated by CEL.
To learn more, see the [CEL language specification](https://github.com/google/cel-spec)
CEL expressions have access to the contents of the Admission request/response, organized into CEL
variables as well as some other useful variables:

- 'object' - The object from the incoming request. The value is null for DELETE requests.
- 'oldObject' - The existing object. The value is null for CREATE requests.
- 'request' - Attributes of the [admission request](/docs/reference/config-api/apiserver-admission.v1/#admission-k8s-io-v1-AdmissionRequest).
- 'params' - Parameter resource referred to by the policy binding being evaluated. The value is
  null if `ParamKind` is not specified.
- `namespaceObject` - The namespace, as a Kubernetes resource, that the incoming object belongs to.
  The value is null if the incoming object is cluster-scoped.
- `authorizer` - A CEL Authorizer. May be used to perform authorization checks for the principal
  (authenticated user) of the request. See
  [Authz](https://pkg.go.dev/k8s.io/apiserver/pkg/cel/library#Authz) in the Kubernetes CEL library
  documentation for more details.
- `authorizer.requestResource` - A shortcut for an authorization check configured with the request
  resource (group, resource, (subresource), namespace, name).
	
The `apiVersion`, `kind`, `metadata.name` and `metadata.generateName` are always accessible from
the root of the object. No other metadata properties are accessible.
	
Equality on arrays with list type of 'set' or 'map' ignores element order, i.e. [1, 2] == [2, 1].
Concatenation on arrays with x-kubernetes-list-type use the semantics of the list type:

- 'set': `X + Y` performs a union where the array positions of all elements in `X` are preserved and
  non-intersecting elements in `Y` are appended, retaining their partial order.
- 'map': `X + Y` performs a merge where the array positions of all keys in `X` are preserved but the values
  are overwritten by values in `Y` when the key sets of `X` and `Y` intersect. Elements in `Y` with
  non-intersecting keys are appended, retaining their partial order.

#### Validation expression examples

| Expression                                                                                   | Purpose                                                                           |
|----------------------------------------------------------------------------------------------| ------------                                                                      |
| `object.minReplicas !('MY_KEY' in object.map1) &#124;&#124; object['MY_KEY'].matches('^[a-zA-Z]*$') | Validate the value of a map for a specific key, if it is in the map               |
| `object.envars.filter(e, e.name == 'MY_ENV').all(e, e.value.matches('^[a-zA-Z]*$')`          | Validate the 'value' field of a listMap entry where key field 'name' is 'MY_ENV'  |
| `has(object.expired) && object.created + object.ttl }}

The status will yield the following information:

```yaml
status:
  typeChecking:
    expressionWarnings:
    - fieldRef: spec.validations[0].expression
      warning: |-
        apps/v1, Kind=Deployment: ERROR: :1:7: undefined field 'replicas'
         | object.replicas > 1
         | ......^
```

If multiple resources are matched in `spec.matchConstraints`, all of matched resources will be checked against.
For example, the following policy definition 

{{% code_sample language="yaml" file="validatingadmissionpolicy/typechecking-multiple-match.yaml" %}}


will have multiple types and type checking result of each type in the warning message.

```yaml
status:
  typeChecking:
    expressionWarnings:
    - fieldRef: spec.validations[0].expression
      warning: |-
        apps/v1, Kind=Deployment: ERROR: :1:7: undefined field 'replicas'
         | object.replicas > 1
         | ......^
        apps/v1, Kind=ReplicaSet: ERROR: :1:7: undefined field 'replicas'
         | object.replicas > 1
         | ......^
```

Type Checking has the following limitation:

- No wildcard matching. If `spec.matchConstraints.resourceRules` contains `"*"` in any of `apiGroups`, `apiVersions` or `resources`,
  the types that `"*"` matches will not be checked.
- The number of matched types is limited to 10. This is to prevent a policy that manually specifying too many types.
  to consume excessive computing resources. In the order of ascending group, version, and then resource, 11th combination and beyond are ignored.
- Type Checking does not affect the policy behavior in any way. Even if the type checking detects errors, the policy will continue
  to evaluate. If errors do occur during evaluate, the failure policy will decide its outcome.
- Type Checking does not apply to CRDs, including matched CRD types and reference of paramKind. The support for CRDs will come in future release.

### Variable composition

If an expression grows too complicated, or part of the expression is reusable and computationally expensive to evaluate,
you can extract some part of the expressions into variables. A variable is a named expression that can be referred later
in `variables` in other expressions.

```yaml
spec:
  variables:
    - name: foo
      expression: "'foo' in object.spec.metadata.labels ? object.spec.metadata.labels['foo'] : 'default'"
  validations:
    - expression: variables.foo == 'bar'
```

A variable is lazily evaluated when it is first referred. Any error that occurs during the evaluation will be
reported during the evaluation of the referring expression. Both the result and potential error are memorized and
count only once towards the runtime cost.

The order of variables are important because a variable can refer to other variables that are defined before it.
This ordering prevents circular references.

The following is a more complex example of enforcing that image repo names match the environment defined in its namespace.

{{}}

With the policy bound to the namespace `default`, which is labeled `environment: prod`,
the following attempt to create a deployment would be rejected.
```shell
kubectl create deploy --image=dev.example.com/nginx invalid
```
The error message is similar to this.
```console
error: failed to create deployment: deployments.apps "invalid" is forbidden: ValidatingAdmissionPolicy 'image-matches-namespace-environment.policy.example.com' with binding 'demo-binding-test.example.com' denied request: only prod images are allowed in namespace default
```
