#!/bin/sh
set -x -e
civo kubernetes delete merlin-cluster --yes
#civo firewall delete merlin-cluster --yes
kubectl ctx k3d-gitops
kubectl config delete-context merlin-cluster
kubectl config delete-cluster merlin-cluster