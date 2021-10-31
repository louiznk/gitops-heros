#!/bin/bash
echo "Login to argocd <${1}>"
export KUBECONFIG="$(k3d kubeconfig merge ${1})"

argocd login \
    --insecure \
    --username admin \
    --grpc-web \
    argocd.127.0.0.1.sslip.io


