---
title: Toleration
id: toleration
date: 2019-01-11
full_link: /docs/concepts/scheduling-eviction/taint-and-toleration/
short_description: >
  A core object consisting of three required properties: key, value, and effect. Tolerations enable the scheduling of pods on nodes or node groups that have a matching taint.

aka:
tags:
- core-object
- fundamental
---
 A core object consisting of three required properties: key, value, and effect. Tolerations enable the scheduling of pods on nodes or node groups that have matching {{}}.



Tolerations and {{}} work together to ensure that pods are not scheduled onto inappropriate nodes. One or more tolerations are applied to a {{}}. A toleration indicates that the {{}} is allowed (but not required) to be scheduled on nodes or node groups with matching {{}}.
