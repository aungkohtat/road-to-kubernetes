# Understanding containers

## Running a Hello World container
 - `docker run busybox echo "Hello World"`

 ``````bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers (main) $ docker run busybox echo "Hello World"
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox
a307d6ecc620: Pull complete 
Digest: sha256:ba76950ac9eaa407512c9d859cea48114eeff8a6f12ebaa5d32ce79d4a017dd8
Status: Downloaded newer image for busybox:latest
Hello World
 ``````
## Running other images
- `docker run redis:alpine`

``````bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers (main) $ docker run redis:alpine
Unable to find image 'redis:alpine' locally
alpine: Pulling from library/redis
661ff4d9561e: Pull complete 
0235bd0a3e9b: Pull complete 
003d22e43376: Pull complete 
4f3278ab7ee0: Pull complete 
ca5b2811fa52: Pull complete 
08bd54cdf90e: Pull complete 
4f4fb700ef54: Pull complete 
76f43698903f: Pull complete 
Digest: sha256:995e6eaab954e92cadf1a0bb1eab71ae3baae8e02ea4354fd8aa136a61e42247
Status: Downloaded newer image for redis:alpine
1:C 12 Jan 2024 06:29:01.859 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 12 Jan 2024 06:29:01.859 * Redis version=7.2.4, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 12 Jan 2024 06:29:01.859 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 12 Jan 2024 06:29:01.860 * monotonic clock: POSIX clock_gettime
1:M 12 Jan 2024 06:29:01.860 * Running mode=standalone, port=6379.
1:M 12 Jan 2024 06:29:01.861 * Server initialized
1:M 12 Jan 2024 06:29:01.861 * Ready to accept connections tcp
``````

**To stop and exit the container, press Control-C**

