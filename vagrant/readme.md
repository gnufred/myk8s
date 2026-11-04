# MyK8s Vagrant lab

Latest Vagrant configuration for my K8s labs.

## Usage

### Clone and provision

Install Git LFS and the host prerequisites (Vagrant, vagrant-libvirt, Ansible, QEMU/KVM and Arch OVMF firmware), then:

```bash
git clone https://github.com/gnufred/myk8s.git
cd myk8s
git lfs pull
cd vagrant
run/services
run/provision
```

`git lfs pull` restores the base box, cached APKs and container image archives. `run/provision` automatically calls `run/register-box`: if `myk8s/alpine-3.24` version `3.24.3` for libvirt/amd64 is missing, it verifies and registers the local archive from `.lfs/boxes/`. The locally generated Vagrant metadata includes its version and SHA-256; no remote box catalog is needed. An already registered matching version is reused. You can also run `run/register-box` before invoking Vagrant directly.

The Alpine 3.24.3 base has passed boot, SSH key replacement and passwordless root access. The APK cache targets Alpine 3.24. The current Service/Pod network layout has been tested with `lb0`, `cp0`, `wo0` and `wo1`, using Kubernetes 1.36.1-r2 and containerd 2.3.7-r0. Before the address changes, all three control planes passed stacked-etcd health checks and the NFS VM passed worker/PV persistence tests. The additional control planes, remaining four workers and NFS VM have not been retested with the new network layout.

### Host services

After a host reboot, run `run/services` to start the `virtqemud`, `virtstoraged`, and `virtnetworkd` systemd sockets used by libvirt. The command asks for sudo when needed and reports each socket's status. Use `run/services status` to check without starting anything. These sockets activate their daemons on demand; they are not enabled for automatic startup by this helper.

The host firewall must still allow traffic on the libvirt management bridge; the bridge name and existing UFW rules depend on the host configuration. This helper does not modify firewall rules or start VMs.

### Provision

Start the validated single-control-plane setup with:

```bash
run/provision lb0
run/provision cp0
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes'
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get pods -n kube-system'
```

This creates one control plane behind the existing load balancer. It is a fresh bootstrap, not an in-place upgrade of a Kubernetes 1.29 cluster. Existing VMs retain their disks; changing the base box applies when a VM is recreated. The argument-free `run/provision` builds the entire lab. The current network layout has been validated with `cp0` and two workers (`wo0`, `wo1`); the remaining nodes have static address assignments ready for provisioning.

### Add the other control planes

After `cp0` is healthy, provision fresh replicas with:

```bash
run/provision cp1
run/provision cp2
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes -o wide'
```

The full provision helper also adds control planes sequentially and stops with a nonzero exit status if provisioning or joining fails. This avoids overlapping stacked-etcd membership changes and prevents a background job from hiding a failed join.

Control-plane joins explicitly use the private `eth1` address for `--apiserver-advertise-address`, matching `cp0`. Kubeadm uses this address for the new API server and etcd peer certificates/listeners. Allowing automatic selection chose the management address (`192.168.121.x`) in the first test: etcd then rejected a peer's management source IP because its certificate contained the private IP. The failed learner was removed and `cp1` rejoined using `10.1.2.21`; `cp2` joined directly using `10.1.2.22`.

The join playbook creates the etcd certificate directory before copying the shared CA material, including when retrying after `kubeadm reset`. Shared private keys are installed as root with mode `0600`; public certificates and keys use `0644`.

Before the network-address changes, validation on 4 November 2026 found `cp0`, `cp1` and `cp2` Ready on v1.36.1, with 16/16 system Pods Running. Etcd has three voting members, no learners, one leader and matching applied Raft indexes; health proposals succeeded at every endpoint. Authenticated `/readyz` requests passed on all three private API addresses and the load-balanced endpoint. The controller-manager and scheduler on `cp1` retain a restart count of one from the failed join/reset; retained logs distinguish that attempt from their healthy replacements. Helper checks verified sequential ordering and propagation of both provisioning and join failures.

### Add workers

After the control plane is healthy, provision fresh workers with:

```bash
run/provision wo0
run/provision wo1
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes -o wide'
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes -o custom-columns=NAME:.metadata.name,POD-CIDR:.spec.podCIDR'
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf -n kube-system get pods -o wide'
```

Worker provisioning remains parallel during a full bootstrap, but the helper records each worker PID and checks its exit status. A failed provision or join returns a nonzero status even if a later worker succeeds. A targeted `run/provision wo0` launches only that worker.

