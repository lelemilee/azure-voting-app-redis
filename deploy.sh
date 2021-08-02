#!/bin/bash

RESOURCE_GROUP=$1
RESOURCE_NAME=$2

echo ---------------------------------------
echo Login to azure
echo ---------------------------------------

az login --service-principal -u $AZURE_SERVICE_PRINCIPAL -p $client_secret --tenant $tenant_id || exit 1

echo ---------------------------------------
echo Connecting to aks cluster
echo ---------------------------------------

az aks get-credentials --resource-group $RESOURCE_GROUP --name $RESOURCE_NAME --overwrite || exit 1

echo ---------------------------------------
echo Deploying application to cluster
echo ---------------------------------------

kubectl apply -f azure-vote-all-in-one-redis.yaml || exit 1