## Understanding image tags
- `docker run redis:5.0.7-alpine`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers (main) $ docker run redis:5.0.7-alpine
Unable to find image 'redis:5.0.7-alpine' locally
5.0.7-alpine: Pulling from library/redis
c9b1b535fdd9: Pull complete 
8dd5e7a0ba4a: Pull complete 
e20c1cdf5aef: Pull complete 
f06a0c1e566e: Pull complete 
230b5c8df708: Pull complete 
0cb9ac88f5bf: Pull complete 
Digest: sha256:cb9783b1c39bb34f8d6572406139ab325c4fac0b28aaa25d5350495637bb2f76
Status: Downloaded newer image for redis:5.0.7-alpine
1:C 12 Jan 2024 06:32:17.380 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 12 Jan 2024 06:32:17.380 # Redis version=5.0.7, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 12 Jan 2024 06:32:17.380 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 12 Jan 2024 06:32:17.382 * Running mode=standalone, port=6379.
1:M 12 Jan 2024 06:32:17.382 # Server initialized
1:M 12 Jan 2024 06:32:17.382 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
1:M 12 Jan 2024 06:32:17.382 * Ready to accept connections
^C1:signal-handler (1705041145) Received SIGINT scheduling shutdown...
1:M 12 Jan 2024 06:32:25.999 # User requested shutdown...
1:M 12 Jan 2024 06:32:25.999 * Saving the final RDB snapshot before exiting.
1:M 12 Jan 2024 06:32:26.004 * DB saved on disk
1:M 12 Jan 2024 06:32:26.004 # Redis is now ready to exit, bye bye...
```

## Deploying Kiada—the Kubernetes in Action Demo Application

### The architecture and operation of the Kiada Suite

- ![ Kiada Suite Diagram](/images/assets/%20Kiada%20Suite.jpg)


## Building the application
### Creating the Dockerfile for the container image

- **Dockerfile**
```bash
FROM node:16
COPY app.js /app.js
COPY html/ /html
ENTRYPOINT ["node", "app.js"]
```

- `docker build -t kiada:latest .`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker build -t kiada:latest .
[+] Building 32.3s (8/8) FINISHED                                                                                           docker:default
 => [internal] load .dockerignore                                                                                                     0.0s
 => => transferring context: 2B                                                                                                       0.0s
 => [internal] load build definition from Dockerfile                                                                                  0.0s
 => => transferring dockerfile: 123B                                                                                                  0.0s
 => [internal] load metadata for docker.io/library/node:16                                                                            0.3s
 => [1/3] FROM docker.io/library/node:16@sha256:f77a1aef2da8d83e45ec990f45df50f1a286c5fe8bbfb8c6e4246c6389705c0b                     30.5s
 => => resolve docker.io/library/node:16@sha256:f77a1aef2da8d83e45ec990f45df50f1a286c5fe8bbfb8c6e4246c6389705c0b                      0.0s
 => => sha256:7e9bf114588c05b2df612b083b96582f3b8dbf51647aa6138a50d09d42df2454 17.58MB / 17.58MB                                      0.4s
 => => sha256:ffd9397e94b74abcb54e514f1430e00f604328d1f895eadbd482f08cc02444e5 51.89MB / 51.89MB                                      1.2s
 => => sha256:f77a1aef2da8d83e45ec990f45df50f1a286c5fe8bbfb8c6e4246c6389705c0b 776B / 776B                                            0.0s
 => => sha256:c94b82f9827cab6e421b350965a9ef11b25b13ffbd1030536203d541f55dcbe2 2.00kB / 2.00kB                                        0.0s
 => => sha256:1ddc7e4055fdb6f6bf31063b593befda814294f9f904b6ddfc21ab1513bafa8e 7.23kB / 7.23kB                                        0.0s
 => => sha256:311da6c465ea1576925360eba391bcd32dece9be95960a0bc9ffcb25fe712017 50.50MB / 50.50MB                                      0.7s
 => => sha256:513d779256048c961239af5f500589330546b072775217272e19ffae1635e98e 191.90MB / 191.90MB                                    2.6s
 => => extracting sha256:311da6c465ea1576925360eba391bcd32dece9be95960a0bc9ffcb25fe712017                                             3.8s
 => => sha256:ae3b95bbaa61ce24cefdd89e7c74d6fbd7713b2bcae93af47063d06bd7e02172 4.20kB / 4.20kB                                        0.8s
 => => sha256:0e421f66aff42bb069dffc26af6d132194b22a1082b08c5ef7cd69c627783c04 34.79MB / 34.79MB                                      1.4s
 => => sha256:ca266fd6192108b67fb57b74753a8c4ca5d8bd458baae3d4df7ce9f42dedcc1d 2.27MB / 2.27MB                                        1.5s
 => => sha256:ee7d78be1eb92caf6ae84fc3af736b23eca018d5dedc967ae5bdee6d7082403b 450B / 450B                                            1.5s
 => => extracting sha256:7e9bf114588c05b2df612b083b96582f3b8dbf51647aa6138a50d09d42df2454                                             0.9s
 => => extracting sha256:ffd9397e94b74abcb54e514f1430e00f604328d1f895eadbd482f08cc02444e5                                             4.3s
 => => extracting sha256:513d779256048c961239af5f500589330546b072775217272e19ffae1635e98e                                            12.3s
 => => extracting sha256:ae3b95bbaa61ce24cefdd89e7c74d6fbd7713b2bcae93af47063d06bd7e02172                                             0.0s
 => => extracting sha256:0e421f66aff42bb069dffc26af6d132194b22a1082b08c5ef7cd69c627783c04                                             2.4s
 => => extracting sha256:ca266fd6192108b67fb57b74753a8c4ca5d8bd458baae3d4df7ce9f42dedcc1d                                             0.1s
 => => extracting sha256:ee7d78be1eb92caf6ae84fc3af736b23eca018d5dedc967ae5bdee6d7082403b                                             0.0s
 => [internal] load build context                                                                                                     0.0s
 => => transferring context: 536.53kB                                                                                                 0.0s
 => [2/3] COPY app.js /app.js                                                                                                         0.0s
 => [3/3] COPY html/ /html                                                                                                            0.0s
 => exporting to image                                                                                                                1.4s
 => => exporting layers                                                                                                               1.4s
 => => writing image sha256:4bfca9a81f0a0037bbca65840baa67fbdc6624e4aa1e3c01b0ad6dfe2e755805                                          0.0s
 => => naming to docker.io/library/kiada:latest                                                                                       0.0s
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```

