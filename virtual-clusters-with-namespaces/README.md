# Virtual clusters with Namespaces

## Use cases for Namespaces
- `kubectl api-resources`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl api-resources
NAME                               SHORTNAMES                          APIVERSION                             NAMESPACED   KIND
bindings                                                               v1                                     true         Binding
componentstatuses                  cs                                  v1                                     false        ComponentStatus
configmaps                         cm                                  v1                                     true         ConfigMap
endpoints                          ep                                  v1                                     true         Endpoints
events                             ev                                  v1                                     true         Event
limitranges                        limits                              v1                                     true         LimitRange
namespaces                         ns                                  v1                                     false        Namespace
nodes                              no                                  v1                                     false        Node
persistentvolumeclaims             pvc                                 v1                                     true         PersistentVolumeClaim
persistentvolumes                  pv                                  v1                                     false        PersistentVolume
pods                               po                                  v1                                     true         Pod
podtemplates                                                           v1                                     true         PodTemplate
replicationcontrollers             rc                                  v1                                     true         ReplicationController
resourcequotas                     quota                               v1                                     true         ResourceQuota
secrets                                                                v1                                     true         Secret
serviceaccounts                    sa                                  v1                                     true         ServiceAccount
services                           svc                                 v1                                     true         Service
mutatingwebhookconfigurations                                          admissionregistration.k8s.io/v1        false        MutatingWebhookConfiguration
validatingwebhookconfigurations                                        admissionregistration.k8s.io/v1        false        ValidatingWebhookConfiguration
customresourcedefinitions          crd,crds                            apiextensions.k8s.io/v1                false        CustomResourceDefinition
apiservices                                                            apiregistration.k8s.io/v1              false        APIService
controllerrevisions                                                    apps/v1                                true         ControllerRevision
daemonsets                         ds                                  apps/v1                                true         DaemonSet
deployments                        deploy                              apps/v1                                true         Deployment
replicasets                        rs                                  apps/v1                                true         ReplicaSet
statefulsets                       sts                                 apps/v1                                true         StatefulSet
selfsubjectreviews                                                     authentication.k8s.io/v1               false        SelfSubjectReview
tokenreviews                                                           authentication.k8s.io/v1               false        TokenReview
localsubjectaccessreviews                                              authorization.k8s.io/v1                true         LocalSubjectAccessReview
selfsubjectaccessreviews                                               authorization.k8s.io/v1                false        SelfSubjectAccessReview
selfsubjectrulesreviews                                                authorization.k8s.io/v1                false        SelfSubjectRulesReview
subjectaccessreviews                                                   authorization.k8s.io/v1                false        SubjectAccessReview
horizontalpodautoscalers           hpa                                 autoscaling/v2                         true         HorizontalPodAutoscaler
cronjobs                           cj                                  batch/v1                               true         CronJob
jobs                                                                   batch/v1                               true         Job
certificatesigningrequests         csr                                 certificates.k8s.io/v1                 false        CertificateSigningRequest
ciliumcidrgroups                   ccg                                 cilium.io/v2alpha1                     false        CiliumCIDRGroup
ciliumclusterwidenetworkpolicies   ccnp                                cilium.io/v2                           false        CiliumClusterwideNetworkPolicy
ciliumendpoints                    cep,ciliumep                        cilium.io/v2                           true         CiliumEndpoint
ciliumexternalworkloads            cew                                 cilium.io/v2                           false        CiliumExternalWorkload
ciliumidentities                   ciliumid                            cilium.io/v2                           false        CiliumIdentity
ciliuml2announcementpolicies       l2announcement                      cilium.io/v2alpha1                     false        CiliumL2AnnouncementPolicy
ciliumloadbalancerippools          ippools,ippool,lbippool,lbippools   cilium.io/v2alpha1                     false        CiliumLoadBalancerIPPool
ciliumnetworkpolicies              cnp,ciliumnp                        cilium.io/v2                           true         CiliumNetworkPolicy
ciliumnodeconfigs                                                      cilium.io/v2alpha1                     true         CiliumNodeConfig
ciliumnodes                        cn,ciliumn                          cilium.io/v2                           false        CiliumNode
ciliumpodippools                   cpip                                cilium.io/v2alpha1                     false        CiliumPodIPPool
leases                                                                 coordination.k8s.io/v1                 true         Lease
endpointslices                                                         discovery.k8s.io/v1                    true         EndpointSlice
events                             ev                                  events.k8s.io/v1                       true         Event
flowschemas                                                            flowcontrol.apiserver.k8s.io/v1beta3   false        FlowSchema
prioritylevelconfigurations                                            flowcontrol.apiserver.k8s.io/v1beta3   false        PriorityLevelConfiguration
ingressclasses                                                         networking.k8s.io/v1                   false        IngressClass
ingresses                          ing                                 networking.k8s.io/v1                   true         Ingress
networkpolicies                    netpol                              networking.k8s.io/v1                   true         NetworkPolicy
runtimeclasses                                                         node.k8s.io/v1                         false        RuntimeClass
poddisruptionbudgets               pdb                                 policy/v1                              true         PodDisruptionBudget
clusterrolebindings                                                    rbac.authorization.k8s.io/v1           false        ClusterRoleBinding
clusterroles                                                           rbac.authorization.k8s.io/v1           false        ClusterRole
rolebindings                                                           rbac.authorization.k8s.io/v1           true         RoleBinding
roles                                                                  rbac.authorization.k8s.io/v1           true         Role
priorityclasses                    pc                                  scheduling.k8s.io/v1                   false        PriorityClass
volumesnapshotclasses              vsclass,vsclasses                   snapshot.storage.k8s.io/v1             false        VolumeSnapshotClass
volumesnapshotcontents             vsc,vscs                            snapshot.storage.k8s.io/v1             false        VolumeSnapshotContent
volumesnapshots                    vs                                  snapshot.storage.k8s.io/v1             true         VolumeSnapshot
csidrivers                                                             storage.k8s.io/v1                      false        CSIDriver
csinodes                                                               storage.k8s.io/v1                      false        CSINode
csistoragecapacities                                                   storage.k8s.io/v1                      true         CSIStorageCapacity
storageclasses                     sc                                  storage.k8s.io/v1                      false        StorageClass
volumeattachments                                                      storage.k8s.io/v1                      false        VolumeAttachment
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```
## Inspecting Namespaces
- `kubectl get namespaces`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get namespaces
NAME              STATUS   AGE
default           Active   4d1h
kube-node-lease   Active   4d1h
kube-public       Active   4d1h
kube-system       Active   4d1h
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```

