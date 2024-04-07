---
title: ConfigMap
id: configmap
date: 2018-04-12
full_link: /docs/concepts/configuration/configmap/
short_description: >
  An API object used to store non-confidential data in key-value pairs. Can be consumed as environment variables, command-line arguments, or configuration files in a volume.

aka: 
tags:
- core-object
---
 An API object used to store non-confidential data in key-value pairs.
{{}} can consume ConfigMaps as
environment variables, command-line arguments, or as configuration files in a
{{}}.

 

A ConfigMap allows you to decouple environment-specific configuration from your {{}}, so that your applications are easily portable.
