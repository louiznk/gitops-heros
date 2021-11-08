#!/bin/sh
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <secret-name> <namespace> <clef> <value>" >&2
  exit 1
fi

echo "Generate secret $3=$4"
echo "kubectl create secret generic $1 -n $2 --dry-run=client --from-literal=$3=$4 -o yaml "

kubectl create secret generic $1 -n $2 --dry-run=client --from-literal=$3="$4" -o yaml | \
kubeseal --format yaml --cert public-cert.pem > mysealedsecret.yaml

cat mysealedsecret.yaml