- `docker images`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker images
REPOSITORY   TAG            IMAGE ID       CREATED              SIZE
kiada        latest         4bfca9a81f0a   About a minute ago   909MB
redis        alpine         20658529aaf6   2 days ago           46.1MB
busybox      latest         9211bbaa0dbd   3 weeks ago          4.26MB
redis        5.0.7-alpine   b68707e68547   3 years ago          29.8MB
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```

- ![Building a new container image using a Dockerfile Diagram](/images/assets/Build%20Container.jpg)

## Understanding the image layers
- `docker history kiada:latest`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker history kiada:latest
IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
4bfca9a81f0a   8 minutes ago   ENTRYPOINT ["node" "app.js"]                    0B        buildkit.dockerfile.v0
<missing>      8 minutes ago   COPY html/ /html # buildkit                     533kB     buildkit.dockerfile.v0
<missing>      8 minutes ago   COPY app.js /app.js # buildkit                  2.98kB    buildkit.dockerfile.v0
<missing>      4 months ago    /bin/sh -c #(nop)  CMD ["node"]                 0B        
<missing>      4 months ago    /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B        
<missing>      4 months ago    /bin/sh -c #(nop) COPY file:4d192565a7220e13…   388B      
<missing>      4 months ago    /bin/sh -c set -ex   && for key in     6A010…   7.59MB    
<missing>      4 months ago    /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.19     0B        
<missing>      4 months ago    /bin/sh -c ARCH= && dpkgArch="$(dpkg --print…   98.5MB    
<missing>      4 months ago    /bin/sh -c #(nop)  ENV NODE_VERSION=16.20.2     0B        
<missing>      4 months ago    /bin/sh -c groupadd --gid 1000 node   && use…   334kB     
<missing>      4 months ago    /bin/sh -c set -ex;  apt-get update;  apt-ge…   510MB     
<missing>      4 months ago    /bin/sh -c apt-get update && apt-get install…   146MB     
<missing>      4 months ago    /bin/sh -c set -eux;  apt-get update;  apt-g…   33MB      
<missing>      4 months ago    /bin/sh -c #(nop)  CMD ["bash"]                 0B        
<missing>      4 months ago    /bin/sh -c #(nop) ADD file:d9c3e291731c1f06d…   114MB   
```
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

## Run the Container

- `docker run --name kiada-container -p 1234:8080 -d kiada 4bfca9a81f0a`
```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker run --name kiada-container -p 1234:8080 -d kiada 4bfca9a81f0a
0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```
## Accessing your app
- Now access the application at http://localhost:1234 using curl or your
internet browser:
$ curl localhost:1234
Kiada version 0.1. Request processed by "44d76963e8e1". Client IP
- **http://localhost:1234**

- ![Web Page](/images/assets/web-page.jpg)


## Listing all running containers

- `docker ps`
```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                       NAMES
0cb55d06e475   kiada     "node app.js 4bfca9a…"   6 minutes ago   Up 6 minutes   0.0.0.0:1234->8080/tcp, :::1234->8080/tcp   kiada-container
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 

```

## Getting additional information about a container

