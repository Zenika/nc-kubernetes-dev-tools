#!/usr/bin/env bash

USER=$1
ENV=dev
NAMESPACE="${USER}-${ENV}"

kubectl create ns ${NAMESPACE}
kubectl create -n ${NAMESPACE} serviceaccount ${USER}
kubectl create -n ${NAMESPACE} clusterrolebinding ${USER}-cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=${NAMESPACE}:${USER}
kubectl get -n ${NAMESPACE} $(kubectl get -n ${NAMESPACE} secret -o name | grep ${USER}) -o yaml