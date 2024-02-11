# KubeAdm Init

## Goal

Get `kubectl` to talk to the Vagrant VM control plane.

`kubectl --kubeconfig=vagrant.kube.config cluster-info` should work as expected.

## Docs

* https://hbayraktar.medium.com/how-to-install-kubernetes-cluster-on-ubuntu-22-04-step-by-step-guide-7dbf7e8f5f99
* https://wiki.archlinux.org/title/systemd-networkd
* Nameserver limits exceeded: https://github.com/canonical/microk8s/issues/3786
* https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
* https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
* https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/

## Learned

* Kubernetes has a limit of 3 DNS it can use
* Network is managed in configuration files by `systemd-network`, see `man systemd-network`
* System network congfig files are located at `/etc/systemd/network`
* `resolvectl` is used to check DNS resolution runtime config


## So far

```
vagrant up && vagrant ssh
kubectl cluster-info
```

Need to fix the container runtime not ready

```
Feb 08 01:41:28 vg-cplane kubelet[703]: E0208 01:41:28.897131     703 kubelet.go:2892] "Container runtime network not ready" networkReady="NetworkReady=false reason:NetworkPluginNotReady message:Network plugin returns error: cni plugin not initialized"
```
