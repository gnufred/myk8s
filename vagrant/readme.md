# MyK8s Vagrant lab

Latest Vagrant configuration for my K8s labs.

## Usage

### Host services

After a host reboot, run `run/services` to start the `virtqemud`, `virtstoraged`, and `virtnetworkd` systemd sockets used by libvirt. The command asks for sudo when needed and reports each socket's status. Use `run/services status` to check without starting anything. These sockets activate their daemons on demand; they are not enabled for automatic startup by this helper.

The host firewall must still allow traffic on the libvirt management bridge; the bridge name and existing UFW rules depend on the host configuration. This helper does not modify firewall rules or start VMs.

### Provision

Use `run/provision`.

### Playbook

Use the Playbook helper to run playbooks, roles, or tags on the Vagrant VM. 

Read `run/playbook --help`.

The local `ansible.cfg` uses `interpreter_python = auto_silent`: Ansible still discovers the guest Python interpreter, but suppresses its interpreter-selection warning. This applies when running the lab commands from this directory.

For disposable Vagrant VMs, the same configuration uses `StrictHostKeyChecking=no` and `UserKnownHostsFile=/dev/null`. Ansible does not check or store user known-host keys, allowing destroy/recreate cycles that regenerate keys and reuse IP addresses. This deliberately skips SSH host identity verification for Ansible runs from this lab directory; normal SSH configuration and other project configurations are not modified.

### Kubectl

Use `run/kubectl` to run Kubectl commands on the Vagrant VM.

## Offline containerd tools

The `.lfs/apk/containerd/` cache includes `containerd-ctr-1.7.2-r4.apk`, which supplies the `ctr` diagnostic client and matches the cached containerd daemon's version and Alpine packaging commit. The existing `Install containerd packages` task in `pb/install/main.yml` installs every APK in this directory, including this client, without network access.

- Source: [official Alpine v3.18 x86_64 package](https://dl-cdn.alpinelinux.org/alpine/v3.18/community/x86_64/containerd-ctr-1.7.2-r4.apk), matching the existing daemon package's build.
- SHA-256: `c66b48d4b7a3d70234c258c702d7f9690230cdfeb353bda67bd406a594a169e6`.
- The package is stored with Git LFS; run `git lfs pull` after cloning.

For an existing `cp0`, run `vagrant rsync cp0`, then `run/playbook -h cp0 -b install -t containerd` to sync the cache and rerun its containerd installation tasks. New provisioning runs pick up the package automatically.

## Offline Kubernetes images

The `.lfs/images/control-plane-v1.29.2-amd64.tar` OCI archive is stored in Git LFS. Run `git lfs pull` after cloning to restore it along with the cached APKs and raw image blobs. Its SHA-256 is `fec7ecbbbf4b6f6fd7d5dae51aa82630428af676ccf7462108190d987c39f5d5`.

The archive contains the original cached Linux/amd64 manifests, configurations and layers, with image references verified against the official Kubernetes registry manifests:

- `registry.k8s.io/kube-apiserver:v1.29.2`
- `registry.k8s.io/kube-controller-manager:v1.29.2`
- `registry.k8s.io/kube-scheduler:v1.29.2`
- `registry.k8s.io/kube-proxy:v1.29.2`
- `registry.k8s.io/coredns/coredns:v1.11.1`
- `registry.k8s.io/pause:3.9`
- `registry.k8s.io/etcd:3.5.10-0`

The `containerd` tasks configure `sandbox_image = "registry.k8s.io/pause:3.9"` in `/etc/containerd/config.toml` on control planes and workers, matching the image required by kubeadm v1.29.2. Containerd restarts when this setting changes; otherwise the service is simply ensured to be running. This prevents the runtime from trying to download its packaged `pause:3.8` default. The sandbox image must also be present locally on each node for offline Pod startup; separate control plane and worker archives supply it.

The `blobs` tasks in `pb/install/main.yml` copy this archive to each control plane and run `ctr --namespace k8s.io images import --platform linux/amd64 /tmp/myk8s-control-plane-images.tar`. This registers the content and named image records and unpacks the layers without downloading images. The import runs on each invocation so a pre-existing content directory cannot cause the metadata-registration step to be skipped.

For an existing `cp0`, run `run/playbook -h cp0 -b install -t blobs`, then inspect `vagrant ssh cp0 -c "sudo crictl images"`. The archive and import command were manually verified on `cp0`: all seven images unpacked successfully and appeared through CRI. This validates image loading; kubelet/control-plane startup is a separate check.

The `.lfs/images/worker-v1.29.2-amd64.tar` OCI archive is also stored in Git LFS. It contains only `registry.k8s.io/pause:3.9` and `registry.k8s.io/kube-proxy:v1.29.2`, using the same verified Linux/amd64 content as the control plane archive. Its size is 28,692,480 bytes (27.4 MiB), and its SHA-256 is `68ef070ecccf50b5a26ba843711e356da13af1cc4fa71c29900317b0fa0b8eb7`.

The worker `blobs` tasks copy this smaller archive to `wo0` through `wo5` and import it into containerd's `k8s.io` namespace before the provisioning helper joins each worker to the cluster. Control planes retain their seven-image archive. For an existing worker, run `run/playbook -h wo1 -b install -t blobs` to load the two required images without rerunning its join. Kubelet retries failed Pod creation; recreating a kube-proxy Pod after the images were imported was manually verified to start it on a worker.

## Kubeadm initialization logs

When the initialization task runs, Ansible launches `kubeadm init` with `--v=5` and writes both standard output and standard error to `/var/log/kubeadm-init.log` on `cp0`. Each attempt replaces the previous log. The log is owned by `root:vagrant` with mode `0640`, allowing the Vagrant user to read it. Shell redirection preserves kubeadm's exit status, so Ansible still reports initialization failures.

Follow it from another host terminal with `run/log watch -h cp0 -n kubeadm`, or read it with `run/log cat -h cp0 -n kubeadm`. Watch mode retries while waiting for the file to appear and follows the filename if the file is replaced. Ansible continues to own the initialization process; the helper only reads its log over SSH.

The existing `/etc/kubernetes/admin.conf` guard still controls whether initialization runs. That file may exist after a partially failed initialization; its existence alone does not establish a healthy control plane. Logging applies to the next task invocation and does not capture a command already running.
