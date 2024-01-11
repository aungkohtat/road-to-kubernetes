## exploring kube-system namespace

- `bashkubectl config get-contexts`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl config get-contexts
CURRENT   NAME                                         CLUSTER                                      AUTHINFO                                           NAMESPACE
*         do-sgp1-k8s-1-28-2-do-0-sgp1-1704936245086   do-sgp1-k8s-1-28-2-do-0-sgp1-1704936245086   do-sgp1-k8s-1-28-2-do-0-sgp1-1704936245086-admin   
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get all -n kube-system -o wide`

> **To Note** : pod, service, daemonset.apps, deployment and replicaset.apps are running in kube-system namespace

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get all -n kube-system -o wide
NAME                                      READY   STATUS    RESTARTS   AGE     IP             NODE                NOMINATED NODE   READINESS GATES
pod/cilium-gndqb                          1/1     Running   0          6m31s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/cilium-mc2dr                          1/1     Running   0          6m31s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
pod/cilium-operator-57bb7f6679-sllp8      1/1     Running   0          8m9s    10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/cilium-wbngv                          1/1     Running   0          6m17s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/coredns-7dbbf6dd5b-5mnqn              1/1     Running   0          5m5s    10.244.0.10    pool-akhlab-x1z32   <none>           <none>
pod/coredns-7dbbf6dd5b-gxhgq              1/1     Running   0          5m5s    10.244.1.114   pool-akhlab-x1z3t   <none>           <none>
pod/cpc-bridge-proxy-qq9kx                1/1     Running   0          5m37s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
pod/cpc-bridge-proxy-vp622                1/1     Running   0          5m37s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/cpc-bridge-proxy-zvnpr                1/1     Running   0          5m37s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/csi-do-node-2fvxj                     2/2     Running   0          4m51s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
pod/csi-do-node-k5p2g                     2/2     Running   0          4m52s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/csi-do-node-wthzr                     2/2     Running   0          4m52s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/disable-systemd-upgrade-timer-2cj2x   1/1     Running   0          5m36s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/disable-systemd-upgrade-timer-87bk7   1/1     Running   0          5m36s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/disable-systemd-upgrade-timer-ddln7   1/1     Running   0          5m36s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
pod/do-node-agent-tfsn8                   1/1     Running   0          4m38s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
pod/do-node-agent-vr8bv                   1/1     Running   0          4m38s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/do-node-agent-w68mp                   1/1     Running   0          4m38s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/konnectivity-agent-7b5gf              1/1     Running   0          6m20s   10.244.0.63    pool-akhlab-x1z32   <none>           <none>
pod/konnectivity-agent-d66ss              1/1     Running   0          6m17s   10.244.1.63    pool-akhlab-x1z3t   <none>           <none>
pod/konnectivity-agent-z84ws              1/1     Running   0          6m20s   10.244.0.196   pool-akhlab-x1z3l   <none>           <none>
pod/kube-proxy-8hfc8                      1/1     Running   0          6m16s   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
pod/kube-proxy-d597p                      1/1     Running   0          6m31s   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
pod/kube-proxy-fw5mp                      1/1     Running   0          6m31s   10.104.0.4     pool-akhlab-x1z32   <none>           <none>

NAME               TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE    SELECTOR
service/kube-dns   ClusterIP   10.245.0.10   <none>        53/UDP,53/TCP,9153/TCP   5m5s   k8s-app=kube-dns

NAME                                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE     CONTAINERS                                IMAGES                                                                                                     SELECTOR
daemonset.apps/cilium                          3         3         3       3            3           kubernetes.io/os=linux   8m9s    cilium-agent                              docker.io/cilium/cilium:v1.14.3@sha256:e5ca22526e01469f8d10c14e2339a82a13ad70d9a359b879024715540eef4ace    k8s-app=cilium,kubernetes.io/cluster-service=true
daemonset.apps/cpc-bridge-proxy                3         3         3       3            3           <none>                   5m37s   cpc-bridge-proxy                          digitalocean/cpbridge:1.25.1                                                                               app=cpc-bridge-proxy
daemonset.apps/csi-do-node                     3         3         3       3            3           <none>                   4m52s   csi-node-driver-registrar,csi-do-plugin   registry.k8s.io/sig-storage/csi-node-driver-registrar:v2.8.0,docker.io/digitalocean/do-csi-plugin:v4.7.1   app=csi-do-node
daemonset.apps/disable-systemd-upgrade-timer   3         3         3       3            3           <none>                   5m36s   disable-systemd-upgrade-timer             digitalocean/doks-debug:latest                                                                             app=disable-systemd-upgrade-timer
daemonset.apps/do-node-agent                   3         3         3       3            3           kubernetes.io/os=linux   4m38s   do-node-agent                             docker.io/digitalocean/do-agent:3.16.4                                                                     app=do-node-agent
daemonset.apps/konnectivity-agent              3         3         3       3            3           <none>                   6m20s   konnectivity-agent                        registry.k8s.io/kas-network-proxy/proxy-agent:v0.1.4                                                       k8s-app=konnectivity-agent
daemonset.apps/kube-proxy                      3         3         3       3            3           <none>                   8m15s   kube-proxy                                registry.k8s.io/kube-proxy:v1.28.2                                                                         k8s-app=kube-proxy,tier=node

NAME                              READY   UP-TO-DATE   AVAILABLE   AGE    CONTAINERS        IMAGES                                                                                                              SELECTOR
deployment.apps/cilium-operator   1/1     1            1           8m9s   cilium-operator   docker.io/cilium/operator-generic:v1.14.3@sha256:c9613277b72103ed36e9c0d16b9a17cafd507461d59340e432e3e9c23468b5e2   io.cilium/app=operator,name=cilium-operator
deployment.apps/coredns           2/2     2            2           5m5s   coredns           docker.io/coredns/coredns:1.10.1                                                                                    k8s-app=kube-dns

NAME                                         DESIRED   CURRENT   READY   AGE    CONTAINERS        IMAGES                                                                                                              SELECTOR
replicaset.apps/cilium-operator-57bb7f6679   1         1         1       8m9s   cilium-operator   docker.io/cilium/operator-generic:v1.14.3@sha256:c9613277b72103ed36e9c0d16b9a17cafd507461d59340e432e3e9c23468b5e2   io.cilium/app=operator,name=cilium-operator,pod-template-hash=57bb7f6679
replicaset.apps/coredns-7dbbf6dd5b           2         2         2       5m5s   coredns           docker.io/coredns/coredns:1.10.1                                                                                    k8s-app=kube-dns,pod-template-hash=7dbbf6dd5b
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````


- `kubectl get pods -n kube-system -o wide`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get pods -n kube-system -o wide
NAME                                  READY   STATUS    RESTARTS   AGE   IP             NODE                NOMINATED NODE   READINESS GATES
cilium-gndqb                          1/1     Running   0          61m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cilium-mc2dr                          1/1     Running   0          61m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
cilium-operator-57bb7f6679-sllp8      1/1     Running   0          63m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cilium-wbngv                          1/1     Running   0          61m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
coredns-7dbbf6dd5b-5mnqn              1/1     Running   0          60m   10.244.0.10    pool-akhlab-x1z32   <none>           <none>
coredns-7dbbf6dd5b-gxhgq              1/1     Running   0          60m   10.244.1.114   pool-akhlab-x1z3t   <none>           <none>
cpc-bridge-proxy-qq9kx                1/1     Running   0          61m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
cpc-bridge-proxy-vp622                1/1     Running   0          61m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cpc-bridge-proxy-zvnpr                1/1     Running   0          61m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
csi-do-node-2fvxj                     2/2     Running   0          60m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
csi-do-node-k5p2g                     2/2     Running   0          60m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
csi-do-node-wthzr                     2/2     Running   0          60m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
disable-systemd-upgrade-timer-2cj2x   1/1     Running   0          61m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
disable-systemd-upgrade-timer-87bk7   1/1     Running   0          61m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
disable-systemd-upgrade-timer-ddln7   1/1     Running   0          61m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
do-node-agent-tfsn8                   1/1     Running   0          60m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
do-node-agent-vr8bv                   1/1     Running   0          60m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
do-node-agent-w68mp                   1/1     Running   0          60m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
konnectivity-agent-7b5gf              1/1     Running   0          61m   10.244.0.63    pool-akhlab-x1z32   <none>           <none>
konnectivity-agent-d66ss              1/1     Running   0          61m   10.244.1.63    pool-akhlab-x1z3t   <none>           <none>
konnectivity-agent-z84ws              1/1     Running   0          61m   10.244.0.196   pool-akhlab-x1z3l   <none>           <none>
kube-proxy-8hfc8                      1/1     Running   0          61m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
kube-proxy-d597p                      1/1     Running   0          61m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
kube-proxy-fw5mp                      1/1     Running   0          61m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get nodes`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get nodes
NAME                STATUS   ROLES    AGE   VERSION
pool-akhlab-x1z32   Ready    <none>   64m   v1.28.2
pool-akhlab-x1z3l   Ready    <none>   64m   v1.28.2
pool-akhlab-x1z3t   Ready    <none>   64m   v1.28.2
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 

