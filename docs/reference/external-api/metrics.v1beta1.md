---
title: Kubernetes Metrics (v1beta1)
content_type: tool-reference
package: metrics.k8s.io/v1beta1
auto_generated: true
---
Package v1beta1 is the v1beta1 version of the metrics API.


## Resource Types 


- [NodeMetrics](#metrics-k8s-io-v1beta1-NodeMetrics)
- [NodeMetricsList](#metrics-k8s-io-v1beta1-NodeMetricsList)
- [PodMetrics](#metrics-k8s-io-v1beta1-PodMetrics)
- [PodMetricsList](#metrics-k8s-io-v1beta1-PodMetricsList)
  
    

## `NodeMetrics`     {#metrics-k8s-io-v1beta1-NodeMetrics}
    

**Appears in:**

- [NodeMetricsList](#metrics-k8s-io-v1beta1-NodeMetricsList)


NodeMetrics sets resource usage metrics of a node.



FieldDescription

    
apiVersionstringmetrics.k8s.io/v1beta1
kindstringNodeMetrics
    
  
metadata
meta/v1.ObjectMeta


   Standard object's metadata.
More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
Refer to the Kubernetes API documentation for the fields of the metadata field.

timestamp [Required]
meta/v1.Time


   The following fields define time interval from which metrics were
collected from the interval [Timestamp-Window, Timestamp].


window [Required]
meta/v1.Duration


   No description provided.

usage [Required]
core/v1.ResourceList


   The memory usage is the memory working set.





## `NodeMetricsList`     {#metrics-k8s-io-v1beta1-NodeMetricsList}
    


NodeMetricsList is a list of NodeMetrics.



FieldDescription

    
apiVersionstringmetrics.k8s.io/v1beta1
kindstringNodeMetricsList
    
  
metadata [Required]
meta/v1.ListMeta


   Standard list metadata.
More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds


items [Required]
[]NodeMetrics


   List of node metrics.





## `PodMetrics`     {#metrics-k8s-io-v1beta1-PodMetrics}
    

**Appears in:**

- [PodMetricsList](#metrics-k8s-io-v1beta1-PodMetricsList)


PodMetrics sets resource usage metrics of a pod.



FieldDescription

    
apiVersionstringmetrics.k8s.io/v1beta1
kindstringPodMetrics
    
  
metadata
meta/v1.ObjectMeta


   Standard object's metadata.
More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
Refer to the Kubernetes API documentation for the fields of the metadata field.

timestamp [Required]
meta/v1.Time


   The following fields define time interval from which metrics were
collected from the interval [Timestamp-Window, Timestamp].


window [Required]
meta/v1.Duration


   No description provided.

containers [Required]
[]ContainerMetrics


   Metrics for all containers are collected within the same time window.





## `PodMetricsList`     {#metrics-k8s-io-v1beta1-PodMetricsList}
    


PodMetricsList is a list of PodMetrics.



FieldDescription

    
apiVersionstringmetrics.k8s.io/v1beta1
kindstringPodMetricsList
    
  
metadata [Required]
meta/v1.ListMeta


   Standard list metadata.
More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds


items [Required]
[]PodMetrics


   List of pod metrics.





## `ContainerMetrics`     {#metrics-k8s-io-v1beta1-ContainerMetrics}
    

**Appears in:**

- [PodMetrics](#metrics-k8s-io-v1beta1-PodMetrics)


ContainerMetrics sets resource usage metrics of a container.



FieldDescription

    
  
name [Required]
string


   Container name corresponding to the one from pod.spec.containers.


usage [Required]
core/v1.ResourceList


   The memory usage is the memory working set.




  