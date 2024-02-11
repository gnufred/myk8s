# KubeAdm Init

## Goal

`kubeadm init` to complete.

Works as expected. Just `vagrant up`.

## Doc

* https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
* https://kubernetes.io/docs/reference/setup-tools/kubeadm/
* https://kubernetes.io/docs/concepts/overview/components/

## Learned

Kubernetes can't run in docker because it needs systemctl and docker doesn't run it.
Kubernetes, ideally, doesn't want to run in docker because you need to change kernel params.
