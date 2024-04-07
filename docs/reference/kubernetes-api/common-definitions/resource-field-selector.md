---
api_metadata:
  apiVersion: ""
  import: "k8s.io/api/core/v1"
  kind: "ResourceFieldSelector"
content_type: "api_reference"
description: "ResourceFieldSelector represents container resources (cpu, memory) and their output format."
title: "ResourceFieldSelector"
weight: 11
auto_generated: true
---





`import "k8s.io/api/core/v1"`


ResourceFieldSelector represents container resources (cpu, memory) and their output format



- **resource** (string), required

  Required: resource to select

- **containerName** (string)

  Container name: required for volumes, optional for env vars

- **divisor** (}}">Quantity)

  Specifies the output format of the exposed resources, defaults to "1"





