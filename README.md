# xmrig-docker

## xmrig version

1. xmrig version based on 6.9.0
2. set default donate 0
3. ignore warning of msr kernel module if run in docker

## how to use

### run in docker

``` shell
docker run --network host --privileged yongman/xmrig:6.9.0-5 -o rx.unmineable.com:13333 -a rx -k -u DOGE:DBF3aJYXayG5npwDNxP3JqiqJfxAUvKL1t.github#51ml-nnil -t 40
```

### run in k8s as daemonset

``` yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: xm
spec:
  selector:
    matchLabels:
      name: xm
  template:
    metadata:
      labels:
        name: xm
    spec:
      hostNetwork: true
      imagePullSecrets:
      - name: regcred
      containers:
      - name: xm
        securityContext:
          privileged: true
        image: yongman/xmrig:6.9.2-5
        imagePullPolicy: IfNotPresent
        command: ["/bin/bash"]
        args: ["-c", "/xmrig -o rx.unmineable.com:13333 -a rx -k -u DOGE:DBF3aJYXayG5npwDNxP3JqiqJfxAUvKL1t.github#51ml-nnil -t 40"]
```
