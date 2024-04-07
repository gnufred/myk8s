---
title: kube-apiserver Configuration (v1)
content_type: tool-reference
package: apiserver.config.k8s.io/v1
auto_generated: true
---
Package v1 is the v1 version of the API.


## Resource Types 


- [AdmissionConfiguration](#apiserver-config-k8s-io-v1-AdmissionConfiguration)
  

## `AdmissionConfiguration`     {#apiserver-config-k8s-io-v1-AdmissionConfiguration}
    


AdmissionConfiguration provides versioned configuration for admission controllers.



FieldDescription

    
apiVersionstringapiserver.config.k8s.io/v1
kindstringAdmissionConfiguration
    
  
plugins
[]AdmissionPluginConfiguration


   Plugins allows specifying a configuration per admission control plugin.





## `AdmissionPluginConfiguration`     {#apiserver-config-k8s-io-v1-AdmissionPluginConfiguration}
    

**Appears in:**

- [AdmissionConfiguration](#apiserver-config-k8s-io-v1-AdmissionConfiguration)


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




  