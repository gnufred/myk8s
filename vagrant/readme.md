# MyK8s Vagrant lab

Latest Vagrant configuration for my K8s labs.

## Usage

### Provision

Use `run/provision`.

### Playbook

Use the Playbook helper to run playbooks, roles, or tags on the Vagrant VM. 

Read `run/playbook --help`.

### Kubectl

Use `run/kubectl` to run Kubectl commands on the Vagrant VM.

## Offline containerd tools

The `.lfs/apk/containerd/` cache includes `containerd-ctr-1.7.2-r4.apk`, which supplies the `ctr` diagnostic client and matches the cached containerd daemon's version and Alpine packaging commit. The existing `Install containerd packages` task in `pb/install/main.yml` installs every APK in this directory, including this client, without network access.

- Source: [official Alpine v3.18 x86_64 package](https://dl-cdn.alpinelinux.org/alpine/v3.18/community/x86_64/containerd-ctr-1.7.2-r4.apk), matching the existing daemon package's build.
- SHA-256: `c66b48d4b7a3d70234c258c702d7f9690230cdfeb353bda67bd406a594a169e6`.
- The package is stored with Git LFS; run `git lfs pull` after cloning.

For an existing `cp0`, run `vagrant rsync cp0`, then `run/playbook -h cp0 -b install -t containerd` to sync the cache and rerun its containerd installation tasks. New provisioning runs pick up the package automatically.
