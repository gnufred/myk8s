---
title: Mirror Pod
id: mirror-pod
date: 2019-08-06
short_description: >
  An object in the API server that tracks a static pod on a kubelet.

aka: 
tags:
- fundamental
---
 A {{}} object that a {{}} uses
 to represent a {{}}

 

When the kubelet finds a static pod in its configuration, it automatically tries to
create a Pod object on the Kubernetes API server for it. This means that the pod
will be visible on the API server, but cannot be controlled from there.

(For example, removing a mirror pod will not stop the kubelet daemon from running it).
