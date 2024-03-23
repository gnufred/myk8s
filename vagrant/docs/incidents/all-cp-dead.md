# Incident runbook: All cluster planes are 100% dead

Use this process if all the control plane nodes are 100% dead, but workers nodes are still up and running.

## Playing this scenario

```
run/playbook -h cp0 -b ic -t etcd_backup
vagrant destroy --force cp2
vagrant destroy --force cp1
vagrant destroy --force cp0
```

You're left with an etcd bacukp and no control planes :)

## New control node

Prepare a new control plane node for recovery. You need to run all the playbooks from `run/provision` expect `init`. If you use `init`, it will use new data set.

Commands should be something like:

```
vagrant up --provision cp0
BOOKS=(ufw install) && for B in ${BOOKS[@]}; do run/playbook -h cp0 -b $B; done
```

## Upload saved certificates from the previous run

```
run/playbook -h cp0 -b ic -t pki_restore
```

## Restore etcd

List and chose a snapshot to recover: `run/etcd/restore list`.

Restore an etcd backup with `run/etcd/restore -f <backup_file>`.

## Initialise control plane

Run `run/playbook -h cp0 -b init`

## Cleanup

Delete the additional registered control planes, if any. Something like:

```
CPS=$(kubectl get nodes|grep -v wo|grep -v cp0)
for C in "$CPS"; do
  kubectl delete node $C
done
```

## TODO

At this point, everything "seems" to be working. But we can't join new workers and control planes. It just timeout. Also, changing deployments update the database but not the actual worker. So it looks like it can't reconnect to worker nodes.
