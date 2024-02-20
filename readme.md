# My Kubernetes journey

My 2024 New Year resolution is: Become a Kubernetes developer (one who writes Kubernetes code).

When I started learning "the Internet" 20 years ago, CSS wasn't a thing, and PHP 3 just released. I made a lot of progress since, but I missed the Golang, and Kubernetes train. But not for long...

Time to go back to the night lab! 🌘 🖥

## Labs

### 24-02-18: [UFW firewall](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-18/24-03-18_ufw?ref_type=tags)

Add UFW rules to the control plane nodes.

### 24-02-17: [Refactor everything](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-17/24-03-17_btr-ans?ref_type=tags)

Refactor everything I've done so far. Everything is now absolutely perfect!

### 24-02-15: [Ansible auth](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-15/24-03-15_usr-auth?ref_type=tags)

Configure the control plane user authentication via Ansible.

### 24-02-13: [Ansible kubeadm init](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-13/24-02-13_kubeadm-init-ansible?ref_type=tags)

Covert each steps of the `kubeadm init` processes into Ansible roles, in a new playbook. Provision a Vagrant VM where `kubectl cluster-info` runs as expected.

### 24-02-12: [Ansible pre init](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-12/24-02-12_ctl-ansible?ref_type=tags)

Convert the Vagrant bash script to an Ansible playbook, where `kubeadm init` finishes.

### 24-02-07: [kubectl cluster-info](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-07/2024-02-07_kubectl-api?ref_type=tags)

Provision a Vagrant VM via bash script, where `kubectl cluster-info` runs as expected.

### 24-02-06: [kubeadm init](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-06/2024-02-06_kubeadm-init?ref_type=tags)

Provision a Vagrant VM with a bash script where `kubeadm init` finishes.

### 24-02-05: [Install kubectl](https://gitlab.com/gnufred/myk8s/-/tree/2024-02-05/2024-02-05_install_kubectl?ref_type=tags)

Write a bash script that install and update the `kubectl` cli on my workstation.
