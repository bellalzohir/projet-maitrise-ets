# Implémentation et test d'un environnement d'orchestration de ressources pour des applications serverless

Projet de maîtrise à l'ÉTS de Montréal. Le projet vise à implanter et tester une plateforme d'orchestration de ressources pour des applications serverless et analyser ses performances en termes de fiabilité et compléxité temporelle. Plus spécifiquement, il s'agit de déployer Oracle OpenWhisk sur un cluster K8s et d'intégrer les outils Terraform pour tester différentes applications serverless;

## Structure du dépôt git

2 dossiers sont présents dans ce dépôt.
    . `Openwhisk` contient les fonctions déployées sur la plateforme Openwhisk pour effectuer les tests
    . `terraform` contient les fichiers Terraform permettant le déploiement de Jenkins, Openwhisk et les outils de monitoring sur la plateforme Kubernetes.
    . `fass-profiler` **TODO**

## Déploiement d'Openwhisk et des outils de Monitoring

>­­­ **Prérequis** : Installation de l'outil [Terraform](https://www.terraform.io/downloads), version de [Kubernetes](https://github.com/kubernetes/kubernetes) supérieure à 1.19, avoir configuré sur le cluster un [Dynamic Volume Provision](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/), [OpenEBS](https://openebs.io/) a été utilisé pour ce projet.

Pour pouvoir déployer sur le cluster, Terraform a besoin des informations de connexion. Pour cela il faut placer un fichier nommé `kubeconfig` dans le dossier `terraform`. Le plus simple est de copier le fichier `~/.kube/config`s'il donne des accès administrateur au cluster.

### Installation d'Openwhisk

Si c'est le tout premier déploiement, il faut commencer par lancer la commande `terraform init`. Ce ne sera pas nécessaire dans le cas d'un nouveau déploiement.

Si besoin mettre à jour la `storageClass` dans le fichier [OW-values.yml](./terraform/OpenWhisk/OW-values.yml) à la ligne 97. Ainsi que les ports utilisés et le token d'authentification à Openwhisk à la ligne 15.

**TODO**