``````

-   `aungkohtet$ kubectl get nodes pool-akhlab-x1z32 `

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get nodes pool-akhlab-x1z32 
NAME                STATUS   ROLES    AGE   VERSION
pool-akhlab-x1z32   Ready    <none>   65m   v1.28.2
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 

``````

- `kubectl get ns`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get ns
NAME              STATUS   AGE
default           Active   69m
kube-node-lease   Active   69m
kube-public       Active   69m
kube-system       Active   69m
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

-  `kubectl describe ns kube-system`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl describe ns kube-system
Name:         kube-system
Labels:       kubernetes.io/metadata.name=kube-system
Annotations:  <none>
Status:       Active

No resource quota.

No LimitRange resource.
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get pods -n kube-system -o wide`

> check the running pods which are running inside the kube-system namespace in the kubernetes cluster

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get pods -n kube-system -o wide
NAME                                  READY   STATUS    RESTARTS   AGE   IP             NODE                NOMINATED NODE   READINESS GATES
cilium-gndqb                          1/1     Running   0          72m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cilium-mc2dr                          1/1     Running   0          72m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
cilium-operator-57bb7f6679-sllp8      1/1     Running   0          73m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cilium-wbngv                          1/1     Running   0          71m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
coredns-7dbbf6dd5b-5mnqn              1/1     Running   0          70m   10.244.0.10    pool-akhlab-x1z32   <none>           <none>
coredns-7dbbf6dd5b-gxhgq              1/1     Running   0          70m   10.244.1.114   pool-akhlab-x1z3t   <none>           <none>
cpc-bridge-proxy-qq9kx                1/1     Running   0          71m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
cpc-bridge-proxy-vp622                1/1     Running   0          71m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
cpc-bridge-proxy-zvnpr                1/1     Running   0          71m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
csi-do-node-2fvxj                     2/2     Running   0          70m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
csi-do-node-k5p2g                     2/2     Running   0          70m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
csi-do-node-wthzr                     2/2     Running   0          70m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
disable-systemd-upgrade-timer-2cj2x   1/1     Running   0          71m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
disable-systemd-upgrade-timer-87bk7   1/1     Running   0          71m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
disable-systemd-upgrade-timer-ddln7   1/1     Running   0          71m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
do-node-agent-tfsn8                   1/1     Running   0          70m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
do-node-agent-vr8bv                   1/1     Running   0          70m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
do-node-agent-w68mp                   1/1     Running   0          70m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
konnectivity-agent-7b5gf              1/1     Running   0          72m   10.244.0.63    pool-akhlab-x1z32   <none>           <none>
konnectivity-agent-d66ss              1/1     Running   0          71m   10.244.1.63    pool-akhlab-x1z3t   <none>           <none>
konnectivity-agent-z84ws              1/1     Running   0          72m   10.244.0.196   pool-akhlab-x1z3l   <none>           <none>
kube-proxy-8hfc8                      1/1     Running   0          71m   10.104.0.3     pool-akhlab-x1z3t   <none>           <none>
kube-proxy-d597p                      1/1     Running   0          72m   10.104.0.2     pool-akhlab-x1z3l   <none>           <none>
kube-proxy-fw5mp                      1/1     Running   0          72m   10.104.0.4     pool-akhlab-x1z32   <none>           <none>
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

- `kubectl get all -n kube-system`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get all -n kube-system
NAME                                      READY   STATUS    RESTARTS   AGE
pod/cilium-gndqb                          1/1     Running   0          73m
pod/cilium-mc2dr                          1/1     Running   0          73m
pod/cilium-operator-57bb7f6679-sllp8      1/1     Running   0          75m
pod/cilium-wbngv                          1/1     Running   0          73m
pod/coredns-7dbbf6dd5b-5mnqn              1/1     Running   0          72m
pod/coredns-7dbbf6dd5b-gxhgq              1/1     Running   0          72m
pod/cpc-bridge-proxy-qq9kx                1/1     Running   0          72m
pod/cpc-bridge-proxy-vp622                1/1     Running   0          72m
pod/cpc-bridge-proxy-zvnpr                1/1     Running   0          72m
pod/csi-do-node-2fvxj                     2/2     Running   0          71m
pod/csi-do-node-k5p2g                     2/2     Running   0          71m
pod/csi-do-node-wthzr                     2/2     Running   0          71m
pod/disable-systemd-upgrade-timer-2cj2x   1/1     Running   0          72m
pod/disable-systemd-upgrade-timer-87bk7   1/1     Running   0          72m
pod/disable-systemd-upgrade-timer-ddln7   1/1     Running   0          72m
pod/do-node-agent-tfsn8                   1/1     Running   0          71m
pod/do-node-agent-vr8bv                   1/1     Running   0          71m
pod/do-node-agent-w68mp                   1/1     Running   0          71m
pod/konnectivity-agent-7b5gf              1/1     Running   0          73m
pod/konnectivity-agent-d66ss              1/1     Running   0          73m
pod/konnectivity-agent-z84ws              1/1     Running   0          73m
pod/kube-proxy-8hfc8                      1/1     Running   0          73m
pod/kube-proxy-d597p                      1/1     Running   0          73m
pod/kube-proxy-fw5mp                      1/1     Running   0          73m

NAME               TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE
service/kube-dns   ClusterIP   10.245.0.10   <none>        53/UDP,53/TCP,9153/TCP   72m

NAME                                           DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/cilium                          3         3         3       3            3           kubernetes.io/os=linux   75m
daemonset.apps/cpc-bridge-proxy                3         3         3       3            3           <none>                   72m
daemonset.apps/csi-do-node                     3         3         3       3            3           <none>                   71m
daemonset.apps/disable-systemd-upgrade-timer   3         3         3       3            3           <none>                   72m
daemonset.apps/do-node-agent                   3         3         3       3            3           kubernetes.io/os=linux   71m
daemonset.apps/konnectivity-agent              3         3         3       3            3           <none>                   73m
daemonset.apps/kube-proxy                      3         3         3       3            3           <none>                   75m

NAME                              READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/cilium-operator   1/1     1            1           75m
deployment.apps/coredns           2/2     2            2           72m

NAME                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/cilium-operator-57bb7f6679   1         1         1       75m
replicaset.apps/coredns-7dbbf6dd5b           2         2         2       72m
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ 
``````

> check the interconnection and relation of pods, replicaset and deploymentset of coredns which is running inside the kube-system namespace of the kubernets cluster


- `kubectl get nodes -o wide`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl get nodes -o wide
NAME                STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP       OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
pool-akhlab-x1z32   Ready    <none>   76m   v1.28.2   10.104.0.4    159.223.81.239    Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
pool-akhlab-x1z3l   Ready    <none>   76m   v1.28.2   10.104.0.2    128.199.168.191   Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
pool-akhlab-x1z3t   Ready    <none>   76m   v1.28.2   10.104.0
``````

- `kubectl describe nodes pool-akhlab-x1z32`

``````bash
Aungs-MacBook-Pro:Kubernetes-in-Action aungkohtet$ kubectl describe nodes pool-akhlab-x1z32
Name:               pool-akhlab-x1z32
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/instance-type=s-2vcpu-4gb
                    beta.kubernetes.io/os=linux
                    doks.digitalocean.com/managed=true
                    doks.digitalocean.com/node-id=6a65b0bd-1dc7-4a28-a23e-4f5db66969a5
                    doks.digitalocean.com/node-pool=pool-akhlab
                    doks.digitalocean.com/node-pool-id=30f3df20-3780-4d00-96c8-2cd434d1f5bc
                    doks.digitalocean.com/version=1.28.2-do.0
                    failure-domain.beta.kubernetes.io/region=sgp1
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=pool-akhlab-x1z32
                    kubernetes.io/os=linux
                    node.kubernetes.io/instance-type=s-2vcpu-4gb
                    region=sgp1
                    topology.kubernetes.io/region=sgp1
Annotations:        alpha.kubernetes.io/provided-node-ip: 10.104.0.4
                    csi.volume.kubernetes.io/nodeid: {"dobs.csi.digitalocean.com":"394943547"}
                    network.cilium.io/ipv4-cilium-host: 10.244.0.28
                    network.cilium.io/ipv4-health-ip: 10.244.0.9
                    network.cilium.io/ipv4-pod-cidr: 10.244.0.0/25
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Thu, 11 Jan 2024 07:58:00 +0630
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  pool-akhlab-x1z32
  AcquireTime:     <unset>
  RenewTime:       Thu, 11 Jan 2024 09:16:16 +0630
Conditions:
  Type                 Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----                 ------  -----------------                 ------------------                ------                       -------
  NetworkUnavailable   False   Thu, 11 Jan 2024 07:58:26 +0630   Thu, 11 Jan 2024 07:58:26 +0630   CiliumIsUp                   Cilium is running on this node
  MemoryPressure       False   Thu, 11 Jan 2024 09:11:59 +0630   Thu, 11 Jan 2024 07:58:00 +0630   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure         False   Thu, 11 Jan 2024 09:11:59 +0630   Thu, 11 Jan 2024 07:58:00 +0630   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure          False   Thu, 11 Jan 2024 09:11:59 +0630   Thu, 11 Jan 2024 07:58:00 +0630   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready                True    Thu, 11 Jan 2024 09:11:59 +0630   Thu, 11 Jan 2024 07:58:22 +0630   KubeletReady                 kubelet is posting ready status. AppArmor enabled
Addresses:
  InternalIP:  10.104.0.4
  Hostname:    pool-akhlab-x1z32
  ExternalIP:  159.223.81.239
Capacity:
  cpu:                2
  ephemeral-storage:  82394940Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             4009092Ki
  pods:               110
Allocatable:
  cpu:                1900m
  ephemeral-storage:  75935176579
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             3110Mi
  pods:               110
System Info:
  Machine ID:                 85badc046b284ee69d52e611585aef5d
  System UUID:                85badc04-6b28-4ee6-9d52-e611585aef5d
  Boot ID:                    415be0b5-d2a1-4554-a223-9784cd0fc26a
  Kernel Version:             6.1.0-12-amd64
  OS Image:                   Debian GNU/Linux 12 (bookworm)
  Operating System:           linux
  Architecture:               amd64
  Container Runtime Version:  containerd://1.6.22
  Kubelet Version:            v1.28.2
  Kube-Proxy Version:         v1.28.2
ProviderID:                   digitalocean://394943547
Non-terminated Pods:          (8 in total)
  Namespace                   Name                                   CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                   ----                                   ------------  ----------  ---------------  -------------  ---
  kube-system                 cilium-mc2dr                           300m (15%)    0 (0%)      300Mi (9%)       0 (0%)         78m
  kube-system                 coredns-7dbbf6dd5b-5mnqn               100m (5%)     0 (0%)      150M (4%)        150M (4%)      76m
  kube-system                 cpc-bridge-proxy-qq9kx                 100m (5%)     0 (0%)      75Mi (2%)        0 (0%)         77m
  kube-system                 csi-do-node-2fvxj                      0 (0%)        0 (0%)      0 (0%)           0 (0%)         76m
  kube-system                 disable-systemd-upgrade-timer-ddln7    0 (0%)        0 (0%)      0 (0%)           0 (0%)         77m
  kube-system                 do-node-agent-tfsn8                    102m (5%)     0 (0%)      80Mi (2%)        300Mi (9%)     76m
  kube-system                 konnectivity-agent-7b5gf               0 (0%)        0 (0%)      0 (0%)           0 (0%)         78m
  kube-system                 kube-proxy-fw5mp                       0 (0%)        0 (0%)      125Mi (4%)       0 (0%)         78m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests         Limits
  --------           --------         ------
  cpu                602m (31%)       0 (0%)
  memory             758174080 (23%)  464572800 (14%)
  ephemeral-storage  0 (0%)           0 (0%)
  hugepages-1Gi      0 (0%)           0 (0%)
  hugepages-2Mi      0 (0%)           0 (0%)
Events:              <none>
``````