#!/bin/sh
echo "get sealedsecret public cert => public-cert.pem"
kubectl get secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key -o jsonpath="{.items[0].data['tls\.crt']}" | base64 -d > public-cert.pem 
cat public-cert.pem