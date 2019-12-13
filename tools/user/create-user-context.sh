#!/usr/bin/env bash

source params.env

USER=$1
ENV=dev
NAMESPACE="${USER}-${ENV}"

echo "Create namespace for user: ${USER}"
kubectl create ns ${NAMESPACE}
echo "Create service account"
kubectl create -n ${NAMESPACE} serviceaccount ${USER}

echo "Create k9s user role"
kubectl apply -f k9s-user.yaml
echo "Bind clusterrole to sa"
kubectl create clusterrolebinding ${USER}-k9s-user-binding --clusterrole=k9s-user --serviceaccount=${NAMESPACE}:${USER}

echo "Create ns owner role"
kubectl apply -n ${NAMESPACE} -f ns-owner.yaml
echo "Bind role to sa"
kubectl create -n ${NAMESPACE} rolebinding ${USER}-ns-owner --role=ns-owner --serviceaccount=${NAMESPACE}:${USER}
echo "Get base64 kubeconfig"
KC=$(echo $(./k8s-service-account-kubeconfig.sh ${NAMESPACE} ${USER}))
echo $KC

echo "Creating gitlab user"
curl -H "Content-type: application/json" \
  -H "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  -X POST https://gitlab.pyaillet.tech/api/v4/users \
  --data "{\"email\":\"${USER}@${USER}.here\",\"username\":\"${USER}\",\"name\":\"${USER}\",\"password\":\"${USER}_p4ssword\"}"

echo "Creating gitlab group"
curl -H "Content-type: application/json" \
  -H "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  -X POST https://gitlab.pyaillet.tech/api/v4/groups \
  --data "{\"name\":\"${USER}\",\"path\":\"${USER}\",\"visibility\":\"public\"}"

echo "Creating kubeconfig var"
curl -H "Content-type: application/json" \
  -H "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  -X POST https://gitlab.pyaillet.tech/api/v4/groups/${GROUP_ID}/variables \
  --data "{\"key\":\"KUBECONFIG_$(echo $ENV | tr a-z A-Z)\",\"value\":\"${KC}\",\"variable_type\":\"file\",\"protected\":\"true\"""}" )
