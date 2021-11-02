#!/bin/fish
IP=$(civo kubernetes config merlin-cluster | yq eval '.clusters.[0].cluster.server' - | cut -d'/' -f3 | cut -d":" -f1)
echo $IP
echo $IP | xclip -sel clip
export IP=$IP