The tested layout has three Ready nodes (`cp0`, `wo0`, `wo1`) and eight ready system Pods. Temporary non-root diagnostic Pods on all three nodes passed direct Pod connections in every direction and connections through a separate Service per endpoint, including each Pod reaching itself through its Service. Servers observed the original client Pod IP on cross-node connections. Each client resolved cluster and external names, received NXDOMAIN for a nonexistent cluster name, queried CoreDNS over UDP and TCP, and made a service-account-authenticated HTTPS request to the API `/version` with CA verification.

The diagnostic image was built offline from the checksum-verified Alpine 3.24.3 minirootfs and verified cached Python APKs. It is temporary; the regular worker archive still contains only kube-proxy and pause. No network daemon, overlay or new CNI plugin is installed. See the network addressing section for routes, NAT, firewall persistence and the scope of these checks.

### NFS storage

Provision the dedicated NFS server VM with `run/provision nf0`. It serves `/export` at private address `10.1.2.40`, using the cached Alpine NFS packages and the OpenRC `rpcbind` and `nfs` services. `/etc/exports` allows the six worker hostnames (`wo0` through `wo5`) and retains `rw,root_squash,no_subtree_check`. The NFS server stays separate from Kubernetes node registration.

The export directory is owned by `root:vagrant` (GID 1000), with mode `2775`: the shared lab group can write, and newly created subdirectories inherit its group. Client-root writes are still squashed and denied. Applications should use the matching identity/group; the tested Pods used:

```yaml
securityContext:
  runAsUser: 1000
  runAsGroup: 1000
  runAsNonRoot: true
```

A root-owned `0755` export mounted successfully but did not let the normal worker user write. Provisioning now sets the tested group and mode explicitly without making the directory world-writable or disabling root squash. Backing directories for static NFS volumes can be created by UID/GID 1000 underneath `/export`.

Before the network-address changes, validation on 4 November 2026 confirmed `wo0` mounted `nf0:/export` over NFSv4.2/TCP, wrote/read data as UID/GID 1000, and failed a client-root write as expected. A temporary static `ReadWriteMany` NFS PV/PVC bound successfully with `nfsvers=4.2`. A non-root writer Pod on `wo0` read worker-created data and wrote its own file. After that Pod was deleted, a replacement reader Pod recovered the same file. Its contents were also verified directly on `nf0` and through the worker mount. Temporary Pods, PV/PVC, test data, mounts and the diagnostic image were cleaned up. Multi-worker sharing has not yet been exercised.

The full provision helper keeps NFS and workers parallel, tracks the NFS job explicitly, and waits for it before returning. NFS VM/playbook failures now return a nonzero status even when workers succeed; worker failures also remain visible when NFS succeeds. The duplicate empty NFS installation play was removed.

### Playbook

Use the Playbook helper to run playbooks, roles, or tags on the Vagrant VM. 

Read `run/playbook --help`.

Vagrant's Ansible provisioners use `run/vagrant-ansible` through the supported `playbook_command` setting. The wrapper replaces Vagrant 2.4.9's deprecated `--inventory-file` argument with `--inventory`, forwards all other arguments, and preserves Ansible's exit status. This avoids the deprecated alias without changing the installed Vagrant package.

Privilege escalation uses `community.general.doas`, matching the Alpine base box. Install the `community.general` collection on the host if it is not supplied by your Ansible package. The box's sudo compatibility shim does not implement all options used by Ansible's default sudo plugin.

The local `ansible.cfg` uses `interpreter_python = auto_silent`: Ansible still discovers the guest Python interpreter, but suppresses its interpreter-selection warning. This applies when running the lab commands from this directory.

For disposable Vagrant VMs, the same configuration uses `StrictHostKeyChecking=no` and `UserKnownHostsFile=/dev/null`. Ansible does not check or store user known-host keys, allowing destroy/recreate cycles that regenerate keys and reuse IP addresses. This deliberately skips SSH host identity verification for Ansible runs from this lab directory; normal SSH configuration and other project configurations are not modified.

### Kubectl

The control plane includes a matching kubectl 1.36.1. Use `vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes'` from this directory. A host kubectl left at 1.29 is outside the supported version skew for this API; use a matching host client when connecting with `.kubeconfig`.

## Build an Alpine base box

