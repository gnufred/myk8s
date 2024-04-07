---
title: Aggregation Layer
id: aggregation-layer
date: 2018-10-08
full_link: /docs/concepts/extend-kubernetes/api-extension/apiserver-aggregation/
short_description: >
  The aggregation layer lets you install additional Kubernetes-style APIs in your cluster.

aka: 
tags:
- architecture
- extension
- operation
---
 The aggregation layer lets you install additional Kubernetes-style APIs in your cluster.



When you've configured the {{}} to [support additional APIs](/docs/tasks/extend-kubernetes/configure-aggregation-layer/), you can add `APIService` objects to "claim" a URL path in the Kubernetes API.
