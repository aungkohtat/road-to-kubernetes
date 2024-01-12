# Running workloads in Pods
## Pod
- A pod is the smallest deployable unit that can be managed by Kubernetes. A pod is a logical group of one or more containers that share the same IP address and port space. The main purpose of a pod is to support co-located
processes, such as an application server and its local cache. Containers within a pod can find each other via
localhost, and can also communicate with each other using standard inter-process communications like SystemV 
semaphores or POSIX shared memory. In other words, a pod represents a “logical host”. Pods are not durable; 
they will not survive scheduling failures or node failures. If a node where the pod is running dies, 
the pod is deleted. It can then bereplaced by an identical pod, with even the same name, but with a new 
unique identifier (UID). 

- ![Pod Diagram](/images/assets/pod.drawio.svg)

# Creating pods from YAML or JSON files
##  Creating a YAML manifest for a pod

### A basic pod manifest file
`````
apiVersion: v1 #A
kind: Pod #B
metadata:
name: kiada #C
spec:
containers:
- name: kiada #D
image: luksa/kiada:0.1 #E
ports:
- containerPort: 8080 #F
`````

- `kubectl apply -f pod.kiada.yaml`

`````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl apply -f pod.kiada.yaml 
pod/kiada created
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
`````

- `kubectl get po kiada -o yaml`
``````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl get po kiada -o yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    cni.projectcalico.org/containerID: 974eeb29dc98f2833d249544a23706f261ad62dfd7e4b97db4c8d0eb122b2fe2
    cni.projectcalico.org/podIP: 10.2.1.2/32
    cni.projectcalico.org/podIPs: 10.2.1.2/32
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Pod","metadata":{"annotations":{},"name":"kiada","namespace":"default"},"spec":{"containers":[{"image":"luksa/kiada:0.1","imagePullPolicy":"Always","name":"kiada","ports":[{"containerPort":8080}]}]}}
  creationTimestamp: "2024-01-12T04:46:51Z"
  name: kiada
  namespace: default
  resourceVersion: "10809"
  uid: f6567026-cb77-4de4-824f-9df8f05ff229
spec:
  containers:
  - image: luksa/kiada:0.1
    imagePullPolicy: Always
    name: kiada
    ports:
    - containerPort: 8080
      protocol: TCP
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-6vcfg
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: lke150682-220810-56d01deb0000
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - name: kube-api-access-6vcfg
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2024-01-12T04:46:51Z"
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2024-01-12T04:47:07Z"
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2024-01-12T04:47:07Z"
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2024-01-12T04:46:51Z"
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://bc10266a2631839b21d51a02419c1a0ba57af0da2999f6012d938dcd704dbd6f
    image: docker.io/luksa/kiada:0.1
    imageID: docker.io/luksa/kiada@sha256:f47dac8541512e04c75c2a620bbaa29070425e13b1d9213813da525dd38ee3ef
    lastState: {}
    name: kiada
    ready: true
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2024-01-12T04:47:07Z"
  hostIP: 192.168.149.108
  phase: Running
  podIP: 10.2.1.2
  podIPs:
  - ip: 10.2.1.2
  qosClass: BestEffort
  startTime: "2024-01-12T04:46:51Z"
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
``````

- `kubectl get pod kiada`

``````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl get pod kiada
NAME    READY   STATUS    RESTARTS   AGE
kiada   1/1     Running   0          3m5s
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
``````

## Using kubectl describe to see pod details

- `kubectl describe pod kiada`

``````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl describe pod kiada
Name:             kiada
Namespace:        default
Priority:         0
Service Account:  default
Node:             lke150682-220810-56d01deb0000/192.168.149.108
Start Time:       Fri, 12 Jan 2024 04:46:51 +0000
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: 974eeb29dc98f2833d249544a23706f261ad62dfd7e4b97db4c8d0eb122b2fe2
                  cni.projectcalico.org/podIP: 10.2.1.2/32
                  cni.projectcalico.org/podIPs: 10.2.1.2/32
Status:           Running
IP:               10.2.1.2
IPs:
  IP:  10.2.1.2
Containers:
  kiada:
    Container ID:   containerd://bc10266a2631839b21d51a02419c1a0ba57af0da2999f6012d938dcd704dbd6f
    Image:          luksa/kiada:0.1
    Image ID:       docker.io/luksa/kiada@sha256:f47dac8541512e04c75c2a620bbaa29070425e13b1d9213813da525dd38ee3ef
    Port:           8080/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Fri, 12 Jan 2024 04:47:07 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-6vcfg (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-6vcfg:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  4m42s  default-scheduler  Successfully assigned default/kiada to lke150682-220810-56d01deb0000
  Normal  Pulling    4m41s  kubelet            Pulling image "luksa/kiada:0.1"
  Normal  Pulled     4m26s  kubelet            Successfully pulled image "luksa/kiada:0.1" in 15.025s (15.025s including waiting)
  Normal  Created    4m26s  kubelet            Created container kiada
  Normal  Started    4m26s  kubelet            Started container kiada
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
``````

## Inspecting events to see what happens beneath the surface
- `kubectl get events`

``````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl get events
LAST SEEN   TYPE     REASON      OBJECT      MESSAGE
8m56s       Normal   Scheduled   pod/kiada   Successfully assigned default/kiada to lke150682-220810-56d01deb0000
8m56s       Normal   Pulling     pod/kiada   Pulling image "luksa/kiada:0.1"
8m41s       Normal   Pulled      pod/kiada   Successfully pulled image "luksa/kiada:0.1" in 15.025s (15.025s including waiting)
8m41s       Normal   Created     pod/kiada   Created container kiada
8m41s       Normal   Started     pod/kiada   Started container kiada
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
``````

## Getting the pod’s IP address
- `kubectl get pod kiada -o wide`

``````bash
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ kubectl get pod kiada -o wide
NAME    READY   STATUS    RESTARTS   AGE   IP         NODE                            NOMINATED NODE   READINESS GATES
kiada   1/1     Running   0          10m   10.2.1.2   lke150682-220810-56d01deb0000   <none>           <none>
gitpod /workspace/Kubernetes-in-Action/Running-workloads-in-Pods (main) $ 
``````

## Connecting to the pod from the worker nodes
- `curl 10.2.1.2:8080`