`run/build-alpine` builds a local Alpine 3.24.3 amd64 UEFI Vagrant/libvirt box from the pinned [rgl recipe](build/alpine/README.md), adapted for an Arch host. It requires Packer 1.16+, QEMU/KVM and `edk2-ovmf`. Use `run/build-alpine --check` to initialize plugins and validate without booting a VM. Build output stays in `.cache/build-alpine/`. After a successful build, the helper prints the command to register the box as `myk8s/alpine-3.24`; it does not change the lab configuration or register it automatically.

## Offline OS packages

The APK cache targets Alpine **3.24 / x86_64**, using the latest packages available in that stable branch when refreshed. `apk-packages.json` lists the requested packages and repositories; `apk-packages.lock.json` records every cached filename and SHA-256. Each directory includes its complete recursive dependency set, so provisioning needs no Alpine mirror access. Shared dependencies appear in multiple groups to keep each existing wildcard installation self-contained.

Current OS package versions include Python 3.14.10-r1, UFW 0.36.2-r4, iptables 1.8.13-r0, HAProxy 3.4.7-r0, Unbound 1.25.2-r2, rsyslog 8.2604.0-r0 and nfs-utils 2.6.4-r6. Python's Kubernetes client is 34.1.0-r1. The iptables package uses the **nf_tables** backend rather than the previous cache's legacy backend.

Cluster packages are pinned to the tested Alpine builds: Kubernetes 1.36.1-r2, cri-tools 1.36.0-r3, containerd/ctr 2.3.7-r0, runc 1.4.3-r2 and CNI plugins 1.9.1-r4. `etcdctl` 3.5.12 remains cached for the existing exercises; its health query was tested against the new server. Snapshot restoration is outside this bootstrap test: the legacy `pb/ic` restore task must be migrated to a matching `etcdutl` before using it with etcd 3.6 snapshots.

After cloning and pulling LFS, verify the files without network access:

```bash
run/cache-apk --check
```

To refresh OS packages from the configured Alpine 3.24 repositories, run `run/cache-apk`. This Linux x86_64 helper needs Python 3, `bsdtar` and internet access. It downloads a checksum-pinned Alpine package resolver and release keyring into `.cache/apk/`, resolves dependencies using Alpine's own solver, and verifies every APK signature before replacing any tracked package group. A temporary unsigned index describes the pinned cluster packages; downloaded packages still undergo strict signature verification. It does not start VMs or change the container image archives. Review the cache and lock changes, test provisioning, then commit the APKs with Git LFS.

Provisioning's shell bootstrap rejects an older Alpine release before installing this cache and stops immediately if an APK installation fails. Recreate older lab VMs with the current base box instead of applying the 3.24 package cache to Alpine 3.19.

Validation on 4 November 2026: all 312 cached APK files passed Alpine signature verification. `lb0` and `cp0` were created from the Alpine 3.24.3 base box and provisioned using the local APK and image caches. Kubernetes reports `cp0` Ready on v1.36.1 with containerd 2.3.7; all six system Pods are 1/1 Running with zero restarts. API readiness succeeded directly and through the authenticated host connection to `https://10.1.2.10:9443`; etcd health and DNS queries through CoreDNS and Unbound passed.

## Kubernetes and containerd configuration

`kubernetes.json` pins the Kubernetes version and image references used by the Ansible tasks and image-cache helper. The kubeadm template uses `kubeadm.k8s.io/v1beta4` and explicitly sets `kubernetesVersion`, so offline initialization does not query the upstream release channel. It advertises the control plane's private `eth1` address. Kubelet's OpenRC arguments likewise select the private node address.

Kubelet and runc use the `cgroupfs` driver with OpenRC's unified cgroup v2 hierarchy. Provisioning starts/enables the `cgroups` service and checks `/sys/fs/cgroup/cgroup.controllers`. BusyBox `stat -f %T` reports `UNKNOWN` for this filesystem on the tested box, so it is not used as the readiness check.

Alpine's containerd 2.3 package supplies config version 4 and the CNI path `/usr/libexec/cni`. Provisioning writes `/etc/containerd/conf.d/20-kubernetes.toml`, which the packaged configuration imports. This pins `pinned_images.sandbox` to the cached pause image and keeps `SystemdCgroup = false`. The old `sandbox_image` replacement is no longer used. Containerd restarts when this drop-in changes.

The offline containerd group includes its matching `containerd-ctr` client. For runtime diagnostics, use `vagrant ssh cp0 -c 'doas crictl images'` or `vagrant ssh cp0 -c 'doas ctr --namespace k8s.io images list'`.

## Offline Kubernetes images

