#!/bin/sh
# Mettre à jour le token dans le fichier values.yaml (à partir de https://gitlab.com/groups/gitops-heros/-/settings/ci_cd)
# Ou utiliser l'arg
# Installation https://docs.gitlab.com/runner/install/kubernetes.html

EXIST=$(helm repo list | grep "gitlab.*https://charts.gitlab.io" | wc -l)
if [ "x$EXIST" = "x1" ]
then
    helm repo update gitlab
else
    helm repo add gitlab https://charts.gitlab.io
fi


EXIST=$(helm ls -n gitlab-managed-apps | grep "gitlab-runner" | wc -l)
if [ "x$EXIST" = "x1" ]
then
    echo "deleting the runner already installed for update"
    helm delete gitlab-runner -n gitlab-managed-apps
fi

if [ -z "$1" ]
then
    echo "install avec les valeurs par défaut dans le values.yaml"
    helm install --create-namespace --namespace gitlab-managed-apps gitlab-runner -f values.yaml gitlab/gitlab-runner
else
    echo "install et surchage le token du repo gitlab"
    helm install --create-namespace --namespace gitlab-managed-apps gitlab-runner -f values.yaml --set "runnerRegistrationToken=$1" gitlab/gitlab-runner --wait
fi