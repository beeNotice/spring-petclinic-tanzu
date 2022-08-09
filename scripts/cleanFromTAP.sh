#!/bin/bash

# Remove Apps
kubectl delete -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml
kubectl delete -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-customers/config/workload.yaml
kubectl delete -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-visits/config/workload.yaml
kubectl delete -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-api-gateway/config/workload.yaml