# kubectl: host <=> guest authentication 

Goal: Add automatic configuration of `kubectl` authentication between the host machine and the control plane.

## Docs

* https://kubernetes.io/docs/tasks/administer-cluster/certificates/
* https://medium.com/@mehmetodabashi/authentication-and-authorization-in-kubernetes-client-certificates-and-role-based-access-control-d4e98a3c1098
* https://kubernetes-tutorial.schoolofdevops.com/configuring_authentication_and_authorization/
* https://kubernetes.io/docs/reference/access-authn-authz/authentication/#x509-client-certificates

## It works!

First, add `127.0.0.1	kubernetes.default.svc.cluster.local` to `/etc/hosts`

Then:

```
vagrant up
./kctl get pods
```