- ` kubectl describe ns default`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl describe ns default
Name:         default
Labels:       kubernetes.io/metadata.name=default
Annotations:  <none>
Status:       Active

No resource quota.

No LimitRange resource.
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```

- ` kubectl get svc --namespace kube-system`
- `kubectl create ns hydra`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl create ns hydra
namespace/hydra created
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get ns
NAME              STATUS   AGE
default           Active   4d1h
hydra             Active   8s
kube-node-lease   Active   4d1h
kube-public       Active   4d1h
kube-system       Active   4d1h
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```


- `kubectl apply -f shield-ns.yml `

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl apply -f shield-ns.yml 
namespace/shield created
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get ns
NAME              STATUS   AGE
default           Active   4d1h
hydra             Active   113s
kube-node-lease   Active   4d1h
kube-public       Active   4d1h
kube-system       Active   4d1h
shield            Active   11s
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```

- `kubectl delete ns hydra`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl delete ns hydra
namespace "hydra" deleted
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get ns
NAME              STATUS   AGE
default           Active   4d1h
kube-node-lease   Active   4d1h
kube-public       Active   4d1h
kube-system       Active   4d1h
shield            Active   2m12s
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```

### Configuring kubectl to use a specific Namespace
- `kubectl config set-context --current --namespace shield`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl config set-context --current --namespace shield
Context "do-sgp1-k8s-1-28-2-do-0-sgp1-1704936245086" modified.
```

## Deploying to Namespaces
- Imperatively
  The imperative method requires you to add the -n or --namespace flag to commands.

- Declaratively
  The declarative method specifies the Namespace in the YAML manifest file.

- `kubectl apply -f shield-app.yml`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl apply -f shield-app.yml 
serviceaccount/default configured
service/the-bus created
pod/triskelion created
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get pod -n shield
NAME         READY   STATUS    RESTARTS   AGE
triskelion   1/1     Running   0          58s
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $
```

- `kubectl get svc -n shield`

```bash
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ kubectl get svc -n shield
NAME      TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
the-bus   NodePort   10.245.14.165   <none>        8080:31112/TCP   2m20s
gitpod /workspace/Kubernetes-in-Action/virtual-clusters-with-namespaces (main) $ 
```

## Clean-up

- `kubectl delete -f shield-app.yml`
- `kubectl delete ns shield`
- `kubectl config set-context --current --namespace default`







