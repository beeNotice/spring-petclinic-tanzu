## Develop

### OpenAPI
  * http://localhost:8080/swagger-ui/index.html
  * http://localhost:8080/v3/api-docs

## Deploy


```bash

# Iterate
tanzu apps workload apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets-service/config/workload.yaml \
  --local-path $TANZU_PETCLINIC_FILES_PATH \
  --source-image fmartin.azurecr.io/fmartin/tanzu-app-tap-iterate \
  --namespace dev \
  --yes

# Deploy
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets-service/config/workload.yaml

# Follow
tanzu apps workload tail spring-petclinic-vets-service -n dev
kp build logs spring-petclinic-vets-service -n dev
tanzu apps workload get spring-petclinic-vets-service -n dev

# Delete
tanzu apps workload delete spring-petclinic-vets-service -n dev --yes

```

## TODO

  * Add tests
