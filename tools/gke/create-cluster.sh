#!/usr/bin/env bash

gcloud container clusters create nc-kubedev

NODES=$(gcloud compute instances list --format json | jq -r '.[].name' | grep gke-nc-kubedev)
while read -r NODE; do
    echo ${NODE}
    gcloud compute instances add-tags ${NODE} --tags http-server
done <<< "$NODES"