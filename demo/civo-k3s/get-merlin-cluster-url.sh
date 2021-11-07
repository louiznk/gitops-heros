#!/bin/sh
URL=$(civo kubernetes config merlin-cluster | yq eval '.clusters.[0].cluster.server' -)
echo $URL
echo $URL | xclip -sel clip