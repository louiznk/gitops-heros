#!/bin/sh

civo kubernetes config merlin-cluster | sed "s/server:.*/server: https:\/\/kubernetes.default:443/g" > kubeconfig.local
echo "Create kubeconfig for local runner in kubeconfig.local\n"
xclip -sel clip < kubeconfig.local

cat kubeconfig.local
