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

The Alpine 3.24.3 base has passed boot, SSH key replacement and passwordless root access in a separate Vagrant smoke test. Its archived metadata uses the same tested VNC/Cirrus display configuration; the pristine Packer guest disk is preserved. The APK cache targets Alpine 3.24. A fresh `lb0` and `cp0` bootstrap plus the joins of `cp1` and `cp2` have passed with Kubernetes 1.36.1-r2 and containerd 2.3.7-r0. All three control planes are Ready, all 16 system Pods are Running, and the three etcd voting members are healthy on the private network. `wo0` has also joined and passed a Pod DNS/API test. The NFS VM (`nf0`) has passed a worker mount/read/write test and a Kubernetes PV/PVC persistence test. The other five workers have not been tested with this Kubernetes version.

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

This creates one control plane behind the existing load balancer. It is a fresh bootstrap, not an in-place upgrade of a Kubernetes 1.29 cluster. Existing VMs retain their disks; changing the base box applies when a VM is recreated. The argument-free `run/provision` builds the entire lab. The three control planes and one worker (`wo0`) have been validated for 1.36; the other five workers remain to be tested.

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

Validation on 4 November 2026: `cp0`, `cp1` and `cp2` are Ready on v1.36.1, with 16/16 system Pods Running. Etcd has three voting members, no learners, one leader and matching applied Raft indexes; health proposals succeeded at every endpoint. Authenticated `/readyz` requests passed on all three private API addresses and the load-balanced endpoint. The controller-manager and scheduler on `cp1` retain a restart count of one from the failed join/reset; retained logs distinguish that attempt from their healthy replacements. Helper checks verified sequential ordering and propagation of both provisioning and join failures.

### Add one worker

After the control plane is healthy, provision a fresh worker with:

```bash
run/provision wo0
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf get nodes -o wide'
vagrant ssh cp0 -c 'kubectl --kubeconfig=/etc/kubernetes/admin.conf -n kube-system get pods -o wide'
```

Worker provisioning remains parallel during a full bootstrap, but the helper records each worker PID and checks its exit status. A failed provision or join returns a nonzero status even if a later worker succeeds. A targeted `run/provision wo0` launches only that worker.

Validation on 4 November 2026: `wo0` joined as Ready on private IP `10.1.2.30`, running Kubernetes v1.36.1 and containerd 2.3.7. Its kube-proxy Pod is ready, bringing the system namespace to 17 ready Pods. A temporary Pod scheduled on `wo0` resolved `kubernetes.default.svc.cluster.local` and made a service-account-authenticated request to the Kubernetes API `/version` endpoint, then exited successfully. Its diagnostic image was built offline from the checksum-verified Alpine 3.24.3 minirootfs already cached by the APK helper. The temporary Pods and image were removed; the regular worker archive still contains only kube-proxy and pause.

The Pod test exposed UFW blocking forwarded packets from `cni0` despite successful node registration. The UFW module can treat the initial routed policy as already configured when it reports `disabled`, before the installation playbook enables IP forwarding. Installation now adds explicit rules for these required flows, without changing default policies:

- Pod source `10.88.0.0/16` arriving on `cni0` to the lab DNS resolver `10.1.2.10`, UDP/TCP port 53.
- The same Pod source/interface to the three private API addresses `10.1.2.20`–`10.1.2.22`, TCP port 6443. These match the destination after kube-proxy translates the API Service address/port.

The validated worker retains a deny policy for other routed traffic. For an existing installed node, `run/playbook -h wo0 -b install -t pod-network` applies just these rules. Reapplying the tested rules through Ansible reported no changes. This validates worker startup and Pod DNS/API access; general cross-node Pod routing and other workload forwarding are separate checks. NFS volume mounting and persistence have since been tested separately below. The existing shared host-local Pod subnet is not redesigned by this change.

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

Validation on 4 November 2026: `wo0` mounted `nf0:/export` over NFSv4.2/TCP, wrote/read data as UID/GID 1000, and failed a client-root write as expected. A temporary static `ReadWriteMany` NFS PV/PVC bound successfully with `nfsvers=4.2`. A non-root writer Pod on `wo0` read worker-created data and wrote its own file. After that Pod was deleted, a replacement reader Pod recovered the same file. Its contents were also verified directly on `nf0` and through the worker mount. Temporary Pods, PV/PVC, test data, mounts and the diagnostic image were cleaned up. Multi-worker sharing has not yet been exercised.

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

The worker archive contains only kube-proxy and pause. Both archives are imported with `ctr --namespace k8s.io images import --platform linux/amd64` before initialization or joining, creating the named image records and unpacking layers. The control plane import, startup, both replica joins and the `wo0` worker import/join have been tested. The other workers remain to be validated.

- `control-plane-v1.36.1-amd64.tar`: 144,558,080 bytes; SHA-256 `bf1a53a625fb3bfab468dea81a9bba5cdd18554f4b06c29903481214a9c86495`.
- `worker-v1.36.1-amd64.tar`: 29,184,000 bytes; SHA-256 `57e58b15b992a5bc5f4ee72170f6378af4e189973111731a0d7c4cdd7ca6373f`.

To rebuild the archives online, run `run/cache-images` (Python 3.11+). It reads `kubernetes.json`, selects each registry's Linux/amd64 manifest, verifies content hashes and platform metadata, and writes deterministic OCI archives plus their lockfile. It does not start VMs. For an existing node, `run/playbook -h cp0 -b install -t blobs` imports the cached control plane archive again.

The existing training network layout is preserved, including its custom CoreDNS Service address and bridge CNI configuration. These checks do not establish general cross-node Pod connectivity or failover of the single load-balancer/DNS services.

## Kubeadm initialization logs

When the initialization task runs, Ansible launches `kubeadm init` with `--v=5` and writes both standard output and standard error to `/var/log/kubeadm-init.log` on `cp0`. Each attempt replaces the previous log. The log is owned by `root:vagrant` with mode `0640`, allowing the Vagrant user to read it. Shell redirection preserves kubeadm's exit status, so Ansible still reports initialization failures.

Follow it from another host terminal with `run/log watch -h cp0 -n kubeadm`, or read it with `run/log cat -h cp0 -n kubeadm`. Watch mode retries while waiting for the file to appear and follows the filename if the file is replaced. Ansible continues to own the initialization process; the helper only reads its log over SSH.

The existing `/etc/kubernetes/admin.conf` guard still controls whether initialization runs. That file may exist after a partially failed initialization; its existence alone does not establish a healthy control plane. Logging applies to the next task invocation and does not capture a command already running.
