#!/bin/sh

clustername=$1
echo "****************************************************************************************************"
echo "Delete the cluster"
k3d cluster delete ${clustername}
sudo rm -Rf "$HOME/srv/k3d/${clustername}"

echo "****************************************************************************************************"
