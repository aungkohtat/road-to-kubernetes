# Istio

- Download Istio
- `curl -L https://istio.io/downloadIstio | sh -`
`

```bash
gitpod /workspace/Kubernetes-in-Action/istio (main) $ curl -L https://istio.io/downloadIstio | sh -
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   101  100   101    0     0    370      0 --:--:-- --:--:-- --:--:--   371
100  4899  100  4899    0     0  11105      0 --:--:-- --:--:-- --:--:-- 11105

Downloading istio-1.20.2 from https://github.com/istio/istio/releases/download/1.20.2/istio-1.20.2-linux-amd64.tar.gz ...

Istio 1.20.2 Download Complete!

Istio has been successfully downloaded into the istio-1.20.2 folder on your system.

Next Steps:
See https://istio.io/latest/docs/setup/install/ to add Istio to your Kubernetes cluster.

To configure the istioctl client tool for your workstation,
add the /workspace/Kubernetes-in-Action/istio/istio-1.20.2/bin directory to your environment path variable with:
         export PATH="$PATH:/workspace/Kubernetes-in-Action/istio/istio-1.20.2/bin"

Begin the Istio pre-installation check by running:
         istioctl x precheck 

Need more information? Visit https://istio.io/latest/docs/setup/install/ 
gitpod /workspace/Kubernetes-in-Action/istio (main) $ 
```

- Move to the Istio package directory
- `cd istio-1.20.2`

- Add the istioctl client to your path

- `export PATH=$PWD/bin:$PATH`

## Install Istio
- `istioctl install --set profile=demo -y`
- 

```bash
gitpod /workspace/Kubernetes-in-Action/istio (main) $ istioctl install --set profile=demo -y
✔ Istio core installed                                                                                                                     
✔ Istiod installed                                                                                                                         
✔ Egress gateways installed                                                                                                                
✔ Ingress gateways installed                                                                                                               
✔ Installation complete                                                                                                                    Made this installation the default for injection and validation.
gitpod /workspace/Kubernetes-in-Action/istio (main) $ 
```

- `kubectl label namespace default istio-injection=enabled`

## Deploy the sample application

- Deploy the Bookinfo sample application:
- `kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
service/details created
serviceaccount/bookinfo-details created
deployment.apps/details-v1 created
service/ratings created
serviceaccount/bookinfo-ratings created
deployment.apps/ratings-v1 created
service/reviews created
serviceaccount/bookinfo-reviews created
deployment.apps/reviews-v1 created
deployment.apps/reviews-v2 created
deployment.apps/reviews-v3 created
service/productpage created
serviceaccount/bookinfo-productpage created
deployment.apps/productpage-v1 created
```

- The application will start.
- `kubectl get services`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl get services
NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
details       ClusterIP   10.245.51.132    <none>        9080/TCP   51s
kubernetes    ClusterIP   10.245.0.1       <none>        443/TCP    14h
productpage   ClusterIP   10.245.137.163   <none>        9080/TCP   47s
ratings       ClusterIP   10.245.39.12     <none>        9080/TCP   50s
reviews       ClusterIP   10.245.182.56    <none>        9080/TCP   49s
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```
- `kubectl get pods`
```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl get pods
NAME                             READY   STATUS    RESTARTS   AGE
details-v1-698d88b-89qjk         2/2     Running   0          81s
productpage-v1-675fc69cf-7tb5x   2/2     Running   0          77s
ratings-v1-6484c4d9bb-qq4vv      2/2     Running   0          80s
reviews-v1-5b5d6494f4-dk9sq      2/2     Running   0          79s
reviews-v2-5b667bcbf8-j5kkz      2/2     Running   0          79s
reviews-v3-5b9bd44f4-cjmjq       2/2     Running   0          78s
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```
- Verify everything is working correctly up to this point. 

- `kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl exec "$(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"
<title>Simple Bookstore App</title>
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```

## Open the application to outside traffic

- Associate this application with the Istio gateway:
- `kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ cat  samples/bookinfo/networking/bookinfo-gateway.yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: bookinfo-gateway
spec:
  # The selector matches the ingress gateway pod labels.
  # If you installed Istio using Helm following the standard documentation, this would be "istio=ingress"
  selector:
    istio: ingressgateway # use istio default controller
  servers:
  - port:
      number: 8080
      name: http
      protocol: HTTP
    hosts:
    - "*"
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: bookinfo
spec:
  hosts:
  - "*"
  gateways:
  - bookinfo-gateway
  http:
  - match:
    - uri:
        exact: /productpage
    - uri:
        prefix: /static
    - uri:
        exact: /login
    - uri:
        exact: /logout
    - uri:
        prefix: /api/v1/products
    route:
    - destination:
        host: productpage
        port:
          number: 9080
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```


```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
gateway.networking.istio.io/bookinfo-gateway created
virtualservice.networking.istio.io/bookinfo created
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```


- Ensure that there are no issues with the configuration:
- `istioctl analyze`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ istioctl analyze

✔ No validation issues found when analyzing namespace: default.
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```

- `kubectl get svc istio-ingressgateway -n istio-system`

```bash
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ kubectl get svc istio-ingressgateway -n istio-system
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP      PORT(S)                                                                      AGE
istio-ingressgateway   LoadBalancer   10.245.118.165   139.59.192.188   15021:32007/TCP,80:31103/TCP,443:32293/TCP,31400:31068/TCP,15443:32170/TCP   8m49s
gitpod /workspace/Kubernetes-in-Action/istio/istio-1.20.2 (main) $ 
```

- Set the ingress IP and ports:

```bash
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
```
## Set the ingress ports:
```bash
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')

```

- `export INGRESS_HOST=159.223.83.72 `

