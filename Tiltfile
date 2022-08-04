SOURCE_IMAGE = os.getenv("SOURCE_IMAGE", default='fmartin.azurecr.io/fmartin/tanzu-app-tap')
LOCAL_PATH = os.getenv("LOCAL_PATH", default='./spring-petclinic-vets-service')
NAMESPACE = os.getenv("NAMESPACE", default='fmartin')

k8s_custom_deploy(
    'spring-petclinic-tanzu',
    apply_cmd="tanzu apps workload apply -f workload.yaml --live-update" +
               " --local-path " + LOCAL_PATH +
               " --source-image " + SOURCE_IMAGE +
               " --namespace " + NAMESPACE +
               " --yes >/dev/null" +
               " && kubectl get workload spring-petclinic-tanzu --namespace " + NAMESPACE + " -o yaml",
    delete_cmd="tanzu apps workload delete -f workload.yaml --namespace " + NAMESPACE + " --yes",
    deps=['pom.xml', './target/classes'],
    container_selector='workload',
    live_update=[
      sync('./target/classes', '/workspace/BOOT-INF/classes')
    ]
)

k8s_resource('spring-petclinic-tanzu', port_forwards=["8080:8080"],
            extra_pod_selectors=[{'serving.knative.dev/service': 'spring-petclinic-tanzu'}])

allow_k8s_contexts('tanzu-demo-fmartin')
update_settings (k8s_upsert_timeout_secs = 5000)
