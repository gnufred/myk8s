# My Kubernetes journey

My 2024 New Year resolution is: Become a Kubernetes developer (one who writes Kubernetes code).

When I started learning "the Internet" 20 years ago, CSS wasn't a thing, and PHP 3 just released. I made a lot of progress since, but I missed the Golang, and Kubernetes train. But not for long...

Time to go back to the night lab! 🌘 🖥

## Labs

### [ufw: firewall](./24-03-18_ufw/)

Add UFW rules to the control plane nodes.

### [refactor everything](./24-03-17_btr-ans/)

Refactor everything I've done so far. Everything is now absolutely perfect!

### [ansible auth](./24-03-15_usr-auth/)

Configure the control plane user authentication via Ansible.

### [ansible kubeadm init](./24-02-13_kubeadm-init-ansible/)

Covert each steps of the `kubeadm init` processes into Ansible roles, in a new playbook. Provision a Vagrant VM where `kubectl cluster-info` runs as expected.

### [ansible pre init](./24-02-12_ctl-ansible/)

Convert the Vagrant bash script to an Ansible playbook, where `kubeadm init` finishes.

### [kubectl cluster-info](./24-02-07_kubectl-api/)

Provision a Vagrant VM via bash script, where `kubectl cluster-info` runs as expected.

### [kubeadm init](./24-02-06_kubeadm-init/)

Provision a Vagrant VM with a bash script where `kubeadm init` finishes.

### [Install kubectl](./24-02-05_install-kubectl/)

Write a bash script that install and update the `kubectl` cli on my workstation.
