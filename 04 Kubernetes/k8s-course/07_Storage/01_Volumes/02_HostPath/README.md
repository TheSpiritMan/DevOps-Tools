# <b>HostPath Volume</b>
- <b>HostPath Volume</b> is type of Volume Mount where volume is mounted in a directory fo the worker node.

- <b>Command</b>:
    ```
    kubectl apply -f hostPath-vol.yaml
    ```
- Now check for it:
    ```
    kubectl get po
    ```
- Output:
    ```
    NAME   READY   STATUS              RESTARTS   AGE
    pod    0/1     ContainerCreating   0          12m
    ```
- Describe pod/pod:
    ```
    kubectl describe pod/pod | tail
    ```
- Output:
    ```
    Events:
    Type     Reason       Age                  From               Message
    ----     ------       ----                 ----               -------
    Normal   Scheduled    14m                  default-scheduler  Successfully assigned default/pod to knode1
    Warning  FailedMount  9m44s                kubelet            Unable to attach or mount volumes: unmounted volumes=[hostpath-volume], unattached volumes=[kube-api-access-pjv5d hostpath-volume]: timed out waiting for the condition
    Warning  FailedMount  106s (x14 over 14m)  kubelet            MountVolume.SetUp failed for volume "hostpath-volume" : hostPath type check failed: /tmp/logs is not a directory
    Warning  FailedMount  41s (x5 over 12m)    kubelet            Unable to attach or mount volumes: unmounted volumes=[hostpath-volume], unattached volumes=[hostpath-volume kube-api-access-pjv5d]: timed out waiting for the condition
    ```

- We can see that it has failed. It gives error as <b>FailedMount</b>.
- Create a folder `/tmp/logs` in scheduled node i.e. `knode1`.

- Now, check for pod: `kubectl get po`. Output:
    ```
    NAME   READY   STATUS    RESTARTS   AGE
    pod    1/1     Running   0          20m
    ```
- We can see that it is running successfully.
- We can also verify that the logs are stored in `/tmp/logs` of `knode1`.
- Go to `knode1`. And run:
    ```
    ls /tmp/logs/
    ```
- Output:
    ```
    catalina.2023-01-03.log  localhost_access_log.2023-01-03.txt
    ```

- Now, even if we delete that pod, our logs will stillbe available for later on.
- We can read logs whenever we want.