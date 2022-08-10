#!/bin/bash

# Create Postgresql instances
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/02-postgresql.yaml -v db=spring-petclinic-vets-db | kubectl apply -f-
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/02-postgresql.yaml -v db=spring-petclinic-visits-db | kubectl apply -f-
ytt -f $TANZU_PETCLINIC_FILES_PATH/k8s/02-postgresql.yaml -v db=spring-petclinic-customers | kubectl apply -f-

# Deploy Apps
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-customers/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-visits/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-api-gateway/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-angular/config/workload.yaml

