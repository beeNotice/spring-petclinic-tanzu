#!/bin/bash

kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-customers/config/workload.yaml
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-visits/config/workload.yaml

