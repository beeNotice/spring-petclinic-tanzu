## Prerequisites

### Tanzu Observability by Wavefront

```bash
kubectl create ns wavefront

kubectl create secret generic wavefront -n wavefront \
  --from-literal=wavefront-url=https://wavefront.surf \
  --from-literal=wavefront-api-token=c25bb033-xxxx-xxxx-xxxx-570d3dc23bea

kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/k8s/01-wavefront.yaml
```

https://wavefront.surf/us/KvmlkMFhTh

## Develop

### OpenAPI
  * http://localhost:8080/swagger-ui/index.html
  * http://localhost:8080/v3/api-docs
  * http://localhost:8080/v3/api-docs.yaml

## Deploy

```bash
# App name : spring-petclinic-vets, spring-petclinic-customers, spring-petclinic-visits
APP_NAME=spring-petclinic-customers

# Deploy
kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/spring-petclinic-vets/config/workload.yaml

# Follow
tanzu apps workload tail $APP_NAME -n dev
kp build logs $APP_NAME -n dev
tanzu apps workload get $APP_NAME -n dev

# Delete
tanzu apps workload delete $APP_NAME -n dev --yes
```
## TODO

