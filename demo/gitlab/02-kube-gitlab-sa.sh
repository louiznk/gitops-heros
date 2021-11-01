#!/bin/sh
echo "Create the GitLab service account"
kubectl apply -f gitlab-service-account.yaml --wait