- `docker inspect kiada-container`
```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker inspect kiada-container
[
    {
        "Id": "0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4",
        "Created": "2024-01-12T07:01:57.013906114Z",
        "Path": "node",
        "Args": [
            "app.js",
            "4bfca9a81f0a"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 7398,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2024-01-12T07:01:58.571955789Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:4bfca9a81f0a0037bbca65840baa67fbdc6624e4aa1e3c01b0ad6dfe2e755805",
        "ResolvConfPath": "/workspace/.docker-root/containers/0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4/resolv.conf",
        "HostnamePath": "/workspace/.docker-root/containers/0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4/hostname",
        "HostsPath": "/workspace/.docker-root/containers/0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4/hosts",
        "LogPath": "/workspace/.docker-root/containers/0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4/0cb55d06e475008dacf1ef06c3f0cc78cbdaac52c4ef798d1976c9e3c0f08fb4-json.log",
        "Name": "/kiada-container",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {
                "8080/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "1234"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                17,
                162
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "gitpod",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware",
                "/sys/devices/virtual/powercap"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/workspace/.docker-root/overlay2/c2bdcc99752cd65ce4a4cbd59c4b7dd380d2f23be4627697fe8c9325b63e9727-init/diff:/workspace/.docker-root/overlay2/5t3do15r70iah60aau771oyou/diff:/workspace/.docker-root/overlay2/oro3fngy2rdvznak3808p0jbm/diff:/workspace/.docker-root/overlay2/e2f096e16b94924e89534c3e855df7ea830eae6e3ff007cecb53b4929c8b24aa/diff:/workspace/.docker-root/overlay2/25d86ff6adac783421b30327252817473521ad7e924526a4e5ac40ca0dd20763/diff:/workspace/.docker-root/overlay2/7f8cf0421fa78f9d701ac596963814fbb3dea1b46dcdd69bba69e892a70a4af8/diff:/workspace/.docker-root/overlay2/c18321f5f4509da50ae109c61aa18d279147f51c2bbd7564b47c3c1888647826/diff:/workspace/.docker-root/overlay2/4433f9c95c697457b44a6b7df085a4f9cf9e75d7670d337560cac4ebbd639fd3/diff:/workspace/.docker-root/overlay2/09a85944a9f68de3e82661b82bb099b9eb6abe465f47bbaea6cd8ccd1f5f4e04/diff:/workspace/.docker-root/overlay2/e5ecd8970acedfacf664ee478c302fba725237bcb740e0311b33f6692ab30410/diff:/workspace/.docker-root/overlay2/7d73df1c459cb9974b0d3ec4c5d74bd9053cb67dd5b9737af310128cf885df75/diff",
                "MergedDir": "/workspace/.docker-root/overlay2/c2bdcc99752cd65ce4a4cbd59c4b7dd380d2f23be4627697fe8c9325b63e9727/merged",
                "UpperDir": "/workspace/.docker-root/overlay2/c2bdcc99752cd65ce4a4cbd59c4b7dd380d2f23be4627697fe8c9325b63e9727/diff",
                "WorkDir": "/workspace/.docker-root/overlay2/c2bdcc99752cd65ce4a4cbd59c4b7dd380d2f23be4627697fe8c9325b63e9727/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "0cb55d06e475",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "8080/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NODE_VERSION=16.20.2",
                "YARN_VERSION=1.22.19"
            ],
            "Cmd": [
                "4bfca9a81f0a"
            ],
            "Image": "kiada",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "node",
                "app.js"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "18c0ed33c2dd90d2750804542dcf85481483ab58a68f66c6ee1ca3161e033fae",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "8080/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "1234"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "1234"
                    }
                ]
            },
            "SandboxKey": "/var/run/docker/netns/18c0ed33c2dd",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "4a77dfac255017bea8ccf677d4648d2b6898f29a576b65890e540ac81cbf95c4",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "fd581bec4f90c91da72d2f2c9674e434df1d17c64058de8049df5731808f1235",
                    "EndpointID": "4a77dfac255017bea8ccf677d4648d2b6898f29a576b65890e540ac81cbf95c4",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```

## Inspecting the application log

