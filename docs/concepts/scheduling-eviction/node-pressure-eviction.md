---
title: Node-pressure Eviction
content_type: concept
weight: 100
---

{{}}

The {{}} monitors resources
like memory, disk space, and filesystem inodes on your cluster's nodes.
When one or more of these resources reach specific consumption levels, the
kubelet can proactively fail one or more pods on the node to reclaim resources
and prevent starvation.

During a node-pressure eviction, the kubelet sets the [phase](/docs/concepts/workloads/pods/pod-lifecycle/#pod-phase) for the
selected pods to `Failed`, and terminates the Pod.

Node-pressure eviction is not the same as
[API-initiated eviction](/docs/concepts/scheduling-eviction/api-eviction/).

The kubelet does not respect your configured {{}}
or the pod's
`terminationGracePeriodSeconds`. If you use [soft eviction thresholds](#soft-eviction-thresholds),
the kubelet respects your configured `eviction-max-pod-grace-period`. If you use
[hard eviction thresholds](#hard-eviction-thresholds), the kubelet uses a `0s` grace period (immediate shutdown) for termination.

## Self healing behavior

The kubelet attempts to [reclaim node-level resources](#reclaim-node-resources)
before it terminates end-user pods. For example, it removes unused container
images when disk resources are starved.

If the pods are managed by a {{}}
management object (such as {{}}
or {{}}) that
replaces failed pods, the control plane (`kube-controller-manager`) creates new
pods in place of the evicted pods.

### Self healing for static pods

If you are running a [static pod](/docs/concepts/workloads/pods/#static-pods)
on a node that is under resource pressure, the kubelet may evict that static
Pod. The kubelet then tries to create a replacement, because static Pods always
represent an intent to run a Pod on that node.

The kubelet takes the _priority_ of the static pod into account when creating
a replacement. If the static pod manifest specifies a low priority, and there
are higher-priority Pods defined within the cluster's control plane, and the
node is under resource pressure, the kubelet may not be able to make room for
that static pod. The kubelet continues to attempt to run all static pods even
when there is resource pressure on a node.

## Eviction signals and thresholds

The kubelet uses various parameters to make eviction decisions, like the following:

- Eviction signals
- Eviction thresholds
- Monitoring intervals

### Eviction signals {#eviction-signals}

Eviction signals are the current state of a particular resource at a specific
point in time. Kubelet uses eviction signals to make eviction decisions by
comparing the signals to eviction thresholds, which are the minimum amount of
the resource that should be available on the node.

On Linux, the kubelet uses the following eviction signals:

| Eviction Signal      | Description                                                                           |
|----------------------|---------------------------------------------------------------------------------------|
| `memory.available`   | `memory.available` := `node.status.capacity[memory]` - `node.stats.memory.workingSet` |
| `nodefs.available`   | `nodefs.available` := `node.stats.fs.available`                                       |
| `nodefs.inodesFree`  | `nodefs.inodesFree` := `node.stats.fs.inodesFree`                                     |
| `imagefs.available`  | `imagefs.available` := `node.stats.runtime.imagefs.available`                         |
| `imagefs.inodesFree` | `imagefs.inodesFree` := `node.stats.runtime.imagefs.inodesFree`                       |
| `pid.available`      | `pid.available` := `node.stats.rlimit.maxpid` - `node.stats.rlimit.curproc`           |

In this table, the **Description** column shows how kubelet gets the value of the
signal. Each signal supports either a percentage or a literal value. Kubelet
calculates the percentage value relative to the total capacity associated with
the signal.

The value for `memory.available` is derived from the cgroupfs instead of tools
like `free -m`. This is important because `free -m` does not work in a
container, and if users use the [node allocatable](/docs/tasks/administer-cluster/reserve-compute-resources/#node-allocatable)
feature, out of resource decisions
are made local to the end user Pod part of the cgroup hierarchy as well as the
root node. This [script](/examples/admin/resource/memory-available.sh) or
[cgroupv2 script](/examples/admin/resource/memory-available-cgroupv2.sh)
reproduces the same set of steps that the kubelet performs to calculate
`memory.available`. The kubelet excludes inactive_file (the number of bytes of
file-backed memory on the inactive LRU list) from its calculation, as it assumes that
memory is reclaimable under pressure.

The kubelet recognizes two specific filesystem identifiers:

1. `nodefs`: The node's main filesystem, used for local disk volumes, emptyDir
   volumes not backed by memory, log storage, and more.
   For example, `nodefs` contains `/var/lib/kubelet/`.
1. `imagefs`: An optional filesystem that container runtimes use to store container
   images and container writable layers.

Kubelet auto-discovers these filesystems and ignores other node local filesystems. Kubelet
does not support other configurations.

Some kubelet garbage collection features are deprecated in favor of eviction:

| Existing Flag | Rationale |
| ------------- | --------- |
| `--maximum-dead-containers` | deprecated once old logs are stored outside of container's context |
| `--maximum-dead-containers-per-container` | deprecated once old logs are stored outside of container's context |
| `--minimum-container-ttl-duration` | deprecated once old logs are stored outside of container's context |

### Eviction thresholds

You can specify custom eviction thresholds for the kubelet to use when it makes
eviction decisions. You can configure [soft](#soft-eviction-thresholds) and
[hard](#hard-eviction-thresholds) eviction thresholds.

Eviction thresholds have the form `[eviction-signal][operator][quantity]`, where:

- `eviction-signal` is the [eviction signal](#eviction-signals) to use.
- `operator` is the [relational operator](https://en.wikipedia.org/wiki/Relational_operator#Standard_relational_operators)
  you want, such as `}}
The kubelet does not use the pod's [QoS class](/docs/concepts/workloads/pods/pod-qos/) to determine the eviction order.
You can use the QoS class to estimate the most likely pod eviction order when
reclaiming resources like memory. QoS classification does not apply to EphemeralStorage requests,
so the above scenario will not apply if the node is, for example, under `DiskPressure`.
{{}}

`Guaranteed` pods are guaranteed only when requests and limits are specified for
all the containers and they are equal. These pods will never be evicted because
of another pod's resource consumption. If a system daemon (such as `kubelet`
and `journald`) is consuming more resources than were reserved via
`system-reserved` or `kube-reserved` allocations, and the node only has
`Guaranteed` or `Burstable` pods using less resources than requests left on it,
then the kubelet must choose to evict one of these pods to preserve node stability
and to limit the impact of resource starvation on other pods. In this case, it
will choose to evict pods of lowest Priority first.

If you are running a [static pod](/docs/concepts/workloads/pods/#static-pods)
and want to avoid having it evicted under resource pressure, set the
`priority` field for that Pod directly. Static pods do not support the
`priorityClassName` field.

When the kubelet evicts pods in response to inode or process ID starvation, it uses
the Pods' relative priority to determine the eviction order, because inodes and PIDs have no
requests.

The kubelet sorts pods differently based on whether the node has a dedicated
`imagefs` filesystem:

#### With `imagefs`

If `nodefs` is triggering evictions, the kubelet sorts pods based on `nodefs`
usage (`local volumes + logs of all containers`).

If `imagefs` is triggering evictions, the kubelet sorts pods based on the
writable layer usage of all containers.

#### Without `imagefs`

If `nodefs` is triggering evictions, the kubelet sorts pods based on their total
disk usage (`local volumes + logs & writable layer of all containers`)

### Minimum eviction reclaim

In some cases, pod eviction only reclaims a small amount of the starved resource.
This can lead to the kubelet repeatedly hitting the configured eviction thresholds
and triggering multiple evictions.

You can use the `--eviction-minimum-reclaim` flag or a [kubelet config file](/docs/tasks/administer-cluster/kubelet-config-file/)
to configure a minimum reclaim amount for each resource. When the kubelet notices
that a resource is starved, it continues to reclaim that resource until it
reclaims the quantity you specify.

For example, the following configuration sets minimum reclaim amounts:

```yaml
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
evictionHard:
  memory.available: "500Mi"
  nodefs.available: "1Gi"
  imagefs.available: "100Gi"
evictionMinimumReclaim:
  memory.available: "0Mi"
  nodefs.available: "500Mi"
  imagefs.available: "2Gi"
```

In this example, if the `nodefs.available` signal meets the eviction threshold,
the kubelet reclaims the resource until the signal reaches the threshold of 1GiB,
and then continues to reclaim the minimum amount of 500MiB, until the available nodefs storage value reaches 1.5GiB.

Similarly, the kubelet tries to reclaim the `imagefs` resource until the `imagefs.available`
value reaches `102Gi`, representing 102 GiB of available container image storage. If the amount
of storage that the kubelet could reclaim is less than 2GiB, the kubelet doesn't reclaim anything.

The default `eviction-minimum-reclaim` is `0` for all resources.

## Node out of memory behavior

If the node experiences an _out of memory_ (OOM) event prior to the kubelet
being able to reclaim memory, the node depends on the [oom_killer](https://lwn.net/Articles/391222/)
to respond.

The kubelet sets an `oom_score_adj` value for each container based on the QoS for the pod.

| Quality of Service | `oom_score_adj`                                                                   |
|--------------------|-----------------------------------------------------------------------------------|
| `Guaranteed`       | -997                                                                              |
| `BestEffort`       | 1000                                                                              |
| `Burstable`        | _min(max(2, 1000 - (1000 × memoryRequestBytes) / machineMemoryCapacityBytes), 999)_ |

{{}}
The kubelet also sets an `oom_score_adj` value of `-997` for any containers in Pods that have
`system-node-critical` {{}}.
{{}}

If the kubelet can't reclaim memory before a node experiences OOM, the
`oom_killer` calculates an `oom_score` based on the percentage of memory it's
using on the node, and then adds the `oom_score_adj` to get an effective `oom_score`
for each container. It then kills the container with the highest score.

This means that containers in low QoS pods that consume a large amount of memory
relative to their scheduling requests are killed first.

Unlike pod eviction, if a container is OOM killed, the kubelet can restart it
based on its `restartPolicy`.

## Good practices {#node-pressure-eviction-good-practices}

The following sections describe good practice for eviction configuration.

### Schedulable resources and eviction policies

When you configure the kubelet with an eviction policy, you should make sure that
the scheduler will not schedule pods if they will trigger eviction because they
immediately induce memory pressure.

Consider the following scenario:

- Node memory capacity: 10GiB
- Operator wants to reserve 10% of memory capacity for system daemons (kernel, `kubelet`, etc.)
- Operator wants to evict Pods at 95% memory utilization to reduce incidence of system OOM.

For this to work, the kubelet is launched as follows:

```none
--eviction-hard=memory.available}}/#create-eviction-pod-v1-core)
