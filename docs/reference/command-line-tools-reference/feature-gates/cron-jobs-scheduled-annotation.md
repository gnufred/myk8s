---
title: CronJobsScheduledAnnotation
content_type: feature_gate
_build:
  list: never
  render: false

stages:
  - stage: beta
    defaultValue: true
    fromVersion: "1.28"
---
Set the scheduled job time as an
{{}} on Jobs that were created
on behalf of a CronJob.
