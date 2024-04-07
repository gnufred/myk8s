---
title: Node
id: node
date: 2018-04-12
full_link: /docs/concepts/architecture/nodes/
short_description: >
  A node is a worker machine in Kubernetes.

aka:
tags:
- fundamental
---
 A node is a worker machine in Kubernetes.



A worker node may be a VM or physical machine, depending on the cluster. It has local daemons or services necessary to run {{}} and is managed by the control plane. The daemons on a node include {{}}, {{}}, and a container runtime implementing the {{}} such as {{}}.

In early Kubernetes versions, Nodes were called "Minions".
