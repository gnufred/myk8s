---
title: Deployment
id: deployment
date: 2018-04-12
full_link: /docs/concepts/workloads/controllers/deployment/
short_description: >
  Manages a replicated application on your cluster.

aka: 
tags:
- fundamental
- core-object
- workload
---
 An API object that manages a replicated application, typically by running Pods with no local state.

 

Each replica is represented by a {{}}, and the Pods are distributed among the 
{{}} of a cluster.
For workloads that do require local state, consider using a {{}}.
