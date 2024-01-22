# Kubernetes Services
- **IP in Kubernetes:**
  - Pods change IPs during failures, scaling, and updates.
  - Connecting directly to Pods is discouraged due to dynamic IPs.

- **Role of Services:**
  - Services provide stable and reliable endpoints for Pods.
  - Mitigates issues caused by Pod replacements.

- **Service Characteristics:**
  - Services have stable IP, DNS, and port.
  - Use labels and selectors for dynamic Pod selection.

- **Kubernetes Service Object:**
  - REST object defined in a manifest file.
  - Posted to API server like Pods, ReplicaSets, and Deployments.

- **Service Theory Overview:**
  - Capital "S" Services offer stable networking.
  - Overcomes challenges of direct Pod connections.

  - **The following YAML defines a Service and Deployment and shows how the label
selector and labels work.**
```bash
apiVersion: v1
kind: Service
metadata:
  name: hello-svc
spec:
  ports:
  - port: 8080
  selector:
    app: hello-world  # Send to Pods with these labels
    env: tkb          # Send to Pods with these labels

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-deploy
spec:
  replicas: 10
  selector:
    matchLabels:
      app: hello-world  # Pod labels
      env: tkb          # Pod labels
  template:
    metadata:
      labels:
        app: hello-world  # Pod labels
        env: tkb          # Pod labels
    spec:
      containers:
        - name: your-container
          image: your-image:your-tag
          ports:
            - containerPort: 8080

```

- `kubectl apply -f /workspace/Kubernetes-in-Action/kubernetes-services/dual-stack-svc.yml`

```bash
gitpod /workspace/Kubernetes-in-Action (main) $ kubectl get svc
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
dual-stack-svc   ClusterIP   10.245.253.200   <none>        8080/TCP   42s
kubernetes       ClusterIP   10.245.0.1       <none>        443/TCP    5d7h
gitpod /workspace/Kubernetes-in-Action (main) $ 
```

- `kubectl describe svc dual-stack-svc`

```bash
gitpod /workspace/Kubernetes-in-Action (main) $ kubectl describe svc dual-stack-svc
Name:              dual-stack-svc
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          app=hello-world
Type:              ClusterIP
IP Family Policy:  PreferDualStack
IP Families:       IPv4
IP:                10.245.253.200
IPs:               10.245.253.200
Port:              <unset>  8080/TCP
TargetPort:        8080/TCP
Endpoints:         <none>
Session Affinity:  None
Events:            <none>
```

```bash
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ kubectl get nodes
NAME                      STATUS   ROLES    AGE   VERSION
services-demo-lab-ou3zj   Ready    <none>   21m   v1.29.0
services-demo-lab-ou3zo   Ready    <none>   20m   v1.29.0
services-demo-lab-ou3zr   Ready    <none>   20m   v1.29.0
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ kubectl get nodes -o wide 
NAME                      STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP      OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
services-demo-lab-ou3zj   Ready    <none>   21m   v1.29.0   10.104.0.4    165.22.253.182   Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
services-demo-lab-ou3zo   Ready    <none>   20m   v1.29.0   10.104.0.2    165.22.246.128   Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
services-demo-lab-ou3zr   Ready    <none>   20m   v1.29.0   10.104.0.3    165.22.249.55    Debian GNU/Linux 12 (bookworm)   6.1.0-17-amd64   containerd://1.6.26
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ kubectl apply -f deploy.yml
deployment.apps/svc-test created
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ ls
deploy.yml  dual-stack-svc.yml  lb.yml  README.md  svc.yml
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $  kubectl expose deployment svc-test --type=NodePort
service/svc-test exposed
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ kubectl get svc -o wide
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE    SELECTOR
dual-stack-svc   ClusterIP   10.245.211.116   <none>        8080/TCP         8m5s   app=hello-world
kubernetes       ClusterIP   10.245.0.1       <none>        443/TCP          26m    <none>
svc-test         NodePort    10.245.201.5     <none>        8080:31413/TCP   13s    chapter=services
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ kubectl describe svc svc-test
Name:                     svc-test
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 chapter=services
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.245.201.5
IPs:                      10.245.201.5
Port:                     <unset>  8080/TCP
TargetPort:               8080/TCP
NodePort:                 <unset>  31413/TCP
Endpoints:                10.244.0.126:8080,10.244.0.132:8080,10.244.0.147:8080 + 7 more...
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
gitpod /workspace/Kubernetes-in-Action/kubernetes-services (main) $ 
```
## Clean-up

- ` kubectl delete -f deploy.yml -f svc.yml -f lb.yml`


