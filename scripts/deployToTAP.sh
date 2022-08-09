#!/bin/bash

# Create Postgresql instances
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/postgresql.yaml -v db=spring-petclinic-vets-db | kubectl apply -f-
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/postgresql.yaml -v db=spring-customers-vets-db | kubectl apply -f-
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/postgresql.yaml -v db=spring-visits-vets-db | kubectl apply -f-

# Deploy Apps
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-customers/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-visits/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-api-gateway/config/workload.yaml

