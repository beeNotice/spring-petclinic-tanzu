## Develop

### OpenAPI
  * http://localhost:8080/swagger-ui/index.html
  * http://localhost:8080/v3/api-docs

## Deploy


```bash

# Iterate - From local path
# TODO fix it, there is a NotOwned status on the Workload
tanzu apps workload apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml \
  --local-path $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets \
  --source-image fmartin.azurecr.io/fmartin/tanzu-app-tap-source \
  --namespace dev \
  --yes

# Deploy - From Git repository
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml

# Follow
tanzu apps workload tail spring-petclinic-vets -n dev
kp build logs spring-petclinic-vets -n dev
tanzu apps workload get spring-petclinic-vets -n dev

# Delete
tanzu apps workload delete spring-petclinic-vets -n dev --yes
```

## TODO

  * Add tests
  * Add catalog : https://github.com/dektlong/dekt-devx-demo/blob/main/config-templates/profiles/tap-view.yaml
