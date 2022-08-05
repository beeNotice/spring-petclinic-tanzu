## Prerequisites

### Tanzu Observability by Wavefront

```bash
kubectl create ns wavefront

kubectl create secret generic wavefront -n wavefront \
  --from-literal=wavefront-url=https://wavefront.surf \
  --from-literal=wavefront-api-token=c25bb033-xxxx-xxxx-xxxx-570d3dc23bea

kubectl apply -f $TANZU_PETCLINIC_FILES_PATH/k8s/wavefront.yaml
```

https://wavefront.surf/us/KvmlkMFhTh

## Develop

### OpenAPI
  * http://localhost:8080/swagger-ui/index.html
  * http://localhost:8080/v3/api-docs

## Deploy

```bash
# Deploy
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
