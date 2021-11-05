#!/bin/sh
# TODO see size g3.k3s.large"
#civo kubernetes create merlin-cluster --size "g3.k3s.medium" --nodes 2 --create-firewall "" --wait --save --region LON1
set -x -e
# --remove-applications=Traefik 
civo kubernetes create merlin-cluster --size "g3.k3s.medium" --nodes 2 --create-firewall "" --version "1.21.2+k3s1" --wait --region LON1

civo kubernetes config merlin-cluster > ${HOME}/.kubeclusters/merlin.yaml

export KUBECONFIG=${HOME}/.kubeclusters/merlin.yaml

kubectl cluster-info



## 
## civo kubernetes create merlin-cluster --size "g3.k3s.medium" --nodes 2 --create-firewall "" --version "1.20.0+k3s1" --wait --region LON1 --remove-applications=Traefik
## civo kubernetes config merlin-cluster > ${HOME}/.kubeclusters/merlin-stable.yaml
## export KUBECONFIG=${HOME}/.kubeclusters/merlin-stable.yaml
## kubectl apply -f ../k3s/traefik/ --wait 