#!/bin/bash

if [ -z "$IP" ]
then
    ## GET IP    
    CLUSTER_IP=$(kubectl config view | yq eval '.clusters.[0].cluster.server' - | cut -d'/' -f3 | cut -d":" -f1)
    if [ "x0.0.0.0" == "x$CLUSTER_IP" ]
    then
        echo "Local cluster"
        export IP="127.0.0.1"
    else
        echo "Remote cluster $CLUSTER_IP"
        export IP=$CLUSTER_IP
    fi
fi

chromium https://argocd.$IP.sslip.io > /dev/null