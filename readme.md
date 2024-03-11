# My Kubernetes journey

My 2024 New Year resolution is to become a Kubernetes developer (one who writes Kubernetes code).

When I started learning "the Internet" 20 years ago, CSS wasn't a thing, and PHP 3 was just released. I made a lot of progress since, but I missed the Golang, and Kubernetes train. But not for long...

Time to go back to the night lab! 🌘 🖥

## Labs

### [2024-03-11](//gitlab.com/gnufred/myk8s/-/tree/2024-03-08/vagrant): Ready to use the API!

Simplify the playbook file structure, enable rsyslog on all nodes, activate logs for packet transmissions, and many other small improvements.

### [2024-03-08](//gitlab.com/gnufred/myk8s/-/tree/2024-03-08/vagrant): HighAvail control plane

Adds a load balancer, as the control plane endpoint, two new control planes, and connects workers via the LB.

### [2024-03-05](//gitlab.com/gnufred/myk8s/-/tree/2024-03-05/vagrant): Offline provisioning

VM provisioning must happens without downloading packages, or container images.

### [2024-03-03](//gitlab.com/gnufred/myk8s/-/tree/2024-03-03/vagrant): CNI plugin

Add CNI plugin to get node to change state from NotReady to Ready.

### [2024-03-02](//gitlab.com/gnufred/myk8s/-/tree/2024-03-02/vagrant): Alpine control plane

Convert the Ubuntu control plane to an Alpine Linux control plane.

### [2024-02-28](https://training.linuxfoundation.org/training/kubernetes-fundamentals-lfs258-cka-exam-bundle/): LFS258 + CKA bundle

Having goals and deadline is important. As such, I purchased the LFS258 + CKA bundle. Clock is ticking! 365 day left to get the cert :)

### [2024-02-23](//gitlab.com/gnufred/myk8s/-/tree/2024-02-23/vagrant): Alpine worker

Add an Alpine Linux worker node.

### [2024-02-20](//gitlab.com/gnufred/myk8s/-/tree/2024-02-20/vagrant): Improve

Secure host/guest TLS. Ansible refactoring. Other stuff.

### [2024-02-18](//gitlab.com/gnufred/myk8s/-/tree/2024-02-18/24-03-18_ufw): UFW firewall

Add UFW rules to the control plane nodes.

### [2024-02-17](//gitlab.com/gnufred/myk8s/-/tree/2024-02-17/24-03-17_btr-ans): Refactor everything

Refactor everything I've done so far. Everything is now absolutely perfect!

### [2024-02-15](//gitlab.com/gnufred/myk8s/-/tree/2024-02-15/24-03-15_usr-auth): Ansible auth

Configure the control plane user authentication via Ansible.

### [2024-02-13](//gitlab.com/gnufred/myk8s/-/tree/2024-02-13/24-02-13_kubeadm-init-ansible): Ansible kubeadm init

Covert each step of the `kubeadm init` processes into Ansible roles, in a new playbook. Provision a Vagrant VM where `kubectl cluster-info` runs as expected.

### [2024-02-12](//gitlab.com/gnufred/myk8s/-/tree/2024-02-12/24-02-12_ctl-ansible): Ansible pre init

Convert the Vagrant bash script to an Ansible playbook, where `kubeadm init` finishes.

### [2024-02-07](//gitlab.com/gnufred/myk8s/-/tree/2024-02-07/2024-02-07_kubectl-api): kubectl cluster-info

Provision a Vagrant VM via bash script, where `kubectl cluster-info` runs as expected.

### [2024-02-06](//gitlab.com/gnufred/myk8s/-/tree/2024-02-06/2024-02-06_kubeadm-init): kubeadm init

Provision a Vagrant VM with a bash script where `kubeadm init` finishes.

### [2024-02-05](//gitlab.com/gnufred/myk8s/-/tree/2024-02-05/2024-02-05_install_kubectl): Install kubectl

Write a bash script that installs and updates the `kubectl` cli on my workstation.
