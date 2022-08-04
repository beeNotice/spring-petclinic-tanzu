## Deploy

```bash
tanzu apps workload apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets-service/config/workload.yaml \
  --local-path $TANZU_PETCLINIC_FILES_PATH \
  --source-image fmartin.azurecr.io/fmartin/tanzu-app-tap \
  --namespace fmartin \
  --yes
  
tanzu apps workload tail spring-petclinic-vets-service -n fmartin
kp build logs spring-petclinic-vets-service -n fmartin

tanzu apps workload delete spring-petclinic-vets-service -n fmartin --yes

 ```

```bash
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets-service/config/workload.yaml
kp build logs spring-petclinic-vets-service -n dev
tanzu apps workload get spring-petclinic-vets-service -n dev
```

## Explore OpenAPI
  * http://localhost:8080/swagger-ui/index.html
  * http://localhost:8080/v3/api-docs