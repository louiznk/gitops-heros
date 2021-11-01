#!/bin/sh
# TODO see size g3.k3s.large"
civo kubernetes create merlin-cluster --size "g3.k3s.medium" --nodes 2 --wait --save --merge --region LON1

kubectl cluster-info
