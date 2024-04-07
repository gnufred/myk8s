---
title: kube-apiserver Configuration (v1alpha1)
content_type: tool-reference
package: apiserver.k8s.io/v1alpha1
auto_generated: true
---
Package v1alpha1 is the v1alpha1 version of the API.


## Resource Types 


- [AdmissionConfiguration](#apiserver-k8s-io-v1alpha1-AdmissionConfiguration)
- [AuthenticationConfiguration](#apiserver-k8s-io-v1alpha1-AuthenticationConfiguration)
- [AuthorizationConfiguration](#apiserver-k8s-io-v1alpha1-AuthorizationConfiguration)
- [EgressSelectorConfiguration](#apiserver-k8s-io-v1alpha1-EgressSelectorConfiguration)
- [TracingConfiguration](#apiserver-k8s-io-v1alpha1-TracingConfiguration)
  
    
    

## `TracingConfiguration`     {#TracingConfiguration}
    

**Appears in:**

- [KubeletConfiguration](#kubelet-config-k8s-io-v1beta1-KubeletConfiguration)

- [TracingConfiguration](#apiserver-k8s-io-v1alpha1-TracingConfiguration)


TracingConfiguration provides versioned configuration for OpenTelemetry tracing clients.



FieldDescription

    
  
endpoint
string


   Endpoint of the collector this component will report traces to.
The connection is insecure, and does not currently support TLS.
Recommended is unset, and endpoint is the otlp grpc default, localhost:4317.


samplingRatePerMillion
int32


   SamplingRatePerMillion is the number of samples to collect per million spans.
Recommended is unset. If unset, sampler respects its parent span's sampling
rate, but otherwise never samples.




  

## `AdmissionConfiguration`     {#apiserver-k8s-io-v1alpha1-AdmissionConfiguration}
    


AdmissionConfiguration provides versioned configuration for admission controllers.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1alpha1
kindstringAdmissionConfiguration
    
  
plugins
[]AdmissionPluginConfiguration


   Plugins allows specifying a configuration per admission control plugin.





## `AuthenticationConfiguration`     {#apiserver-k8s-io-v1alpha1-AuthenticationConfiguration}
    


AuthenticationConfiguration provides versioned configuration for authentication.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1alpha1
kindstringAuthenticationConfiguration
    
  
jwt [Required]
[]JWTAuthenticator


   jwt is a list of authenticator to authenticate Kubernetes users using
JWT compliant tokens. The authenticator will attempt to parse a raw ID token,
verify it's been signed by the configured issuer. The public key to verify the
signature is discovered from the issuer's public endpoint using OIDC discovery.
For an incoming token, each JWT authenticator will be attempted in
the order in which it is specified in this list.  Note however that
other authenticators may run before or after the JWT authenticators.
The specific position of JWT authenticators in relation to other
authenticators is neither defined nor stable across releases.  Since
each JWT authenticator must have a unique issuer URL, at most one
JWT authenticator will attempt to cryptographically validate the token.





## `AuthorizationConfiguration`     {#apiserver-k8s-io-v1alpha1-AuthorizationConfiguration}
    




FieldDescription

    
apiVersionstringapiserver.k8s.io/v1alpha1
kindstringAuthorizationConfiguration
    
  
authorizers [Required]
[]AuthorizerConfiguration


   Authorizers is an ordered list of authorizers to
authorize requests against.
This is similar to the --authorization-modes kube-apiserver flag
Must be at least one.





## `EgressSelectorConfiguration`     {#apiserver-k8s-io-v1alpha1-EgressSelectorConfiguration}
    


EgressSelectorConfiguration provides versioned configuration for egress selector clients.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1alpha1
kindstringEgressSelectorConfiguration
    
  
egressSelections [Required]
[]EgressSelection


   connectionServices contains a list of egress selection client configurations





## `TracingConfiguration`     {#apiserver-k8s-io-v1alpha1-TracingConfiguration}
    


TracingConfiguration provides versioned configuration for tracing clients.



FieldDescription

    
apiVersionstringapiserver.k8s.io/v1alpha1
kindstringTracingConfiguration
    
  
TracingConfiguration [Required]
TracingConfiguration

(Members of TracingConfiguration are embedded into this type.)
   Embed the component config tracing configuration struct





## `AdmissionPluginConfiguration`     {#apiserver-k8s-io-v1alpha1-AdmissionPluginConfiguration}
    

**Appears in:**

- [AdmissionConfiguration](#apiserver-k8s-io-v1alpha1-AdmissionConfiguration)


AdmissionPluginConfiguration provides the configuration for a single plug-in.



FieldDescription

    
  
name [Required]
string


   Name is the name of the admission controller.
It must match the registered admission plugin name.


path
string


   Path is the path to a configuration file that contains the plugin's
configuration


configuration
k8s.io/apimachinery/pkg/runtime.Unknown


   Configuration is an embedded configuration object to be used as the plugin's
configuration. If present, it will be used instead of the path to the configuration file.





## `AuthorizerConfiguration`     {#apiserver-k8s-io-v1alpha1-AuthorizerConfiguration}
    

**Appears in:**

- [AuthorizationConfiguration](#apiserver-k8s-io-v1alpha1-AuthorizationConfiguration)




FieldDescription

    
  
type [Required]
string


   Type refers to the type of the authorizer
&quot;Webhook&quot; is supported in the generic API server
Other API servers may support additional authorizer
types like Node, RBAC, ABAC, etc.


name [Required]
string


   Name used to describe the webhook
This is explicitly used in monitoring machinery for metrics
Note: Names must be DNS1123 labels like myauthorizername or
subdomains like myauthorizer.example.domain
Required, with no default


webhook [Required]
WebhookConfiguration


   Webhook defines the configuration for a Webhook authorizer
Must be defined when Type=Webhook
Must not be defined when Type!=Webhook





## `ClaimMappings`     {#apiserver-k8s-io-v1alpha1-ClaimMappings}
    

**Appears in:**

- [JWTAuthenticator](#apiserver-k8s-io-v1alpha1-JWTAuthenticator)


ClaimMappings provides the configuration for claim mapping



FieldDescription

    
  
username [Required]
PrefixedClaimOrExpression


   username represents an option for the username attribute.
The claim's value must be a singular string.
Same as the --oidc-username-claim and --oidc-username-prefix flags.
If username.expression is set, the expression must produce a string value.
In the flag based approach, the --oidc-username-claim and --oidc-username-prefix are optional. If --oidc-username-claim is not set,
the default value is &quot;sub&quot;. For the authentication config, there is no defaulting for claim or prefix. The claim and prefix must be set explicitly.
For claim, if --oidc-username-claim was not set with legacy flag approach, configure username.claim=&quot;sub&quot; in the authentication config.
For prefix:
(1) --oidc-username-prefix=&quot;-&quot;, no prefix was added to the username. For the same behavior using authentication config,
set username.prefix=&quot;&quot;
(2) --oidc-username-prefix=&quot;&quot; and  --oidc-username-claim != &quot;email&quot;, prefix was &quot;&lt;value of --oidc-issuer-url&gt;#&quot;. For the same
behavior using authentication config, set username.prefix=&quot;#&quot;
(3) --oidc-username-prefix=&quot;&quot;. For the same behavior using authentication config, set username.prefix=&quot;&quot;


groups
PrefixedClaimOrExpression


   groups represents an option for the groups attribute.
The claim's value must be a string or string array claim.
If groups.claim is set, the prefix must be specified (and can be the empty string).
If groups.expression is set, the expression must produce a string or string array value.
&quot;&quot;, [], and null values are treated as the group mapping not being present.


uid
ClaimOrExpression


   uid represents an option for the uid attribute.
Claim must be a singular string claim.
If uid.expression is set, the expression must produce a string value.


extra
[]ExtraMapping


   extra represents an option for the extra attribute.
expression must produce a string or string array value.
If the value is empty, the extra mapping will not be present.
hard-coded extra key/value

key: &quot;foo&quot;
valueExpression: &quot;'bar'&quot;
This will result in an extra attribute - foo: [&quot;bar&quot;]

hard-coded key, value copying claim value

key: &quot;foo&quot;
valueExpression: &quot;claims.some_claim&quot;
This will result in an extra attribute - foo: [value of some_claim]

hard-coded key, value derived from claim value

key: &quot;admin&quot;
valueExpression: '(has(claims.is_admin) &amp;&amp; claims.is_admin) ? &quot;true&quot;:&quot;&quot;'
This will result in:
if is_admin claim is present and true, extra attribute - admin: [&quot;true&quot;]
if is_admin claim is present and false or is_admin claim is not present, no extra attribute will be added






## `ClaimOrExpression`     {#apiserver-k8s-io-v1alpha1-ClaimOrExpression}
    

**Appears in:**

- [ClaimMappings](#apiserver-k8s-io-v1alpha1-ClaimMappings)


ClaimOrExpression provides the configuration for a single claim or expression.



FieldDescription

    
  
claim
string


   claim is the JWT claim to use.
Either claim or expression must be set.
Mutually exclusive with expression.


expression
string


   expression represents the expression which will be evaluated by CEL.
CEL expressions have access to the contents of the token claims, organized into CEL variable:

'claims' is a map of claim names to claim values.
For example, a variable named 'sub' can be accessed as 'claims.sub'.
Nested claims can be accessed using dot notation, e.g. 'claims.email.verified'.

Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/
Mutually exclusive with claim.





## `ClaimValidationRule`     {#apiserver-k8s-io-v1alpha1-ClaimValidationRule}
    

**Appears in:**

- [JWTAuthenticator](#apiserver-k8s-io-v1alpha1-JWTAuthenticator)


ClaimValidationRule provides the configuration for a single claim validation rule.



FieldDescription

    
  
claim
string


   claim is the name of a required claim.
Same as --oidc-required-claim flag.
Only string claim keys are supported.
Mutually exclusive with expression and message.


requiredValue
string


   requiredValue is the value of a required claim.
Same as --oidc-required-claim flag.
Only string claim values are supported.
If claim is set and requiredValue is not set, the claim must be present with a value set to the empty string.
Mutually exclusive with expression and message.


expression
string


   expression represents the expression which will be evaluated by CEL.
Must produce a boolean.
CEL expressions have access to the contents of the token claims, organized into CEL variable:

'claims' is a map of claim names to claim values.
For example, a variable named 'sub' can be accessed as 'claims.sub'.
Nested claims can be accessed using dot notation, e.g. 'claims.email.verified'.
Must return true for the validation to pass.

Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/
Mutually exclusive with claim and requiredValue.


message
string


   message customizes the returned error message when expression returns false.
message is a literal string.
Mutually exclusive with claim and requiredValue.





## `Connection`     {#apiserver-k8s-io-v1alpha1-Connection}
    

**Appears in:**

- [EgressSelection](#apiserver-k8s-io-v1alpha1-EgressSelection)


Connection provides the configuration for a single egress selection client.



FieldDescription

    
  
proxyProtocol [Required]
ProtocolType


   Protocol is the protocol used to connect from client to the konnectivity server.


transport
Transport


   Transport defines the transport configurations we use to dial to the konnectivity server.
This is required if ProxyProtocol is HTTPConnect or GRPC.





## `EgressSelection`     {#apiserver-k8s-io-v1alpha1-EgressSelection}
    

**Appears in:**

- [EgressSelectorConfiguration](#apiserver-k8s-io-v1alpha1-EgressSelectorConfiguration)


EgressSelection provides the configuration for a single egress selection client.



FieldDescription

    
  
name [Required]
string


   name is the name of the egress selection.
Currently supported values are &quot;controlplane&quot;, &quot;master&quot;, &quot;etcd&quot; and &quot;cluster&quot;
The &quot;master&quot; egress selector is deprecated in favor of &quot;controlplane&quot;


connection [Required]
Connection


   connection is the exact information used to configure the egress selection





## `ExtraMapping`     {#apiserver-k8s-io-v1alpha1-ExtraMapping}
    

**Appears in:**

- [ClaimMappings](#apiserver-k8s-io-v1alpha1-ClaimMappings)


ExtraMapping provides the configuration for a single extra mapping.



FieldDescription

    
  
key [Required]
string


   key is a string to use as the extra attribute key.
key must be a domain-prefix path (e.g. example.org/foo). All characters before the first &quot;/&quot; must be a valid
subdomain as defined by RFC 1123. All characters trailing the first &quot;/&quot; must
be valid HTTP Path characters as defined by RFC 3986.
key must be lowercase.


valueExpression [Required]
string


   valueExpression is a CEL expression to extract extra attribute value.
valueExpression must produce a string or string array value.
&quot;&quot;, [], and null values are treated as the extra mapping not being present.
Empty string values contained within a string array are filtered out.
CEL expressions have access to the contents of the token claims, organized into CEL variable:

'claims' is a map of claim names to claim values.
For example, a variable named 'sub' can be accessed as 'claims.sub'.
Nested claims can be accessed using dot notation, e.g. 'claims.email.verified'.

Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/





## `Issuer`     {#apiserver-k8s-io-v1alpha1-Issuer}
    

**Appears in:**

- [JWTAuthenticator](#apiserver-k8s-io-v1alpha1-JWTAuthenticator)


Issuer provides the configuration for a external provider specific settings.



FieldDescription

    
  
url [Required]
string


   url points to the issuer URL in a format https://url or https://url/path.
This must match the &quot;iss&quot; claim in the presented JWT, and the issuer returned from discovery.
Same value as the --oidc-issuer-url flag.
Used to fetch discovery information unless overridden by discoveryURL.
Required to be unique.
Note that egress selection configuration is not used for this network connection.


certificateAuthority
string


   certificateAuthority contains PEM-encoded certificate authority certificates
used to validate the connection when fetching discovery information.
If unset, the system verifier is used.
Same value as the content of the file referenced by the --oidc-ca-file flag.


audiences [Required]
[]string


   audiences is the set of acceptable audiences the JWT must be issued to.
At least one of the entries must match the &quot;aud&quot; claim in presented JWTs.
Same value as the --oidc-client-id flag (though this field supports an array).
Required to be non-empty.





## `JWTAuthenticator`     {#apiserver-k8s-io-v1alpha1-JWTAuthenticator}
    

**Appears in:**

- [AuthenticationConfiguration](#apiserver-k8s-io-v1alpha1-AuthenticationConfiguration)


JWTAuthenticator provides the configuration for a single JWT authenticator.



FieldDescription

    
  
issuer [Required]
Issuer


   issuer contains the basic OIDC provider connection options.


claimValidationRules
[]ClaimValidationRule


   claimValidationRules are rules that are applied to validate token claims to authenticate users.


claimMappings [Required]
ClaimMappings


   claimMappings points claims of a token to be treated as user attributes.


userValidationRules
[]UserValidationRule


   userValidationRules are rules that are applied to final user before completing authentication.
These allow invariants to be applied to incoming identities such as preventing the
use of the system: prefix that is commonly used by Kubernetes components.
The validation rules are logically ANDed together and must all return true for the validation to pass.





## `PrefixedClaimOrExpression`     {#apiserver-k8s-io-v1alpha1-PrefixedClaimOrExpression}
    

**Appears in:**

- [ClaimMappings](#apiserver-k8s-io-v1alpha1-ClaimMappings)


PrefixedClaimOrExpression provides the configuration for a single prefixed claim or expression.



FieldDescription

    
  
claim
string


   claim is the JWT claim to use.
Mutually exclusive with expression.


prefix
string


   prefix is prepended to claim's value to prevent clashes with existing names.
prefix needs to be set if claim is set and can be the empty string.
Mutually exclusive with expression.


expression
string


   expression represents the expression which will be evaluated by CEL.
CEL expressions have access to the contents of the token claims, organized into CEL variable:

'claims' is a map of claim names to claim values.
For example, a variable named 'sub' can be accessed as 'claims.sub'.
Nested claims can be accessed using dot notation, e.g. 'claims.email.verified'.

Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/
Mutually exclusive with claim and prefix.





## `ProtocolType`     {#apiserver-k8s-io-v1alpha1-ProtocolType}
    
(Alias of `string`)

**Appears in:**

- [Connection](#apiserver-k8s-io-v1alpha1-Connection)


ProtocolType is a set of valid values for Connection.ProtocolType




## `TCPTransport`     {#apiserver-k8s-io-v1alpha1-TCPTransport}
    

**Appears in:**

- [Transport](#apiserver-k8s-io-v1alpha1-Transport)


TCPTransport provides the information to connect to konnectivity server via TCP



FieldDescription

    
  
url [Required]
string


   URL is the location of the konnectivity server to connect to.
As an example it might be &quot;https://127.0.0.1:8131&quot;


tlsConfig
TLSConfig


   TLSConfig is the config needed to use TLS when connecting to konnectivity server





## `TLSConfig`     {#apiserver-k8s-io-v1alpha1-TLSConfig}
    

**Appears in:**

- [TCPTransport](#apiserver-k8s-io-v1alpha1-TCPTransport)


TLSConfig provides the authentication information to connect to konnectivity server
Only used with TCPTransport



FieldDescription

    
  
caBundle
string


   caBundle is the file location of the CA to be used to determine trust with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
If absent while TCPTransport.URL is prefixed with https://, default to system trust roots.


clientKey
string


   clientKey is the file location of the client key to be used in mtls handshakes with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
Must be configured if TCPTransport.URL is prefixed with https://


clientCert
string


   clientCert is the file location of the client certificate to be used in mtls handshakes with the konnectivity server.
Must be absent/empty if TCPTransport.URL is prefixed with http://
Must be configured if TCPTransport.URL is prefixed with https://





## `Transport`     {#apiserver-k8s-io-v1alpha1-Transport}
    

**Appears in:**

- [Connection](#apiserver-k8s-io-v1alpha1-Connection)


Transport defines the transport configurations we use to dial to the konnectivity server



FieldDescription

    
  
tcp
TCPTransport


   TCP is the TCP configuration for communicating with the konnectivity server via TCP
ProxyProtocol of GRPC is not supported with TCP transport at the moment
Requires at least one of TCP or UDS to be set


uds
UDSTransport


   UDS is the UDS configuration for communicating with the konnectivity server via UDS
Requires at least one of TCP or UDS to be set





## `UDSTransport`     {#apiserver-k8s-io-v1alpha1-UDSTransport}
    

**Appears in:**

- [Transport](#apiserver-k8s-io-v1alpha1-Transport)


UDSTransport provides the information to connect to konnectivity server via UDS



FieldDescription

    
  
udsName [Required]
string


   UDSName is the name of the unix domain socket to connect to konnectivity server
This does not use a unix:// prefix. (Eg: /etc/srv/kubernetes/konnectivity-server/konnectivity-server.socket)





## `UserValidationRule`     {#apiserver-k8s-io-v1alpha1-UserValidationRule}
    

**Appears in:**

- [JWTAuthenticator](#apiserver-k8s-io-v1alpha1-JWTAuthenticator)


UserValidationRule provides the configuration for a single user info validation rule.



FieldDescription

    
  
expression [Required]
string


   expression represents the expression which will be evaluated by CEL.
Must return true for the validation to pass.
CEL expressions have access to the contents of UserInfo, organized into CEL variable:

'user' - authentication.k8s.io/v1, Kind=UserInfo object
Refer to https://github.com/kubernetes/api/blob/release-1.28/authentication/v1/types.go#L105-L122 for the definition.
API documentation: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#userinfo-v1-authentication-k8s-io

Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/


message
string


   message customizes the returned error message when rule returns false.
message is a literal string.





## `WebhookConfiguration`     {#apiserver-k8s-io-v1alpha1-WebhookConfiguration}
    

**Appears in:**

- [AuthorizerConfiguration](#apiserver-k8s-io-v1alpha1-AuthorizerConfiguration)




FieldDescription

    
  
authorizedTTL [Required]
meta/v1.Duration


   The duration to cache 'authorized' responses from the webhook
authorizer.
Same as setting --authorization-webhook-cache-authorized-ttl flag
Default: 5m0s


unauthorizedTTL [Required]
meta/v1.Duration


   The duration to cache 'unauthorized' responses from the webhook
authorizer.
Same as setting --authorization-webhook-cache-unauthorized-ttl flag
Default: 30s


timeout [Required]
meta/v1.Duration


   Timeout for the webhook request
Maximum allowed value is 30s.
Required, no default value.


subjectAccessReviewVersion [Required]
string


   The API version of the authorization.k8s.io SubjectAccessReview to
send to and expect from the webhook.
Same as setting --authorization-webhook-version flag
Valid values: v1beta1, v1
Required, no default value


matchConditionSubjectAccessReviewVersion [Required]
string


   MatchConditionSubjectAccessReviewVersion specifies the SubjectAccessReview
version the CEL expressions are evaluated against
Valid values: v1
Required, no default value


failurePolicy [Required]
string


   Controls the authorization decision when a webhook request fails to
complete or returns a malformed response or errors evaluating
matchConditions.
Valid values:

NoOpinion: continue to subsequent authorizers to see if one of
them allows the request
Deny: reject the request without consulting subsequent authorizers
Required, with no default.



connectionInfo [Required]
WebhookConnectionInfo


   ConnectionInfo defines how we talk to the webhook


matchConditions [Required]
[]WebhookMatchCondition


   matchConditions is a list of conditions that must be met for a request to be sent to this
webhook. An empty list of matchConditions matches all requests.
There are a maximum of 64 match conditions allowed.
The exact matching logic is (in order):

If at least one matchCondition evaluates to FALSE, then the webhook is skipped.
If ALL matchConditions evaluate to TRUE, then the webhook is called.
If at least one matchCondition evaluates to an error (but none are FALSE):

If failurePolicy=Deny, then the webhook rejects the request
If failurePolicy=NoOpinion, then the error is ignored and the webhook is skipped








## `WebhookConnectionInfo`     {#apiserver-k8s-io-v1alpha1-WebhookConnectionInfo}
    

**Appears in:**

- [WebhookConfiguration](#apiserver-k8s-io-v1alpha1-WebhookConfiguration)




FieldDescription

    
  
type [Required]
string


   Controls how the webhook should communicate with the server.
Valid values:

KubeConfigFile: use the file specified in kubeConfigFile to locate the
server.
InClusterConfig: use the in-cluster configuration to call the
SubjectAccessReview API hosted by kube-apiserver. This mode is not
allowed for kube-apiserver.



kubeConfigFile [Required]
string


   Path to KubeConfigFile for connection info
Required, if connectionInfo.Type is KubeConfig





## `WebhookMatchCondition`     {#apiserver-k8s-io-v1alpha1-WebhookMatchCondition}
    

**Appears in:**

- [WebhookConfiguration](#apiserver-k8s-io-v1alpha1-WebhookConfiguration)




FieldDescription

    
  
expression [Required]
string


   expression represents the expression which will be evaluated by CEL. Must evaluate to bool.
CEL expressions have access to the contents of the SubjectAccessReview in v1 version.
If version specified by subjectAccessReviewVersion in the request variable is v1beta1,
the contents would be converted to the v1 version before evaluating the CEL expression.
Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/




  