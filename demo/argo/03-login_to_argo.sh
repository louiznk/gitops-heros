#!/bin/bash
echo "Login to argocd"

argocd login \
    --insecure \
    --username admin \
    --grpc-web \
    argocd.$IP.sslip.io


