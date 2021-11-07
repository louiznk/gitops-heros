#!/bin/bash
echo "****************************************************************************************************"
echo "Before you need to manually install argocli"
echo "First install argocli"
echo "VERSION=$(curl --silent \"https://api.github.com/repos/argoproj/argo-cd/releases/latest\" | grep '\"tag_name\"' | sed -E 's/.*"([^\"]+)\".*/\1/')"
echo "curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64"
echo "chmod +x argocd"
echo "sudo mv argocd /usr/local/bin/argocd"
echo "----------------------------------------------------------------------------------------------------"

## 
kubectl create namespace argocd
kubectl apply -n argocd -f 0-install-2.1.5.yml 

if [ ! -z "$IP" ]
then
    cat 1-ingress.tpl | envsubst | kubectl apply -n argocd -f -
    echo "Installation de l'ingress route ... rappel https"
else
    echo "Quelle est l'ip du cluster ? export IP=..."
fi
# version avec le --insecure

## test 
## kubectl create namespace argocd
## kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.1.5/manifests/install.yaml


# https://argo-cd.readthedocs.io/en/stable/getting_started/