The Git LFS OCI archives contain verified Linux/amd64 image manifests, configurations and layers from the official Kubernetes registry. `kubernetes-images.lock.json` records the index/manifest digests and archive SHA-256 values. Pull LFS after cloning to restore the archives; provisioning never downloads them.

The control plane archive contains:

- `registry.k8s.io/kube-apiserver:v1.36.1`
- `registry.k8s.io/kube-controller-manager:v1.36.1`
- `registry.k8s.io/kube-scheduler:v1.36.1`
- `registry.k8s.io/kube-proxy:v1.36.1`
- `registry.k8s.io/coredns/coredns:v1.14.2`
- `registry.k8s.io/pause:3.10.2`
- `registry.k8s.io/etcd:3.6.8-0`

The worker archive contains only kube-proxy and pause. Both archives are imported with `ctr --namespace k8s.io images import --platform linux/amd64` before initialization or joining, creating the named image records and unpacking layers. The control plane import/startup and the `wo0`/`wo1` worker imports/joins have been tested. Both control-plane replica joins passed before the network-address changes; the remaining workers have not been validated.

- `control-plane-v1.36.1-amd64.tar`: 144,558,080 bytes; SHA-256 `bf1a53a625fb3bfab468dea81a9bba5cdd18554f4b06c29903481214a9c86495`.
- `worker-v1.36.1-amd64.tar`: 29,184,000 bytes; SHA-256 `57e58b15b992a5bc5f4ee72170f6378af4e189973111731a0d7c4cdd7ca6373f`.

To rebuild the archives online, run `run/cache-images` (Python 3.11+). It reads `kubernetes.json`, selects each registry's Linux/amd64 manifest, verifies content hashes and platform metadata, and writes deterministic OCI archives plus their lockfile. It does not start VMs. For an existing node, `run/playbook -h cp0 -b install -t blobs` imports the cached control plane archive again.

The bridge CNI is retained. The Service network is now separate from VM addresses; see the network addressing section. Earlier bootstrap checks do not establish general cross-node Pod connectivity or failover of the single load-balancer/DNS services.

## Network addressing

`network.json` defines shared Service/DNS settings and each Kubernetes node's private address and Pod subnet. Vagrant and the generated `/etc/hosts` entries use the same node address map. The VM private network stays `10.1.2.0/24`; Kubernetes Services use `10.96.0.0/16`, with the API Service at `10.96.0.1` and CoreDNS at `10.96.0.10`. Kubeadm and kubelet use the same DNS address. Changing the Service CIDR requires a fresh cluster; this configuration is not an in-place migration of existing VMs.

Pods query CoreDNS directly. CoreDNS answers `cluster.local` and forwards other queries to Unbound on `lb0` (`10.1.2.10`). Unbound retains its `cluster.local` forwarding zone for host/VM clients, now pointing to the DNS Service IP. Its other queries go to libvirt DNS at `192.168.121.1`, which uses the host resolver. Direct requests from `lb0` to the old public upstream `1.1.1.1` timed out on the test host, while libvirt DNS answered; no host firewall policy was changed. CoreDNS handles cluster names authoritatively, so this split forwarding does not send unresolved cluster names back to Unbound.

Because `lb0` is outside Kubernetes, it needs a route to the Service subnet via `cp0` (`10.1.2.20`). The DNS playbook installs and applies `/etc/network/if-up.d/myk8s-service-route`; Alpine reapplies it when the private interface comes up. This preserves the existing dependency on `cp0` for host-side cluster DNS. No new networking component is installed. The DNS playbook updates the kubeadm-created Service without deleting/recreating it.

Validation on 4 November 2026 (Service/DNS checkpoint): a fresh `lb0`/`cp0` bootstrap produced a Ready control plane and six ready system Pods. API and DNS Services have the new addresses; kubelet uses `10.96.0.10`. CoreDNS and Unbound both resolved the Kubernetes API name to `10.96.0.1`, external DNS resolved, and a missing Service name returned NXDOMAIN. Unbound cluster DNS passed over UDP and TCP after rebooting `lb0`; its static Service route survived. The following Pod-routing checkpoint extends these checks across nodes.

### Static Pod routing

The existing `bridge`, `host-local` and `portmap` plugins are retained. The old IPv6 pool is removed; kubeadm and the Pod network are IPv4-only. The Pod range is `10.88.0.0/16`, split into fixed, disjoint `/24` subnets:

