---
title: kube-apiserver Encryption Configuration (v1)
content_type: tool-reference
package: apiserver.config.k8s.io/v1
auto_generated: true
---
Package v1 is the v1 version of the API.


## Resource Types 


- [EncryptionConfiguration](#apiserver-config-k8s-io-v1-EncryptionConfiguration)
  

## `EncryptionConfiguration`     {#apiserver-config-k8s-io-v1-EncryptionConfiguration}
    


EncryptionConfiguration stores the complete configuration for encryption providers.
It also allows the use of wildcards to specify the resources that should be encrypted.
Use '.' to encrypt all resources within a group or '.' to encrypt all resources.
'.' can be used to encrypt all resource in the core group.  '.' will encrypt all
resources, even custom resources that are added after API server start.
Use of wildcards that overlap within the same resource list or across multiple
entries are not allowed since part of the configuration would be ineffective.
Resource lists are processed in order, with earlier lists taking precedence.
Example:
kind: EncryptionConfiguration
apiVersion: apiserver.config.k8s.io/v1
resources:
- resources:
  - events
  providers:
  - identity: {}  # do not encrypt events even though *.* is specified below
- resources:
  - secrets
  - configmaps
  - pandas.awesome.bears.example
  providers:
  - aescbc:
      keys:
      - name: key1
        secret: c2VjcmV0IGlzIHNlY3VyZQ==
- resources:
  - '*.apps'
  providers:
  - aescbc:
      keys:
      - name: key2
        secret: c2VjcmV0IGlzIHNlY3VyZSwgb3IgaXMgaXQ/Cg==
- resources:
  - '*.*'
  providers:
  - aescbc:
      keys:
      - name: key3
        secret: c2VjcmV0IGlzIHNlY3VyZSwgSSB0aGluaw==



FieldDescription

    
apiVersionstringapiserver.config.k8s.io/v1
kindstringEncryptionConfiguration
    
  
resources [Required]
[]ResourceConfiguration


   resources is a list containing resources, and their corresponding encryption providers.





## `AESConfiguration`     {#apiserver-config-k8s-io-v1-AESConfiguration}
    

**Appears in:**

- [ProviderConfiguration](#apiserver-config-k8s-io-v1-ProviderConfiguration)


AESConfiguration contains the API configuration for an AES transformer.



FieldDescription

    
  
keys [Required]
[]Key


   keys is a list of keys to be used for creating the AES transformer.
Each key has to be 32 bytes long for AES-CBC and 16, 24 or 32 bytes for AES-GCM.





## `IdentityConfiguration`     {#apiserver-config-k8s-io-v1-IdentityConfiguration}
    

**Appears in:**

- [ProviderConfiguration](#apiserver-config-k8s-io-v1-ProviderConfiguration)


IdentityConfiguration is an empty struct to allow identity transformer in provider configuration.




## `KMSConfiguration`     {#apiserver-config-k8s-io-v1-KMSConfiguration}
    

**Appears in:**

- [ProviderConfiguration](#apiserver-config-k8s-io-v1-ProviderConfiguration)


KMSConfiguration contains the name, cache size and path to configuration file for a KMS based envelope transformer.



FieldDescription

    
  
apiVersion
string


   apiVersion of KeyManagementService


name [Required]
string


   name is the name of the KMS plugin to be used.


cachesize
int32


   cachesize is the maximum number of secrets which are cached in memory. The default value is 1000.
Set to a negative value to disable caching. This field is only allowed for KMS v1 providers.


endpoint [Required]
string


   endpoint is the gRPC server listening address, for example &quot;unix:///var/run/kms-provider.sock&quot;.


timeout
meta/v1.Duration


   timeout for gRPC calls to kms-plugin (ex. 5s). The default is 3 seconds.





## `Key`     {#apiserver-config-k8s-io-v1-Key}
    

**Appears in:**

- [AESConfiguration](#apiserver-config-k8s-io-v1-AESConfiguration)

- [SecretboxConfiguration](#apiserver-config-k8s-io-v1-SecretboxConfiguration)


Key contains name and secret of the provided key for a transformer.



FieldDescription

    
  
name [Required]
string


   name is the name of the key to be used while storing data to disk.


secret [Required]
string


   secret is the actual key, encoded in base64.





## `ProviderConfiguration`     {#apiserver-config-k8s-io-v1-ProviderConfiguration}
    

**Appears in:**

- [ResourceConfiguration](#apiserver-config-k8s-io-v1-ResourceConfiguration)


ProviderConfiguration stores the provided configuration for an encryption provider.



FieldDescription

    
  
aesgcm [Required]
AESConfiguration


   aesgcm is the configuration for the AES-GCM transformer.


aescbc [Required]
AESConfiguration


   aescbc is the configuration for the AES-CBC transformer.


secretbox [Required]
SecretboxConfiguration


   secretbox is the configuration for the Secretbox based transformer.


identity [Required]
IdentityConfiguration


   identity is the (empty) configuration for the identity transformer.


kms [Required]
KMSConfiguration


   kms contains the name, cache size and path to configuration file for a KMS based envelope transformer.





## `ResourceConfiguration`     {#apiserver-config-k8s-io-v1-ResourceConfiguration}
    

**Appears in:**

- [EncryptionConfiguration](#apiserver-config-k8s-io-v1-EncryptionConfiguration)


ResourceConfiguration stores per resource configuration.



FieldDescription

    
  
resources [Required]
[]string


   resources is a list of kubernetes resources which have to be encrypted. The resource names are derived from resource or resource.group of the group/version/resource.
eg: pandas.awesome.bears.example is a custom resource with 'group': awesome.bears.example, 'resource': pandas.
Use '.' to encrypt all resources and '.' to encrypt all resources in a specific group.
eg: '.awesome.bears.example' will encrypt all resources in the group 'awesome.bears.example'.
eg: '*.' will encrypt all resources in the core group (such as pods, configmaps, etc).


providers [Required]
[]ProviderConfiguration


   providers is a list of transformers to be used for reading and writing the resources to disk.
eg: aesgcm, aescbc, secretbox, identity, kms.





## `SecretboxConfiguration`     {#apiserver-config-k8s-io-v1-SecretboxConfiguration}
    

**Appears in:**

- [ProviderConfiguration](#apiserver-config-k8s-io-v1-ProviderConfiguration)


SecretboxConfiguration contains the API configuration for an Secretbox transformer.



FieldDescription

    
  
keys [Required]
[]Key


   keys is a list of keys to be used for creating the Secretbox transformer.
Each key has to be 32 bytes long.




  