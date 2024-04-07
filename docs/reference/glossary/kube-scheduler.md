---
title: kube-scheduler
id: kube-scheduler
date: 2018-04-12
full_link: /docs/reference/command-line-tools-reference/kube-scheduler/
short_description: >
  Control plane component that watches for newly created pods with no assigned node, and selects a node for them to run on.

aka: 
tags:
- architecture
---
Control plane component that watches for newly created
{{}} with no assigned
{{}}, and selects a node for them
to run on.



Factors taken into account for scheduling decisions include:
individual and collective resource requirements, hardware/software/policy
constraints, affinity and anti-affinity specifications, data locality,
inter-workload interference, and deadlines.