| Node | Private IP / route gateway | Pod subnet |
| --- | --- | --- |
| cp0 | 10.1.2.20 | 10.88.0.0/24 |
| cp1 | 10.1.2.21 | 10.88.1.0/24 |
| cp2 | 10.1.2.22 | 10.88.2.0/24 |
| wo0 | 10.1.2.30 | 10.88.10.0/24 |
| wo1 | 10.1.2.31 | 10.88.11.0/24 |
| wo2 | 10.1.2.32 | 10.88.12.0/24 |
| wo3 | 10.1.2.33 | 10.88.13.0/24 |
| wo4 | 10.1.2.34 | 10.88.14.0/24 |
| wo5 | 10.1.2.35 | 10.88.15.0/24 |

For example, `wo0` reaches `10.88.11.0/24` through `10.1.2.31` on `eth1`; `wo1` reaches `10.88.10.0/24` through `10.1.2.30`. Each node has routes for all configured peers, including peers not yet provisioned. Its own Pod subnet is connected through `cni0`, created when its first non-host-network Pod starts. `/etc/network/if-up.d/myk8s-pod-routes` reapplies peer routes after the private interface comes up.

Kubeadm sets the aggregate `podSubnet` for kube-proxy's cluster-traffic detection. The controller-manager's automatic CIDR allocator is disabled: fixed allocations must not depend on join order. After initialization/join, Ansible records the configured subnet as the Node's `spec.podCIDR`/`spec.podCIDRs`, rejecting a conflicting existing allocation. Recreate old-layout nodes; changing their CNI subnet underneath existing Pods is not supported.

The bridge does not install its per-Pod masquerading rules. `/etc/ufw/after.init` instead maintains one idempotent egress NAT rule per node: traffic from its local Pod subnet to destinations outside `10.88.0.0/16` is masqueraded. Cross-node Pod traffic retains its original source IP. Kube-proxy still handles Service translation and hairpin NAT; the bridge enables hairpin mode. Containerd restarts when its CNI template or runtime drop-in changes.

Incoming/outgoing VM access retains the existing permissive training policy. The default routed policy is explicitly **deny**, checked after IP forwarding is enabled. Scoped forwarding rules permit local-to-remote Pod traffic, remote-to-local Pod traffic, Pod DNS to Unbound, Pod API requests to the control planes, and Unbound queries reaching CoreDNS after Service DNAT. `run/playbook -h cp0,wo0,wo1 -b install -t pod-network` reapplies the networking configuration. The DNS playbook waits for CoreDNS availability, so failed Pod startup cannot be reported as successful provisioning.

This is a static lab network: adding a node requires extending `network.json` and applying peer routes on existing nodes. NetworkPolicy enforcement, routing failover, load-balancer HA, arbitrary Pod Internet egress and multi-worker NFS sharing are outside the current validation. No additional networking component is required.

Validation on 4 November 2026 (static routing checkpoint): `cp0`, `wo0` and `wo1` are Ready on v1.36.1 with eight ready system Pods. All three diagnostic Pods passed the direct/Service/DNS/API matrix above, then passed it again after all three Kubernetes VMs were rebooted with `--no-provision`. After reboot, each node had IP forwarding enabled, all eight peer routes, exactly one Pod egress NAT rule, and UFW's routed deny policy. Two UFW reloads on `wo1` also preserved exactly one NAT rule. Reapplying the final Pod-network playbook reported zero changes on all three nodes; reapplying CoreDNS and its availability check reported zero changes. Diagnostic Pods, Services, namespace, image records and uploaded archives were removed. The four requested VMs (`lb0`, `cp0`, `wo0`, `wo1`) remain running. Other nodes were not started for this checkpoint.

## Kubeadm initialization logs

When the initialization task runs, Ansible launches `kubeadm init` with `--v=5` and writes both standard output and standard error to `/var/log/kubeadm-init.log` on `cp0`. Each attempt replaces the previous log. The log is owned by `root:vagrant` with mode `0640`, allowing the Vagrant user to read it. Shell redirection preserves kubeadm's exit status, so Ansible still reports initialization failures.

Follow it from another host terminal with `run/log watch -h cp0 -n kubeadm`, or read it with `run/log cat -h cp0 -n kubeadm`. Watch mode retries while waiting for the file to appear and follows the filename if the file is replaced. Ansible continues to own the initialization process; the helper only reads its log over SSH.

The existing `/etc/kubernetes/admin.conf` guard still controls whether initialization runs. That file may exist after a partially failed initialization; its existence alone does not establish a healthy control plane. Logging applies to the next task invocation and does not capture a command already running.
