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

