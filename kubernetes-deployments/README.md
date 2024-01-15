# Kubernetes Deployments
## Create a Deployment

- `kubectl apply -f deploy.yml`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl apply -f deploy.yml
deployment.apps/hello-deploy created
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   0/10    10           0           11s
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

## Inspecting Deployments
- ` kubectl get deploy hello-deploy`
```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $  kubectl get deploy hello-deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   10/10   10           10          73s
```


- `kubectl describe deploy hello-deploy`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl describe deploy hello-deploy
Name:                   hello-deploy
Namespace:              default
CreationTimestamp:      Mon, 15 Jan 2024 04:08:01 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=hello-world
Replicas:               10 desired | 10 updated | 10 total | 10 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        10
RollingUpdateStrategy:  1 max unavailable, 1 max surge
Pod Template:
  Labels:  app=hello-world
  Containers:
   hello-pod:
    Image:        nigelpoulton/k8sbook:1.0
    Port:         8080/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   hello-deploy-5889dd6744 (10/10 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  2m27s  deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 10
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

- `kubectl get rs`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get rs
NAME                      DESIRED   CURRENT   READY   AGE
hello-deploy-5889dd6744   10        10        10      3m16s
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

- `kubectl describe rs hello-deploy-5889dd6744`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl describe rs hello-deploy-5889dd6744
Name:           hello-deploy-5889dd6744
Namespace:      default
Selector:       app=hello-world,pod-template-hash=5889dd6744
Labels:         app=hello-world
                pod-template-hash=5889dd6744
Annotations:    deployment.kubernetes.io/desired-replicas: 10
                deployment.kubernetes.io/max-replicas: 11
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/hello-deploy
Replicas:       10 current / 10 desired
Pods Status:    10 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=hello-world
           pod-template-hash=5889dd6744
  Containers:
   hello-pod:
    Image:        nigelpoulton/k8sbook:1.0
    Port:         8080/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:
  Type    Reason            Age    From                   Message
  ----    ------            ----   ----                   -------
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-z7bhh
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-5xpd8
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-mbtgs
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-tpzd8
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-nrppr
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-d9ft2
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-krfrh
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-dvh98
  Normal  SuccessfulCreate  4m38s  replicaset-controller  Created pod: hello-deploy-5889dd6744-gfdjz
  Normal  SuccessfulCreate  4m38s  replicaset-controller  (combined from similar events): Created pod: hello-deploy-5889dd6744-26ld9
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

## Accessing the app

- `kubectl apply -f svc.yml`
### run browser

- **http://128.199.168.191:30001/**


- my cluster at cloud run with public ip address and ports

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
hello-svc    NodePort    10.245.226.32   <none>        8080:30001/TCP   9s
kubernetes   ClusterIP   10.245.0.1      <none>        443/TCP          4d2h

gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get nodes
NAME                STATUS   ROLES    AGE    VERSION
pool-akhlab-x1z32   Ready    <none>   4d2h   v1.28.2
pool-akhlab-x1z3l   Ready    <none>   4d2h   v1.28.2
pool-akhlab-x1z3t   Ready    <none>   4d2h   v1.28.2
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get nodes -o wide
NAME                STATUS   ROLES    AGE    VERSION   INTERNAL-IP   EXTERNAL-IP       OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
pool-akhlab-x1z32   Ready    <none>   4d2h   v1.28.2   10.104.0.4    159.223.81.239    Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
pool-akhlab-x1z3l   Ready    <none>   4d2h   v1.28.2   10.104.0.2    128.199.168.191   Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
pool-akhlab-x1z3t   Ready    <none>   4d2h   v1.28.2   10.104.0.3    206.189.83.10     Debian GNU/Linux 12 (bookworm)   6.1.0-12-amd64   containerd://1.6.22
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```
## Perform scaling operations

- ` kubectl get deploy hello-deploy`
```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $  kubectl get deploy hello-deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   10/10   10           10          14m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

- `kubectl scale deploy hello-deploy --replicas 5`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl scale deploy hello-deploy --replicas 5
deployment.apps/hello-deploy scaled
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   5/5     5            5           15m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

- `kubectl apply -f deploy.yml`
```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl apply -f deploy.yml
deployment.apps/hello-deploy configured
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get deploy hello-deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   10/10   10           10          16m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```
## Perform a rolling update

- `kubectl apply -f deploy.yml`
```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl apply -f deploy.yml 
deployment.apps/hello-deploy configured
```

- `kubectl rollout status deployment hello-deploy`
```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl rollout status deployment hello-deploy
Waiting for deployment "hello-deploy" rollout to finish: 2 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 2 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 2 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 3 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 3 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 3 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 3 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 4 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 4 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 4 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 4 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 4 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 6 out of 10 new replicas have been updated...
Waiting for deployment "hello-deploy" rollout to finish: 6 out of 10 new replicas have been updated...
```

## Pausing and resuming rollouts

- `kubectl rollout pause deploy hello-deploy`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl rollout pause deploy hello-deploy
deployment.apps/hello-deploy paused
```

- ` kubectl describe deploy hello-deploy`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $  kubectl describe deploy hello-deploy
Name:                   hello-deploy
Namespace:              default
CreationTimestamp:      Mon, 15 Jan 2024 04:08:01 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=hello-world
Replicas:               10 desired | 10 updated | 10 total | 10 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        10
RollingUpdateStrategy:  1 max unavailable, 1 max surge
Pod Template:
  Labels:  app=hello-world
  Containers:
   hello-pod:
    Image:        nigelpoulton/k8sbook:2.0
    Port:         8080/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status   Reason
  ----           ------   ------
  Available      True     MinimumReplicasAvailable
  Progressing    Unknown  DeploymentPaused
OldReplicaSets:  hello-deploy-5889dd6744 (0/0 replicas created)
NewReplicaSet:   hello-deploy-8597b6cd7 (10/10 replicas created)
Events:
  Type    Reason             Age                   From                   Message
  ----    ------             ----                  ----                   -------
  Normal  ScalingReplicaSet  25m                   deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 10
  Normal  ScalingReplicaSet  9m57s                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 5 from 10
  Normal  ScalingReplicaSet  8m55s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 10 from 5
  Normal  ScalingReplicaSet  3m16s                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 1
  Normal  ScalingReplicaSet  3m16s                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 9 from 10
  Normal  ScalingReplicaSet  3m16s                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 2 from 1
  Normal  ScalingReplicaSet  2m50s                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 8 from 9
  Normal  ScalingReplicaSet  2m50s                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 3 from 2
  Normal  ScalingReplicaSet  2m40s                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 7 from 8
  Normal  ScalingReplicaSet  2m40s                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 4 from 3
  Normal  ScalingReplicaSet  112s (x7 over 2m27s)  deployment-controller  (combined from similar events): Scaled down replica set hello-deploy-5889dd6744 to 0 from 1
```

- `kubectl rollout resume deploy hello-deploy`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl rollout resume deploy hello-deploy
deployment.apps/hello-deploy resumed
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get deploy hello-deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   10/10   10           10          27m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```

## Perform a rollback

- `kubectl rollout history deployment hello-deploy`

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl rollout history deployment hello-deploy
deployment.apps/hello-deploy 
REVISION  CHANGE-CAUSE
1         <none>
2         <none>

gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get rs
NAME                      DESIRED   CURRENT   READY   AGE
hello-deploy-5889dd6744   0         0         0       34m
hello-deploy-8597b6cd7    10        10        10      12m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl rollout undo deployment hello-deploy --to-revision=1
deployment.apps/hello-deploy rolled back
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl get deploy hello-deploy
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
hello-deploy   9/10    4            9           35m
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ kubectl describe deploy hello-deploy
Name:                   hello-deploy
Namespace:              default
CreationTimestamp:      Mon, 15 Jan 2024 04:08:01 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 3
Selector:               app=hello-world
Replicas:               10 desired | 10 updated | 10 total | 10 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        10
RollingUpdateStrategy:  1 max unavailable, 1 max surge
Pod Template:
  Labels:  app=hello-world
  Containers:
   hello-pod:
    Image:        nigelpoulton/k8sbook:1.0
    Port:         8080/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  hello-deploy-8597b6cd7 (0/0 replicas created)
NewReplicaSet:   hello-deploy-5889dd6744 (10/10 replicas created)
Events:
  Type    Reason             Age                 From                   Message
  ----    ------             ----                ----                   -------
  Normal  ScalingReplicaSet  36m                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 10
  Normal  ScalingReplicaSet  21m                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 5 from 10
  Normal  ScalingReplicaSet  20m                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 10 from 5
  Normal  ScalingReplicaSet  14m                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 1
  Normal  ScalingReplicaSet  14m                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 9 from 10
  Normal  ScalingReplicaSet  14m                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 2 from 1
  Normal  ScalingReplicaSet  14m                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 8 from 9
  Normal  ScalingReplicaSet  14m                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 3 from 2
  Normal  ScalingReplicaSet  13m                 deployment-controller  Scaled down replica set hello-deploy-5889dd6744 to 7 from 8
  Normal  ScalingReplicaSet  13m                 deployment-controller  Scaled up replica set hello-deploy-8597b6cd7 to 4 from 3
  Normal  ScalingReplicaSet  72s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 2 from 1
  Normal  ScalingReplicaSet  72s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 1 from 0
  Normal  ScalingReplicaSet  72s                 deployment-controller  Scaled down replica set hello-deploy-8597b6cd7 to 9 from 10
  Normal  ScalingReplicaSet  60s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 4 from 2
  Normal  ScalingReplicaSet  60s                 deployment-controller  Scaled down replica set hello-deploy-8597b6cd7 to 7 from 9
  Normal  ScalingReplicaSet  48s                 deployment-controller  Scaled down replica set hello-deploy-8597b6cd7 to 5 from 7
  Normal  ScalingReplicaSet  48s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 6 from 4
  Normal  ScalingReplicaSet  37s                 deployment-controller  Scaled down replica set hello-deploy-8597b6cd7 to 3 from 5
  Normal  ScalingReplicaSet  37s                 deployment-controller  Scaled up replica set hello-deploy-5889dd6744 to 8 from 6
  Normal  ScalingReplicaSet  14s (x10 over 13m)  deployment-controller  (combined from similar events): Scaled down replica set hello-deploy-8597b6cd7 to 0 from 1
gitpod /workspace/Kubernetes-in-Action/kubernetes-deployments (main) $ 
```
## clean up

- `kubectl delete -f deploy.yml`
- `kubectl delete -f svc.yml `

- **Deployments are a great way to manage stateless apps on
Kubernetes. They augment Pods with self-healing, scalability, rolling updates, and rollbacks.**