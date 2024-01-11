

## Verify cluster connectivity

## kubectl command

```` bash
kubectl config get-contexts 
Lists your cluster name, user, and namespace
kubectl cluster-info
Display addresses of the control plane and cluster services
kubectl version
Display the client and server k8s version
kubectl get nodes
List all nodes created in the cluster
kubectl help
Displays commands that help manage your cluster

````

## kuberntes “get” commands to explore more
- [Kubernetes command detail](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#get)

## basic commands part-1

- `kubectl config get-contexts`
```bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl config get-contexts
CURRENT   NAME                                         CLUSTER                                      AUTHINFO                                           NAMESPACE
*         do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961   do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961   do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961-admin   
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 

````
- `kubectl get nodes`
``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get nodes
NAME               STATUS   ROLES    AGE   VERSION
aungkohtet-x1hk2   Ready    <none>   12m   v1.28.2
aungkohtet-x1hkl   Ready    <none>   12m   v1.28.2
aungkohtet-x1hkp   Ready    <none>   12m   v1.28.2
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get nodes -o wide`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get nodes -o wide
NAME               STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP       OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
aungkohtet-x1hk2   Ready    <none>   13m   v1.28.2   10.104.0.4    157.245.207.215   Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
aungkohtet-x1hkl   Ready    <none>   14m   v1.28.2   10.104.0.3    157.245.202.10    Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
aungkohtet-x1hkp   Ready    <none>   13m   v1.28.2   10.104.0.2    157.245.200.251   Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 

``````

- `kubectl api-resources`
``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl api-resources
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
databaseclusterreferences                                              databases.digitalocean.com/v1alpha1    true         DatabaseClusterReference
databaseclusters                                                       databases.digitalocean.com/v1alpha1    true         DatabaseCluster
databaseuserreferences                                                 databases.digitalocean.com/v1alpha1    true         DatabaseUserReference
databaseusers                                                          databases.digitalocean.com/v1alpha1    true         DatabaseUser
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
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get namespaces -o wide `

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get namespaces -o wide
NAME              STATUS   AGE
default           Active   23m
kube-node-lease   Active   23m
kube-public       Active   23m
kube-system       Active   23m
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- kubectl get —-help
- kubectl get namespace -o yaml
- kubectl get all -n kube-system

**check the api  resources which reside in the kube-system (important). Must understand these components.**

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get namespace -o yaml
apiVersion: v1
items:
- apiVersion: v1
  kind: Namespace
  metadata:
    creationTimestamp: "2024-01-10T17:58:37Z"
    labels:
      kubernetes.io/metadata.name: default
    name: default
    resourceVersion: "36"
    uid: 6388977d-3062-4635-8096-53d002ec781e
  spec:
    finalizers:
    - kubernetes
  status:
    phase: Active
- apiVersion: v1
  kind: Namespace
  metadata:
    creationTimestamp: "2024-01-10T17:58:37Z"
    labels:
      kubernetes.io/metadata.name: kube-node-lease
    name: kube-node-lease
    resourceVersion: "34"
    uid: f4f421c4-4eb0-4531-9c6b-a86af2026726
  spec:
    finalizers:
    - kubernetes
  status:
    phase: Active
- apiVersion: v1
  kind: Namespace
  metadata:
    creationTimestamp: "2024-01-10T17:58:37Z"
    labels:
      kubernetes.io/metadata.name: kube-public
    name: kube-public
    resourceVersion: "24"
    uid: aafb519d-0511-4402-abc6-46ae23daf95c
  spec:
    finalizers:
    - kubernetes
  status:
    phase: Active
- apiVersion: v1
  kind: Namespace
  metadata:
    creationTimestamp: "2024-01-10T17:58:37Z"
    labels:
      kubernetes.io/metadata.name: kube-system
    name: kube-system
    resourceVersion: "11"
    uid: 414d1eba-789a-4068-803b-0db18f30cbf5
  spec:
    finalizers:
    - kubernetes
  status:
    phase: Active
kind: List
metadata:
  resourceVersion: ""
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get all -n kube-system
NAME                                      READY   STATUS    RESTARTS   AGE
pod/cilium-jtjj8                          1/1     Running   0          21m
pod/cilium-operator-66ccb9ddb7-tw77f      1/1     Running   0          25m
pod/cilium-v9hv7                          1/1     Running   0          21m
pod/cilium-vwpfv                          1/1     Running   0          21m
pod/coredns-7dbbf6dd5b-7frbc              1/1     Running   0          19m
pod/coredns-7dbbf6dd5b-cpt6l              1/1     Running   0          19m
pod/cpc-bridge-proxy-trvpd                1/1     Running   0          20m
pod/cpc-bridge-proxy-v5cjs                1/1     Running   0          20m
pod/cpc-bridge-proxy-w7t9l                1/1     Running   0          20m
pod/csi-do-node-dlqw2                     2/2     Running   0          19m
pod/csi-do-node-m9ddc                     2/2     Running   0          19m
pod/csi-do-node-mdktf                     2/2     Running   0          19m
pod/disable-systemd-upgrade-timer-9vgzz   1/1     Running   0          20m
pod/disable-systemd-upgrade-timer-m77h7   1/1     Running   0          20m
pod/disable-systemd-upgrade-timer-rq4vn   1/1     Running   0          20m
pod/do-node-agent-2pz6c                   1/1     Running   0          19m
pod/do-node-agent-49ff9                   1/1     Running   0          19m
pod/do-node-agent-sqnh5                   1/1     Running   0          19m
pod/konnectivity-agent-9p9v9              1/1     Running   0          21m
pod/konnectivity-agent-lcsvt              1/1     Running   0          21m
pod/konnectivity-agent-vmx7q              1/1     Running   0          21m
pod/kube-proxy-vmvm2                      1/1     Running   0          21m
pod/kube-proxy-xl98t                      1/1     Running   0          21m
pod/kube-proxy-xpngv                      1/1     Running   0          21m

NAME               TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE
service/kube-dns   ClusterIP   10.245.0.10   <none>        53/UDP,53/TCP,9153/TCP   19m

NAME                                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/cilium                          3         3         3       3            3           kubernetes.io/os=linux   25m
daemonset.apps/cpc-bridge-proxy                3         3         3       3            3           <none>                   20m
daemonset.apps/csi-do-node                     3         3         3       3            3           <none>                   19m
daemonset.apps/disable-systemd-upgrade-timer   3         3         3       3            3           <none>                   20m
daemonset.apps/do-node-agent                   3         3         3       3            3           kubernetes.io/os=linux   19m
daemonset.apps/konnectivity-agent              3         3         3       3            3           <none>                   21m
daemonset.apps/kube-proxy                      3         3         3       3            3           <none>                   25m

NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/cilium-operator   1/1     1            1           25m
deployment.apps/coredns           2/2     2            2           19m

NAME                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/cilium-operator-66ccb9ddb7   1         1         1       25m
replicaset.apps/coredns-7dbbf6dd5b           2         2         2       19m
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get pod -n kube-system`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get pod -n kube-system
NAME                                  READY   STATUS    RESTARTS   AGE
cilium-jtjj8                          1/1     Running   0          22m
cilium-operator-66ccb9ddb7-tw77f      1/1     Running   0          26m
cilium-v9hv7                          1/1     Running   0          22m
cilium-vwpfv                          1/1     Running   0          22m
coredns-7dbbf6dd5b-7frbc              1/1     Running   0          21m
coredns-7dbbf6dd5b-cpt6l              1/1     Running   0          21m
cpc-bridge-proxy-trvpd                1/1     Running   0          21m
cpc-bridge-proxy-v5cjs                1/1     Running   0          21m
cpc-bridge-proxy-w7t9l                1/1     Running   0          21m
csi-do-node-dlqw2                     2/2     Running   0          20m
csi-do-node-m9ddc                     2/2     Running   0          20m
csi-do-node-mdktf                     2/2     Running   0          20m
disable-systemd-upgrade-timer-9vgzz   1/1     Running   0          21m
disable-systemd-upgrade-timer-m77h7   1/1     Running   0          21m
disable-systemd-upgrade-timer-rq4vn   1/1     Running   0          21m
do-node-agent-2pz6c                   1/1     Running   0          20m
do-node-agent-49ff9                   1/1     Running   0          20m
do-node-agent-sqnh5                   1/1     Running   0          20m
konnectivity-agent-9p9v9              1/1     Running   0          22m
konnectivity-agent-lcsvt              1/1     Running   0          22m
konnectivity-agent-vmx7q              1/1     Running   0          22m
kube-proxy-vmvm2                      1/1     Running   0          22m
kube-proxy-xl98t                      1/1     Running   0          22m
kube-proxy-xpngv                      1/1     Running   0          22m
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get service -n kube-system -o wide`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get service -n kube-system -o wide
NAME       TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
kube-dns   ClusterIP   10.245.0.10   <none>        53/UDP,53/TCP,9153/TCP   22m   k8s-app=kube-dns
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

## multi-cluster commands

- `kubectl config get-contexts`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl config get-contexts
CURRENT   NAME                                         CLUSTER                                      AUTHINFO                                           NAMESPACE
*         do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961   do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961   do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961-admin   
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 

``````

- `kubectl get nodes --context do-sgp1-k8s-1-28-2-do-0-sgp1-1704909404961 `


## Add-ons commands and testing

- `create nginx deployment`
````bash
kubectl create deployment nginx --image=nginx:latest --port=80
```````
- **Verify**

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl create deployment nginx --image=nginx:latest --port=80
deployment.apps/nginx created
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7c79c4bf97-2584q   1/1     Running   0          14s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.245.0.1   <none>        443/TCP   36m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   1/1     1            1           14s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7c79c4bf97   1         1         1       14s
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `scale up the deployment with 3 replicas`

``````bash
kubectl scale deployment nginx --replicas=3
``````
- **Verify**

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl scale deployment nginx --replicas=3
deployment.apps/nginx scaled
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get all
NAME                         READY   STATUS    RESTARTS   AGE
pod/nginx-7c79c4bf97-2584q   1/1     Running   0          2m38s
pod/nginx-7c79c4bf97-cztn5   1/1     Running   0          29s
pod/nginx-7c79c4bf97-ktxmg   1/1     Running   0          29s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.245.0.1   <none>        443/TCP   39m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx   3/3     3            3           2m38s

NAME                               DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-7c79c4bf97   3         3         3       2m38s
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `create service(svc) to access from external`

``````bash
kubectl expose deployment nginx --name=nginx-svc --port 80 --type=ClusterIP
``````
- **Verify**

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl expose deployment nginx --name=nginx-svc --port 80 --type=ClusterIP
service/nginx-svc exposed
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.245.0.1       <none>        443/TCP   43m
nginx-svc    ClusterIP   10.245.151.235   <none>        80/TCP    19s
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````
## !Service type ClusterIP type provide the service which can access within the cluster!

- Let’s explore with dnstools and deploy it

- `kubectl apply -f dnstools.yaml`

- enter to that dnstools pod and explore with curl to the create nginx-svc

- `kubectl exec -it dnstools -- sh`

- **Verify**

``````bash
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl apply -f dnstools.yaml
pod/dnstools created
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl exec -it dnstools -- sh
dnstools# curl nginx-svc
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
``````

- **change the nginx-svc type from ClusterIP to NodePort**
- `kubectl edit svc nginx-svc # change type = NodePort`

``````bash
#
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: "2024-01-10T18:42:12Z"
  labels:
    app: nginx
  name: nginx-svc
  namespace: default
  resourceVersion: "10131"
  uid: 97ab9ad8-38ce-4f9b-a5bd-807c54f32b9e
spec:
  clusterIP: 10.245.151.235
  clusterIPs:
  - 10.245.151.235
  internalTrafficPolicy: Cluster
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
``````

- **port-forwarding shall be done in order to access the port IP from outside**
- `kubectl port-forward service/nginx-svc --address 0.0.0.0 8080:80`

- **Verify**

 **In this case, we’re testing with virtualbox and try to access the virtual machine ip address with respective port number**

``````bash
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.245.0.1       <none>        443/TCP        61m
nginx-svc    NodePort    10.245.151.235   <none>        80:30524/TCP   17m
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ curl 10.245.151.235:30524
^C
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl port-forward service/nginx-svc --address 0.0.0.0 8080:30524
error: Service nginx-svc does not have a service port 30524
Aungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl port-forward service/nginx-svc --address 0.0.0.0 8080:80
Forwarding from 0.0.0.0:8080 -> 80
^CAungs-MacBook-Pro:basic-command-part-1 aungkohtet$ kubectl port-forward service/nginx-svc --address 0.0.0.0 8080:80
Forwarding from 0.0.0.0:8080 -> 80
Handling connection for 8080
Handling connection for 8080

``````

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ curl 192.168.100.220:8080
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````