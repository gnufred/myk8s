---
reviewers:
- lavalamp
title: Kubernetes Components
content_type: concept
description: >
  A Kubernetes cluster consists of the components that are a part of the control
  plane and a set of machines called nodes.
weight: 30
card: 
  title: Components of a cluster
  name: concepts
  weight: 20
---


When you deploy Kubernetes, you get a cluster.
{{}}

This document outlines the various components you need to have for
a complete and working Kubernetes cluster.

{{}}


## Control Plane Components

The control plane's components make global decisions about the cluster (for example, scheduling),
as well as detecting and responding to cluster events (for example, starting up a new
{{}} when a Deployment's
`{{}}` field is unsatisfied).

Control plane components can be run on any machine in the cluster. However,
for simplicity, setup scripts typically start all control plane components on
the same machine, and do not run user containers on this machine. See
[Creating Highly Available clusters with kubeadm](/docs/setup/production-environment/tools/kubeadm/high-availability/)
for an example control plane setup that runs across multiple machines.

### kube-apiserver

{{}}

### etcd

{{}}

### kube-scheduler

{{}}

### kube-controller-manager

{{}}

There are many different types of controllers. Some examples of them are:

  * Node controller: Responsible for noticing and responding when nodes go down.
  * Job controller: Watches for Job objects that represent one-off tasks, then creates
    Pods to run those tasks to completion.
  * EndpointSlice controller: Populates EndpointSlice objects (to provide a link between Services and Pods).
  * ServiceAccount controller: Create default ServiceAccounts for new namespaces.

The above is not an exhaustive list.

### cloud-controller-manager

{{}}

The cloud-controller-manager only runs controllers that are specific to your cloud provider.
If you are running Kubernetes on your own premises, or in a learning environment inside your
own PC, the cluster does not have a cloud controller manager.

As with the kube-controller-manager, the cloud-controller-manager combines several logically
independent control loops into a single binary that you run as a single process. You can
scale horizontally (run more than one copy) to improve performance or to help tolerate failures.

The following controllers can have cloud provider dependencies:

  * Node controller: For checking the cloud provider to determine if a node has been deleted in the cloud after it stops responding
  * Route controller: For setting up routes in the underlying cloud infrastructure
  * Service controller: For creating, updating and deleting cloud provider load balancers

## Node Components

Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.

### kubelet

{{}}

### kube-proxy

{{}}

### Container runtime

{{}}

## Addons

Addons use Kubernetes resources ({{}},
{{}}, etc)
to implement cluster features. Because these are providing cluster-level features, namespaced resources
for addons belong within the `kube-system` namespace.

Selected addons are described below; for an extended list of available addons, please
see [Addons](/docs/concepts/cluster-administration/addons/).

### DNS

While the other addons are not strictly required, all Kubernetes clusters should have
[cluster DNS](/docs/concepts/services-networking/dns-pod-service/), as many examples rely on it.

Cluster DNS is a DNS server, in addition to the other DNS server(s) in your environment,
which serves DNS records for Kubernetes services.

Containers started by Kubernetes automatically include this DNS server in their DNS searches.

### Web UI (Dashboard)

[Dashboard](/docs/tasks/access-application-cluster/web-ui-dashboard/) is a general purpose,
web-based UI for Kubernetes clusters. It allows users to manage and troubleshoot applications
running in the cluster, as well as the cluster itself.

### Container Resource Monitoring

[Container Resource Monitoring](/docs/tasks/debug/debug-cluster/resource-usage-monitoring/)
records generic time-series metrics
about containers in a central database, and provides a UI for browsing that data.

### Cluster-level Logging

A [cluster-level logging](/docs/concepts/cluster-administration/logging/) mechanism is responsible for
saving container logs to a central log store with search/browsing interface.

### Network Plugins

[Network plugins](/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins) are software
components that implement the container network interface (CNI) specification. They are responsible for
allocating IP addresses to pods and enabling them to communicate with each other within the cluster.


## {{% heading "whatsnext" %}}

Learn more about the following:
   * [Nodes](/docs/concepts/architecture/nodes/) and [their communication](/docs/concepts/architecture/control-plane-node-communication/)
     with the control plane.
   * Kubernetes [controllers](/docs/concepts/architecture/controller/).
   * [kube-scheduler](/docs/concepts/scheduling-eviction/kube-scheduler/) which is the default scheduler for Kubernetes.
   * Etcd's official [documentation](https://etcd.io/docs/).
   * Several [container runtimes](/docs/setup/production-environment/container-runtimes/) in Kubernetes.
   * Integrating with cloud providers using [cloud-controller-manager](/docs/concepts/architecture/cloud-controller/).
   * [kubectl](/docs/reference/generated/kubectl/kubectl-commands) commands.
