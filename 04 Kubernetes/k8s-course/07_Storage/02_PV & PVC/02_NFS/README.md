# <b>NFS(Network File System)</b>

- Create new VM from `Vagrantfile`.
- Run `nfs-server.sh` inside that box.
- It setups nfs server inside that box.

- Also install `nfs-common` in all node of the Kubernetes Cluster.
- Command: 
    ```
    sudo apt-get install -y nfs-common
    ```

## Goto `kmaster` node:
- Apply `nfs-pv.yaml`, `nfs-pvc.yaml` and `deployment.yaml`.
- Command:
    ```
    kubectl apply -f nfs-pv.yaml
    kubectl apply -f nfs-pvc.yaml
    kubectl apply -f deployment.yaml
    ```

- List all the resources:
    ```
    kubectl get deploy,rs,pod,pv,pvc -o wide
    ```
- Output:
    ```
    NAME                         READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES   SELECTOR
    deployment.apps/nfs-deploy   2/2     2            2           59s   nginx        nginx    app=nginx,type=nfs

    NAME                                    DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
    replicaset.apps/nfs-deploy-5c56f57987   2         2         2       59s   nginx        nginx    app=nginx,pod-template-hash=5c56f57987,type=nfs

    NAME                              READY   STATUS    RESTARTS   AGE   IP              NODE     NOMINATED NODE   READINESS GATES
    pod/nfs-deploy-5c56f57987-99q2d   1/1     Running   0          59s   12.12.195.169   knode1   <none>           <none>
    pod/nfs-deploy-5c56f57987-t75qs   1/1     Running   0          58s   12.12.69.222    knode2   <none>           <none>

    NAME                      CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM             STORAGECLASS   REASON   AGE   VOLUMEMODE
    persistentvolume/nfs-pv   1Gi        RWX            Retain           Bound    default/nfs-pvc   nfs                     66s   Filesystem

    NAME                            STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE   VOLUMEMODE
    persistentvolumeclaim/nfs-pvc   Bound    nfs-pv   1Gi        RWX            nfs            62s   Filesystem
    ```

## Goto NFS Server host
- Goto `/mnt/appdata`.
- List all the files:
- Output:
    ```
    access.log  error.log
    ```
- Cat all the files. Command: `cat *`
- Output:
    ```
    2023/01/06 20:39:15 [notice] 1#1: using the "epoll" event method
    2023/01/06 20:39:15 [notice] 1#1: nginx/1.23.3
    2023/01/06 20:39:15 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
    2023/01/06 20:39:15 [notice] 1#1: OS: Linux 5.4.0-135-generic
    2023/01/06 20:39:15 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
    2023/01/06 20:39:15 [notice] 1#1: start worker processes
    2023/01/06 20:39:15 [notice] 1#1: start worker process 29
    2023/01/06 20:39:15 [notice] 1#1: start worker process 30
    0 (Debian 10.2.1-6) 
    2023/01/06 20:39:15 [notice] 1#1: OS: Linux 5.4.0-135-generic
    2023/01/06 20:39:15 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
    2023/01/06 20:39:15 [notice] 1#1: start worker processes
    2023/01/06 20:39:15 [notice] 1#1: start worker process 29
    2023/01/06 20:39:15 [notice] 1#1: start worker process 30
    ```

- NFS is working successfully.