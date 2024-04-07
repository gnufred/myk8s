---
title: Security Context
id: security-context
date: 2018-04-12
full_link: /docs/tasks/configure-pod-container/security-context/
short_description: >
  The securityContext field defines privilege and access control settings for a Pod or container.

aka: 
tags:
- security
---
 The `securityContext` field defines privilege and access control settings for
a {{}} or
{{}}.



In a `securityContext`, you can define: the user that processes run as,
the group that processes run as, and privilege settings.
You can also configure security policies (for example: SELinux, AppArmor or seccomp).

The `PodSpec.securityContext` setting applies to all containers in a Pod.
