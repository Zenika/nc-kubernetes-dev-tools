#!/usr/bin/env bash

source params.env

echo "GOOGLE_PROJECT_ID=${GOOGLE_PROJECT_ID}"
echo "RESERVED_IP=${RESERVED_IP}"
echo "GITLAB_DOMAIN=${GITLAB_DOMAIN}"

gcloud beta compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    instances create gitlab \
    --zone=us-central1-a \
    --machine-type=n1-standard-4 \
    --subnet=default --address=${RESERVED_IP} --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --tags=http-server,https-server \
    --image=ubuntu-1804-bionic-v20191113 --image-project=ubuntu-os-cloud \
    --boot-disk-size=200GB --boot-disk-type=pd-standard --boot-disk-device-name=gitlab \
    --metadata-from-file startup-script=cloud-init-script.sh \
    --metadata hostname=${GITLAB_DOMAIN} \
    --reservation-affinity=any

gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules create default-allow-ssh \
    --direction=INGRESS --priority=1000 \
    --network=default --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 \
    --target-tags=http-server

gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules create default-allow-registry \
    --direction=INGRESS --priority=1000 \
    --network=default --action=ALLOW --rules=tcp:5050 --source-ranges=0.0.0.0/0 \
    --target-tags=http-server

gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules create default-allow-http \
    --direction=INGRESS --priority=1000 \
    --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 \
    --target-tags=http-server

gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules create default-allow-https \
    --direction=INGRESS --priority=1000 \
    --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 \
    --target-tags=https-server
