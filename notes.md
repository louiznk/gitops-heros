## Gitlab

Groupe gitops-heros

https://gitlab.com/gitops-heros

Projets :

- integration civo
- code à deployer



## Civo

Creation d'un cluster (small | medium | large)

```
civo kubernetes create merlin-cluster --size "g3.k3s.medium" --nodes 2 --wait --save --merge --region LON1
```

## Integration Gitlab -- pas d'intérêt
02-kube-gitlab-sa.sh

ouvrir le projet, la partie kube

https://gitlab.com/groups/gitops-heros/-/clusters

Integrate cluster

Connect existing cluster
--> faire la conf


## Integration Runner

https://gitlab.com/groups/gitops-heros/-/settings/ci_cd

Aller récupérer le token du runner qm3xSoq6E_z_jxNxT-Y9


## Utilisation kubectl depuis le runner
https://gitlab.com/groups/gitops-heros/-/settings/ci_cd

Utilisation à la bourrin du kubeconfig

