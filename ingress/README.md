## Hands-on with Ingress
![Ingress lab - Host Base and Path base Routing](/images/assets/Host-based%20routing.drawio.svg)
### Installing the NGINX Ingress controller
- `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml`


```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k get pods -n ingress-nginx
NAME                                        READY   STATUS      RESTARTS   AGE
ingress-nginx-admission-create-vz8b7        0/1     Completed   0          93s
ingress-nginx-admission-patch-pfr5q         0/1     Completed   0          92s
ingress-nginx-controller-745cd9657b-v9rgh   1/1     Running     0          93s
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

### Configure Ingress classes for clusters with multiple Ingress controllers

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k get ingressclasses
NAME    CONTROLLER             PARAMETERS   AGE
nginx   k8s.io/ingress-nginx   <none>       2m13s
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k describe ingressclasses nginx
Name:         nginx
Labels:       app.kubernetes.io/component=controller
              app.kubernetes.io/instance=ingress-nginx
              app.kubernetes.io/name=ingress-nginx
              app.kubernetes.io/part-of=ingress-nginx
              app.kubernetes.io/version=1.5.1
Annotations:  <none>
Controller:   k8s.io/ingress-nginx
Events:       <none>
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

### Configuring host-based and path-based routing

### Deploy the apps

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ kubectl apply -f app.yml 
service/svc-shield created
service/svc-hydra created
pod/shield created
pod/hydra created
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

### Create the Ingress object

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ kubectl apply -f ig-all.yml 
ingress.networking.k8s.io/mcu-all created
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ kubectl get ing
NAME      CLASS   HOSTS                                  ADDRESS         PORTS   AGE
mcu-all   nginx   shield.mcu.com,hydra.mcu.com,mcu.com   159.89.210.95   80      17s
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ kubectl describe ing mcu-all
Name:             mcu-all
Labels:           <none>
Namespace:        default
Address:          159.89.210.95
Ingress Class:    nginx
Default backend:  <default>
Rules:
  Host            Path  Backends
  ----            ----  --------
  shield.mcu.com  
                  /   svc-shield:8080 (10.244.0.100:8080)
  hydra.mcu.com   
                  /   svc-hydra:8080 (10.244.1.14:8080)
  mcu.com         
                  /shield   svc-shield:8080 (10.244.0.100:8080)
                  /hydra    svc-hydra:8080 (10.244.1.14:8080)
Annotations:      nginx.ingress.kubernetes.io/rewrite-target: /
Events:
  Type    Reason  Age                From                      Message
  ----    ------  ----               ----                      -------
  Normal  Sync    35s (x2 over 46s)  nginx-ingress-controller  Scheduled for sync
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```

### Configure DNS name resolution

```bash
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k get pods
NAME     READY   STATUS    RESTARTS   AGE
hydra    1/1     Running   0          45m
shield   1/1     Running   0          45m
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.245.0.1       <none>        443/TCP    9m40s
svc-hydra    ClusterIP   10.245.147.128   <none>        8080/TCP   45m
svc-shield   ClusterIP   10.245.223.114   <none>        8080/TCP   45m
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ k describe svc
Name:              kubernetes
Namespace:         default
Labels:            component=apiserver
                   provider=kubernetes
Annotations:       <none>
Selector:          <none>
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.245.0.1
IPs:               10.245.0.1
Port:              https  443/TCP
TargetPort:        443/TCP
Endpoints:         100.65.7.202:443
Session Affinity:  None
Events:            <none>


Name:              svc-hydra
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          env=hydra
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.245.147.128
IPs:               10.245.147.128
Port:              <unset>  8080/TCP
TargetPort:        8080/TCP
Endpoints:         10.244.1.14:8080
Session Affinity:  None
Events:            <none>


Name:              svc-shield
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          env=shield
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.245.223.114
IPs:               10.245.223.114
Port:              <unset>  8080/TCP
TargetPort:        8080/TCP
Endpoints:         10.244.0.100:8080
Session Affinity:  None
Events:            <none>
gitpod /workspace/Kubernetes-in-Action/ingress (main) $ 
```
### Clean-up

- `kubectl delete ingress mcu-all`
- `kubectl delete -f app.yml`
- `kubectl delete namespace ingress-nginx`
- `kubectl delete clusterrole ingress-nginx`
- `kubectl delete clusterrolebinding ingress-nginx`

**Happy Learning**


