# My Kubernetes journey

My 2024 New Year resolution is: Become a Kubernetes developer (one who writes Kubernetes code).

When I started learning "the Internet" 20 years ago, CSS wasn't a thing, and PHP 3 just released. I made a lot of progress since, but I missed the Golang, and Kubernetes train. But not for long...

Time to go back to the night lab! 🌘 🖥

## Labs

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

Covert each steps of the `kubeadm init` processes into Ansible roles, in a new playbook. Provision a Vagrant VM where `kubectl cluster-info` runs as expected.

### [2024-02-12](//gitlab.com/gnufred/myk8s/-/tree/2024-02-12/24-02-12_ctl-ansible): Ansible pre init

Convert the Vagrant bash script to an Ansible playbook, where `kubeadm init` finishes.

### [2024-02-07](//gitlab.com/gnufred/myk8s/-/tree/2024-02-07/2024-02-07_kubectl-api): kubectl cluster-info

Provision a Vagrant VM via bash script, where `kubectl cluster-info` runs as expected.

### [2024-02-06](//gitlab.com/gnufred/myk8s/-/tree/2024-02-06/2024-02-06_kubeadm-init): kubeadm init

Provision a Vagrant VM with a bash script where `kubeadm init` finishes.

### [2024-02-05](//gitlab.com/gnufred/myk8s/-/tree/2024-02-05/2024-02-05_install_kubectl): Install kubectl

Write a bash script that install and update the `kubectl` cli on my workstation.
