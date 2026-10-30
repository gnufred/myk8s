# Home Lab

### [2024-04-05](https://github.com/gnufred/myk8s/tree/2024-04-05/vagrant): NFS server

Added an NFS server to enable PV and PVC.

### [2024-03-11](https://github.com/gnufred/myk8s/tree/2024-03-11/vagrant): Ready to Use the API!

Simplified the playbook file structure, enabled rsyslog on all nodes, activated logs for packet transmissions, and made many other small improvements.

### [2024-03-08](https://github.com/gnufred/myk8s/tree/2024-03-08/vagrant): High Availability Control Plane

Added a load balancer as the control plane endpoint, two new control planes, and connected workers via the LB.

### [2024-03-05](https://github.com/gnufred/myk8s/tree/2024-03-05/vagrant): Offline Provisioning

VM provisioning must happen without downloading packages or container images.

### [2024-03-03](https://github.com/gnufred/myk8s/tree/2024-03-03/vagrant): CNI Plugin

Added a CNI plugin to get the node to change state from NotReady to Ready.

### [2024-03-02](https://github.com/gnufred/myk8s/tree/2024-03-02/vagrant): Alpine Control Plane

Converted the Ubuntu control plane to an Alpine Linux control plane.

### [2024-02-23](https://github.com/gnufred/myk8s/tree/2024-02-23/vagrant): Alpine Worker

Added an Alpine Linux worker node.

### [2024-02-20](https://github.com/gnufred/myk8s/tree/2024-02-20/vagrant): Improvements

Secured host/guest TLS, refactored Ansible, and other tasks.

### [2024-02-18](https://github.com/gnufred/myk8s/tree/2024-02-18/24-03-18_ufw): UFW Firewall

Added UFW rules to the control plane nodes.

### [2024-02-17](https://github.com/gnufred/myk8s/tree/2024-02-17/24-03-17_btr-ans): Refactored Everything

Refactored everything I've done so far. Everything is now absolutely perfect!

### [2024-02-15](https://github.com/gnufred/myk8s/tree/2024-02-15/24-03-15_usr-auth): Ansible Auth

Configured control plane user authentication via Ansible.

### [2024-02-13](https://github.com/gnufred/myk8s/tree/2024-02-13/24-02-13_kubeadm-init-ansible): Ansible `kubeadm init`

Converted each step of the `kubeadm init` process into Ansible roles in a new playbook. Provisioned a Vagrant VM where `kubectl cluster-info` runs as expected.

### [2024-02-12](https://github.com/gnufred/myk8s/tree/2024-02-12/24-02-12_ctl-ansible): Ansible Pre-Init

Converted the Vagrant bash script to an Ansible playbook where `kubeadm init` finishes.

### [2024-02-07](https://github.com/gnufred/myk8s/tree/2024-02-07/2024-02-07_kubectl-api): `kubectl cluster-info`

Provisioned a Vagrant VM via a bash script where `kubectl cluster-info` runs as expected.

### [2024-02-06](https://github.com/gnufred/myk8s/tree/2024-02-06/2024-02-06_kubeadm-init): `kubeadm init`

Provisioned a Vagrant VM with a bash script where `kubeadm init` finishes.

### [2024-02-05](https://github.com/gnufred/myk8s/tree/2024-02-05/2024-02-05_install_kubectl): Install `kubectl`

Wrote a bash script that installs and updates the `kubectl` CLI on my workstation.
