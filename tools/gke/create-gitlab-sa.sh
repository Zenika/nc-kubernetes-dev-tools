#!/usr/bin/env bash

kubectl create ns gitlab
kubectl create -n gitlab serviceaccount gitlab
kubectl create -n gitlab clusterrolebinding gitlab-cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=gitlab:gitlab
kubectl get -n gitlab $(kubectl get -n gitlab secret -o name | grep gitlab) -o json

echo "API URL: $(gcloud container clusters describe nc-kubedev --format json | jq -r '.endpoint')"
echo "CA Certificate:\n$(gcloud container clusters describe nc-kubedev --format json | jq -r '.masterAuth.clusterCaCertificate' | base64 -D)"
echo "Service Token: $(kubectl get -n gitlab $(kubectl get -n gitlab secret -o name | grep gitlab) -o json | jq -r '.data.token' | base64 -D)"