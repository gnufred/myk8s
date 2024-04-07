---
title: user namespace
id: userns
date: 2021-07-13
full_link: https://man7.org/linux/man-pages/man7/user_namespaces.7.html
short_description: >
  A Linux kernel feature to emulate superuser privilege for unprivileged users.

aka:
tags:
- security
---

A kernel feature to emulate root. Used for "rootless containers".



User namespaces are a Linux kernel feature that allows a non-root user to
emulate superuser ("root") privileges,
for example in order to run containers without being a superuser outside the container.

User namespace is effective for mitigating damage of potential container break-out attacks.

In the context of user namespaces, the namespace is a Linux kernel feature, and not a
{{}} in the Kubernetes sense
of the term.


