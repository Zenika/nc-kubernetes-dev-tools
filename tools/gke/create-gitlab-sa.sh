#!/usr/bin/env bash

kubectl create ns gitlab
kubectl create -n gitlab serviceaccount gitlab
kubectl create -n gitlab clusterrolebinding gitlab-cluster-admin-binding --clusterrole=cluster-admin --service-accound=gitlab:gitlab
kubectl get -n gitlab $(kubectl get -n gitlab secret -o name | grep gitlab) -o yaml
