#!/bin/bash
talosctl patch --mode=no-reboot machineconfig -n 10.20.0.21 --patch '[{"op": "add", "path": "/machine/sysctls", "value": {"vm.nr_hugepages": "1024"}}, {"op": "add", "path": "/machine/kubelet/extraArgs", "value": {"node-labels": "openebs.io/engine=mayastor"}}]'
talosctl patch --mode=no-reboot machineconfig -n 10.20.0.22 --patch '[{"op": "add", "path": "/machine/sysctls", "value": {"vm.nr_hugepages": "1024"}}, {"op": "add", "path": "/machine/kubelet/extraArgs", "value": {"node-labels": "openebs.io/engine=mayastor"}}]'
talosctl patch --mode=no-reboot machineconfig -n 10.20.0.23 --patch '[{"op": "add", "path": "/machine/sysctls", "value": {"vm.nr_hugepages": "1024"}}, {"op": "add", "path": "/machine/kubelet/extraArgs", "value": {"node-labels": "openebs.io/engine=mayastor"}}]'
#talosctl patch --mode=no-reboot machineconfig -n 10.20.0.24 --patch '[{"op": "add", "path": "/machine/sysctls", "value": {"vm.nr_hugepages": "1024"}}, {"op": "add", "path": "/machine/kubelet/extraArgs", "value": {"node-labels": "openebs.io/engine=mayastor"}}]'
kubectl label node talos-10-20-0-21 openebs.io/engine=mayastor
kubectl label node talos-10-20-0-22 openebs.io/engine=mayastor
kubectl label node talos-10-20-0-23 openebs.io/engine=mayastor
#kubectl label node talos-10-20-0-24 openebs.io/engine=mayastor
talosctl -n 10.20.0.21 service kubelet restart
talosctl -n 10.20.0.22 service kubelet restart
talosctl -n 10.20.0.23 service kubelet restart
#talosctl -n 10.20.0.24 service kubelet restart