- `docker logs kiada-container`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker logs kiada-container
Kiada - Kubernetes in Action Demo Application
---------------------------------------------
Kiada 0.1 starting...
Local hostname is 0cb55d06e475
Listening on port 8080
Received request for / from ::ffff:192.168.215.12
Received request for /html from ::ffff:192.168.215.12
Received request for /stylesheet.css from ::ffff:192.168.215.12
Received request for /cover.png from ::ffff:192.168.215.12
Received request for /favicon.ico from ::ffff:192.168.215.12
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 

```

## Distributing the container image

### Tagging an image under an additional tag

- `docker tag kiada akhlab/kidad:0.1`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker tag kiada akhlab/kidad:0.1
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker images
REPOSITORY     TAG            IMAGE ID       CREATED          SIZE
akhlab/kidad   0.1            4bfca9a81f0a   22 minutes ago   909MB
kiada          latest         4bfca9a81f0a   22 minutes ago   909MB
redis          alpine         20658529aaf6   2 days ago       46.1MB
busybox        latest         9211bbaa0dbd   3 weeks ago      4.26MB
redis          5.0.7-alpine   b68707e68547   3 years ago      29.8MB
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```

## Pushing the image to Docker Hub

- **docker login -u yourid docker.io**


```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker login
Log in with your Docker ID or email address to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com/ to create one.
You can log in with your password or a Personal Access Token (PAT). Using a limited-scope PAT grants better security and is required for organizations using SSO. Learn more at https://docs.docker.com/go/access-tokens/

Username: akhlab
Password: 
WARNING! Your password will be stored unencrypted in /home/gitpod/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ 
```

- `docker push akhlab/kiada:0.1`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker push akhlab/kiada:0.1
The push refers to repository [docker.io/akhlab/kiada]
96f692eb4c1b: Pushed 
7259ad58429e: Pushed 
be322b479aee: Layer already exists 
d41bcd3a037b: Layer already exists 
fe0d845e767b: Layer already exists 
f25ec1d93a58: Layer already exists 
794ce8b1b516: Layer already exists 
3220beed9b06: Layer already exists 
684f82921421: Layer already exists 
9af5f53e8f62: Layer already exists 
0.1: digest: sha256:87bac31a92d9ef86ee6405d97cb6b2f9ff044f6b5937c0ac529326e434851784 size: 2422
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $
```

## Running the image on other hosts

- `docker run --name kiada-container -p 1234:8080 -d akhlab/kiada:0`

- **(it doesn’t)**

## Stopping and deleting the container
### Stopping a container

- `docker stop kiada-container`

## Deleting a container

- `docker rm kiada-container`

-  `docker rmi kiada:latest`

## Understanding containers

### Running a shell inside an existing container
- `docker exec -it kiada-container bash`

```bash
gitpod /workspace/Kubernetes-in-Action/understanding-containers/kiada-0.1 (main) $ docker exec -it kiada-container bash
root@0adbacabd3fb:/# 
```

- `ps aux`

```bash
root@0adbacabd3fb:/# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.1  0.0 585960 36008 ?        Ssl  07:29   0:00 node app.js
root         122  0.0  0.0   3868  3280 pts/0    Ss   07:29   0:00 bash
root         128  0.0  0.0   7640  2820 pts/0    R+   07:30   0:00 ps aux
root@0adbacabd3fb:/# 
```

## Seeing container processes in the host’s list of processes

```bash
root@0adbacabd3fb:/# ps aux | grep app.js
root           1  0.0  0.0 585960 36008 ?        Ssl  07:29   0:00 node app.js
root         130  0.0  0.0   1036   244 pts/0    D+   07:31   0:00 grep app.js
root@0adbacabd3fb:/# 
```

- `ls`
```bash
root@0adbacabd3fb:/# ls
app.js  bin  boot  dev  etc  home  html  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@0adbacabd3fb:/# 
```

**Happy Kubernetes Journey...!!!**

