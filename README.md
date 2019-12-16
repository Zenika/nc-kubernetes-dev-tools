# Nightclazz Kubernetes Development/Deployment tools

## Plan

- Présentation générale de la Nightclazz
- Mise en place des pré-requis
- Étapes
  - Mise en place de l'intégration continue (construire l'image de conteneur)
  - Déploiement d'une application en dev via descripteurs
  - Déploiement de l'application en dev via kustomize
  - Déploiement de l'application en prod via kustomize
  - (Optionnel) Déploiement de l'application en local via helm template
  - Mise en place de skaffold pour déployer avec live-reload sur la dev
- Annexe/Outils
  - kind
  - k3s/k3d
  - kustomize
  - skaffold
- Astuces

## Présentation générale

L'objectif de cette Nightclazz est de se familiariser avec quelques outils de
la galaxie Kubernetes qui permettent :

- De simplifier les déploiement
- D'utiliser Kubernetes au plus tôt et d'en simplifier l'usage
- De profiter de fonctions de live-reload dès le développement

## Mise en place des pré-requis

Pour commencer, vous pouvez cloner le repository [https://github.com/Zenika/nc-kubernetes-dev-tools](https://github.com/Zenika/nc-kubernetes-dev-tools)
Celui-ci contient les éléments nécessaires et l'application que nous allons déployer sur Kubernetes.

Ensuite connectez-vous sur le gitlab suivant : [https://gitlab.pyaillet.tech/](https://gitlab.pyaillet.tech/) en utilisant les informations de connexion qui vous serons communiquées.

Sur cette instance gitlab, vous devez avoir accès à un espace (group) permettant de stocker et gérer vos projets.
Pour pouvoir envoyer pousser votre code sur ce gitlab, il sera nécessaire d'y ajouter une clé ssh.
Vous pouvez vous référer à la [documentation officielle de gitlab](https://docs.gitlab.com/ee/ssh/) si vous ne savez pas comment procéder, demander l'aide des animateurs ou d'un autre participant.

Il faudra ensuite créer un projet `app`, faites attention à bien le créer dans le group qui vous est affecté car celui-ci contient les variables permettant de se connecter et déployer sur le cluster Kubernetes. Pour vous en assurer consultez l'onglet `Groups` > `Your groups`. Dans votre group allez dans `settings` > `CI / CD`, dépliez la section `Variables`. Celle-ci doit contenir 2 variables `KUBECONFIG_DEV`et `KUBECONFIG_PROD` qui contiennent les informations permettant de se connecter à un cluster [GKE](https://cloud.google.com/kubernetes-engine/?hl=fr) et d'y déployer l'application.

Une fois le projet créé :

- Clonez-le dans un répertoire sur votre ordinateur
- Copiez le contenu du répertoire `app` du projet [https://github.com/Zenika/nc-kubernetes-dev-tools](https://github.com/Zenika/nc-kubernetes-dev-tools) dans ce répertoire et assurez-vous de pouvoir pousser vos modifications sur gitlab.

Félicitations ! La mise en place est terminée.

## Étapes

Les étapes suivantes doivent vous permettre de déployer votre projet sur kubernetes en utilisant des pipelines de type gitops.
Pour vous faire une idée plus précise

### Mise en place de l'intégration continue



### Déploiement d'une application en dev via descripteurs

### Déploiement de l'application en dev via kustomize

### Déploiement de l'application en prod via kustomize

### (Optionnel) Déploiement de l'application en local via helm template

### Mise en place de skaffold pour déployer avec live-reload sur la dev

## Annexe/Outils

### Kustomize

Kusto

### Kubectl

### Skaffold

### K3d

## Solutions

Les solutions sont disponibles sur le repository sur la branche [app/solutions](https://github.com/Zenika/nc-kubernetes-dev-tools/tree/app/solutions).

## Astuces/Bonne pratiques

- Utilisez [buildkit](https://github.com/moby/buildkit)

![Activer buildkit](resources/images/buildkit-setup.png)

- Utilisez .dockerignore
- N'utilisez pas de tag `latest`
- **Si ce n'est pas sur git, ça n'existe pas**
