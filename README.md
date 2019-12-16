# Nightclazz Kubernetes Development/Deployment tools

## Plan

- Présentation générale de la NC
- Installation/Mise en place des pré-requis
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

## Installation des pré-requis

Avant de commencer il est nécessaire d'installer quelques utilitaires sur votre poste.

### Kustomize

Kusto

### Kubectl

### Skaffold

### Kind

## Étapes

### Mise en place de l'intégration continue

### Déploiement d'une application en dev via descripteurs

### Déploiement de l'application en dev via kustomize

### Déploiement de l'application en prod via kustomize

### (Optionnel) Déploiement de l'application en local via helm template

### Mise en place de skaffold pour déployer avec live-reload sur la dev

## Annexe/Outils

## Astuces/Bonne pratiques

- Utilisez [buildkit](https://github.com/moby/buildkit)

![Activer buildkit](resources/images/buildkit-setup.png)

- Utilisez .dockerignore
- N'utilisez pas de tag `latest`
- Si ce n'est pas sur git, ça n'existe pas
