# My Kubernetes Journey

My 2024 New Year's resolution is to become a [Kubernetes contributor](https://github.com/kubernetes/community/blob/master/contributors/guide/README.md).

When I started learning "the Internet" 20 years ago, CSS wasn't a thing, and PHP 3 had just been released. I've made a lot of progress since then, but I missed the Kubernetes train.

Time to go back to the night lab! 🌘 🖥

## Contribute

### 2024-05-04: Joined [SIG CLI](https://app.slack.com/client/T09NY5SBT/C2GL57FJ4)

That moment when you set foot in the room as a nobody. I'm reading [K8s - Community Groups](https://www.kubernetes.dev/community/community-groups/) and I've chosen SIG CLI. Why? Because I love CLIs and I love GoLang. I want to contribute a properly written alias of my current [K](https://gitlab.com/gnufred/k) prototype as my first project. Those chairs... they're all from big companies. But you know what? One day I'll be on this list. It'll be **Frédéric Potvin, [Kiln](https://www.kiln.fi/) or [Tesla](https://www.tesla.com/en_eu)** (depending on which one of those hires me, but that's another story).

For now, I'll attend meetings, read updates from the mailing list, and study for my upcoming CKA exam.


## Train

### Ongoing: [Final exam preparations](https://gitlab.com/gnufred/myk8s/-/issues/45)

Come on... I can do this!!!

### 2024-04-23: [LFS258](https://training.linuxfoundation.org/training/kubernetes-fundamentals/)

Completed: [Certificate](https://ti-user-certificates.s3.amazonaws.com/e0df7fbf-a057-42af-8a1f-590912be5460/2b01f0e0-397b-49b8-a81e-1f0628e10548-frederic-potvin-71e80add-19bb-489d-bf43-bf83a5e9be5e-certificate.pdf).

### 2024-03-18: Up and Running!

Completed study and labs from [Kubernetes: Up and Running](https://www.oreilly.com/library/view/kubernetes-up-and/9781491935668/).

### 2024-02-28: LFS258 + CKA Bundle

Having goals and deadlines is important. As such, I purchased the [LFS258 + CKA bundle](https://training.linuxfoundation.org/training/kubernetes-fundamentals-lfs258-cka-exam-bundle/). The clock is ticking! 365 days left to get the cert :)

## Home Lab

### [2024-04-05](//gitlab.com/gnufred/myk8s/-/tree/2024-04-05/vagrant): NFS server

Added an NFS server to enable PV and PVC.

### [2024-03-15](//gitlab.com/gnufred/k): kubectl aliases

Created a script to alias `kubectl` commands, resources, and options.

### [2024-03-11](//gitlab.com/gnufred/myk8s/-/tree/2024-03-11/vagrant): Ready to Use the API!

Simplified the playbook file structure, enabled rsyslog on all nodes, activated logs for packet transmissions, and made many other small improvements.

### [2024-03-08](//gitlab.com/gnufred/myk8s/-/tree/2024-03-08/vagrant): High Availability Control Plane

Added a load balancer as the control plane endpoint, two new control planes, and connected workers via the LB.

### [2024-03-05](//gitlab.com/gnufred/myk8s/-/tree/2024-03-05/vagrant): Offline Provisioning

VM provisioning must happen without downloading packages or container images.

### [2024-03-03](//gitlab.com/gnufred/myk8s/-/tree/2024-03-03/vagrant): CNI Plugin

Added a CNI plugin to get the node to change state from NotReady to Ready.

### [2024-03-02](//gitlab.com/gnufred/myk8s/-/tree/2024-03-02/vagrant): Alpine Control Plane

Converted the Ubuntu control plane to an Alpine Linux control plane.

### [2024-02-23](//gitlab.com/gnufred/myk8s/-/tree/2024-02-23/vagrant): Alpine Worker

Added an Alpine Linux worker node.

### [2024-02-20](//gitlab.com/gnufred/myk8s/-/tree/2024-02-20/vagrant): Improvements

Secured host/guest TLS, refactored Ansible, and other tasks.

### [2024-02-18](//gitlab.com/gnufred/myk8s/-/tree/2024-02-18/24-03-18_ufw): UFW Firewall

Added UFW rules to the control plane nodes.

### [2024-02-17](//gitlab.com/gnufred/myk8s/-/tree/2024-02-17/24-03-17_btr-ans): Refactored Everything

Refactored everything I've done so far. Everything is now absolutely perfect!

### [2024-02-15](//gitlab.com/gnufred/myk8s/-/tree/2024-02-15/24-03-15_usr-auth): Ansible Auth

Configured control plane user authentication via Ansible.

### [2024-02-13](//gitlab.com/gnufred/myk8s/-/tree/2024-02-13/24-02-13_kubeadm-init-ansible): Ansible `kubeadm init`

Converted each step of the `kubeadm init` process into Ansible roles in a new playbook. Provisioned a Vagrant VM where `kubectl cluster-info` runs as expected.

### [2024-02-12](//gitlab.com/gnufred/myk8s/-/tree/2024-02-12/24-02-12_ctl-ansible): Ansible Pre-Init

Converted the Vagrant bash script to an Ansible playbook where `kubeadm init` finishes.

### [2024-02-07](//gitlab.com/gnufred/myk8s/-/tree/2024-02-07/2024-02-07_kubectl-api): `kubectl cluster-info`

Provisioned a Vagrant VM via a bash script where `kubectl cluster-info` runs as expected.

### [2024-02-06](//gitlab.com/gnufred/myk8s/-/tree/2024-02-06/2024-02-06_kubeadm-init): `kubeadm init`

Provisioned a Vagrant VM with a bash script where `kubeadm init` finishes.

### [2024-02-05](//gitlab.com/gnufred/myk8s/-/tree/2024-02-05/2024-02-05_install_kubectl): Install `kubectl`

Wrote a bash script that installs and updates the `kubectl` CLI on my workstation.
