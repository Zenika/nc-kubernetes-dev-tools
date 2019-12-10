#!/usr/bin/env bash

source params.env

echo "Removing VM..."
gcloud beta compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    instances delete gitlab \
    --zone=us-central1-a

echo "Removing ssh firewall rule..."
gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules delete default-allow-ssh

echo "Removing registry firewall rule..."
gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules delete default-allow-registry

echo "Removing http firewall rule..."
gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules delete default-allow-http

echo "Removing https firewall rule..."
gcloud compute -q \
    --project=${GOOGLE_PROJECT_ID} \
    firewall-rules delete default-allow-https
