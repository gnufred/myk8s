---
title: Sidecar Container
id: sidecar-container
date: 2018-04-12
full_link: 
short_description: >
  An auxilliary container that stays running throughout the lifecycle of a Pod.
full_link: /docs/concepts/workloads/pods/sidecar-containers/
tags:
- fundamental
---
 One or more {{}} that are typically started before any app containers run.

 

Sidecar containers are like regular app containers, but with a different purpose: the sidecar provides a Pod-local service to the main app container.
Unlike {{}}, sidecar containers
continue running after Pod startup.

Read [Sidecar containers](/docs/concepts/workloads/pods/sidecar-containers/) for more information.
