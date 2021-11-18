#!/bin/bash
set -
DIR=$(dirname "$0")
pushd $DIR

if [ "x$1" == "x" ]
then
  name="gandalf"
else
  name=$1
fi
clustername="$name-cluster"

civo kubernetes config $clustername | sed "s/server:.*/server: https:\/\/kubernetes.default:443/g" > kubeconfig.local
echo "Create kubeconfig for local runner in kubeconfig.local\n"
xclip -sel clip < kubeconfig.local

cat kubeconfig.local

popd