#!/bin/bash
export TALOSCONFIG=~/cloud/00-Prepare/talosconfig
export KUBECONFIG=~/cloud/kubeconfig

# First time use : 
talosctl -e 10.20.0.11 -n 10.20.0.11 bootstrap
talosctl kubeconfig  ~/cloud

