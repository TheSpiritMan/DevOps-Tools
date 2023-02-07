# <b>Etcd-Backup</b>
- Before backing up etcd, we must have `etcdctl` installed in our master node.
- Run the `/vagrant/Setup/script/etcd-utils.sh` script in master node only.
- Command:
    ```
    sh /vagrant/Setup/script/etcd-utils.sh
    ```
- `Etcd` version used in script is `3.5.0`
- Then we are ready to backup etcd.

## What is etcd?
- <b>`Etcd`</b> is database of the kubernetes cluster where all records are stored in a key value pair.
- It keeps record of the running pods, deloyments and all the things available in Kubernetes Cluster.

## Why do we need to backup etcd?
- We need to backup `etcd` because in future if our cluster is damaged or catches fire or any possible disaster happens, then we can restore our Cluster using backed-up etcd files.

## <b>Etcd Snapshot Explanation</b>
- The idea is to create a snapshot of the etcd database.
- This is done by communicating with the running `etcd instance` in Kubernetes and asking it to create a snapshot.
- In order to communicate with the etcd pod in Kubernetes, we need:
    - `etcdctl`: tool to talk with etcd server.
    - `snapshot save`: sub-command to create snaphot.
    - `IP Address` of node running etcd pod i.e `master` node in must case.
    - `Port` used by `etcd`. Default port is `2379`.
    - Correct etcd API version as env variables (i.e `--env ETCDCTL_API=3`).
    - <b>2 Certificates:</b>
        - `--cacert /etc/kubernetes/pki/etcd/ca.crt`
        - `--cert /etc/kubernetes/pki/etcd/server.crt`
    
    - <b>1 Key:</b>
        - `--key /etc/kubenetes/pki/etcd/server.key`
    - Path to store backup.

## <b>Etcd Backup</b>
- Before creating backup, create some pods,deployment anything.
- Run `collection.yaml`.
- Make `/etcd-backup` folder. Command: `sudo mkdir /etcd-backup`
- Now create a snapshot:
    ```
    sudo ETCDCTL_API=3 etcdctl --endpoints=192.168.57.20:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key snapshot save /etcd-backup/etcd-snapshot-1.db
    ```
- <b>Output:</b>
    ```
    {"level":"info","ts":1672689812.0715759,"caller":"snapshot/v3_snapshot.go:68","msg":"created temporary db file","path":"/etcd-backup/etcd-snapshot-1.db.part"}
    {"level":"info","ts":1672689812.0938225,"logger":"client","caller":"v3/maintenance.go:211","msg":"opened snapshot stream; downloading"}
    {"level":"info","ts":1672689812.093886,"caller":"snapshot/v3_snapshot.go:76","msg":"fetching snapshot","endpoint":"192.168.57.20:2379"}
    {"level":"info","ts":1672689812.2122366,"logger":"client","caller":"v3/maintenance.go:219","msg":"completed snapshot read; closing"}
    {"level":"info","ts":1672689812.5677347,"caller":"snapshot/v3_snapshot.go:91","msg":"fetched snapshot","endpoint":"192.168.57.20:2379","size":"4.7 MB","took":"now"}
    {"level":"info","ts":1672689812.5682333,"caller":"snapshot/v3_snapshot.go:100","msg":"saved","path":"/etcd-backup/etcd-snapshot-1.db"}
    Snapshot saved at /etcd-backup/etcd-snapshot-1.db
    ```

##  <b>Snapshot Status Check</b>
- <b>Command:</b>
    ```
    sudo etcdutl snapshot status /etcd-backup/etcd-snapshot-1.db  --write-out=table
    ```
- <b>Output:</b>
    ```
    +----------+----------+------------+------------+
    |   HASH   | REVISION | TOTAL KEYS | TOTAL SIZE |
    +----------+----------+------------+------------+
    | f8c5c266 |     2175 |       1160 |     4.8 MB |
    +----------+----------+------------+------------+
    ```


## <b>Restore Etcd</b>
- Before restoring, delete some pod and `/var/lib/etcd` folder.
- Command: 
    ```
    kubectl delete pod pod1
    sudo rm -rf /var/lib/etcd
    ```
- Get list of nodes. Command: `kubectl get nodes`
- Output:
    ```
    No resources found
    ```
- This means our cluster is gone.

- <b>Etcd Restore Command</b>:
    ```
    sudo ETCDCTl_API=3 etcdutl snapshot restore /etcd-backup/etcd-snapshot-1.db --initial-cluster=kmaster=http://192.168.57.20:2380 --initial-advertise-peer-urls=http://192.168.57.20:2380 --name kmaster --data-dir /var/lib/etcd-2
    ```
    - `ETCDCTl_API=3`: Etcd API version
    - `etcdutl`: binary file to restore snapshot. `etcdctl` is deprecated for restoring.
    - `snapshot restore`: sub-command to restore
    - `--name`: assign name for this member
    - `--initial-cluster`: Initial Cluster Configuration for restore bootstrap
    - `--initial-advertise-peer-urls`: List of this member's peer URLs to advertise to the rest of the cluster
    - `--data-dir`: Path to the output data directory

- <b>Output:</b>
    ```
    2023-01-03T13:20:05Z    info    membership/store.go:119 Trimming membership information from the backend...
    2023-01-03T13:20:06Z    info    membership/cluster.go:393       added member    {"cluster-id": "24f93bde2aeafb0", "local-member-id": "0", "added-peer-id": "b301d4f881ee06", "added-peer-peer-urls": ["http://192.168.57.20:2380"]}
    2023-01-03T13:20:06Z    info    snapshot/v3_snapshot.go:272     restored snapshot       {"path": "/etcd-backup/etcd-snapshot-1.db", "wal-dir": "/var/lib/etcd-2/member/wal", "data-dir": "/var/lib/etcd-2", "snap-dir": "/var/lib/etcd-2/member/snap"}
    ```

- Even it says restored snapshot, but the snapshot is not added into cluster. It has simply created the new data directory in `/var/lib/etcd-2`. 

- Edit `/etc/kubernetes/manifests/etcd.yaml`. Command: 
    ```
    sudo vim /etc/kubernetes/manifests/etcd.yaml
    ```
- Now change following values: 
- `--data-dir` value to `/var/lib/etcd-2`.

- `mountPath` value to `/var/lib/etcd-2`
- `hostPath` value to `/var/lib/etcd-2` only in etcd-data.
- Now wait from  1min to 3min.
- Then, do `kubectl get no`. Output:
    ```
    NAME      STATUS   ROLES           AGE   VERSION
    kmaster   Ready    control-plane   48m   v1.26.0
    knode1    Ready    <none>          47m   v1.26.0
    knode2    Ready    <none>          47m   v1.26.0
    ```

- Now try `kubectl get all`. Output:
    ```
    NAME                                     READY   STATUS             RESTARTS        AGE
    pod/collection-deploy-64685f7c44-22l6v   2/2     Running            0               10m
    pod/collection-deploy-64685f7c44-7jc49   2/2     Running            0               10m
    pod/collection-deploy-64685f7c44-9d64f   2/2     Running            0               10m
    pod/collection-deploy-64685f7c44-w76c9   2/2     Running            0               10m
    pod/collection-deploy-64685f7c44-zjvqp   2/2     Running            0               10m
    pod/pod1                                 0/1     CrashLoopBackOff   6 (3m57s ago)   10m

    NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)                       AGE
    service/col-svc      NodePort    10.96.10.171   <none>        80:32222/TCP,8080:32223/TCP   10m
    service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP                       48m

    NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/collection-deploy   5/5     5            5           10m

    NAME                                           DESIRED   CURRENT   READY   AGE
    replicaset.apps/collection-deploy-64685f7c44   5         5         5       10m
    ```

- Also, try `kubectl get all -n kube-system`. Output:
    ```
    NAME                                          READY   STATUS    RESTARTS        AGE
    pod/calico-kube-controllers-7bdbfc669-rv42v   1/1     Running   3 (3m24s ago)   49m
    pod/calico-node-vcn74                         1/1     Running   0               49m
    pod/calico-node-vqrfh                         1/1     Running   0               49m
    pod/calico-node-xqjbx                         1/1     Running   0               49m
    pod/coredns-787d4945fb-pgpqt                  1/1     Running   0               50m
    pod/coredns-787d4945fb-zzbpw                  1/1     Running   0               50m
    pod/etcd-kmaster                              1/1     Running   0               114s
    pod/kube-apiserver-kmaster                    1/1     Running   0               51m
    pod/kube-controller-manager-kmaster           1/1     Running   8 (4m59s ago)   51m
    pod/kube-proxy-qnx6b                          1/1     Running   0               50m
    pod/kube-proxy-r29z9                          1/1     Running   0               50m
    pod/kube-proxy-zx4h5                          1/1     Running   0               50m
    pod/kube-scheduler-kmaster                    1/1     Running   8 (4m54s ago)   51m

    NAME               TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE
    service/kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   51m

    NAME                         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
    daemonset.apps/calico-node   3         3         3       3            3           kubernetes.io/os=linux   49m
    daemonset.apps/kube-proxy    3         3         3       3            3           kubernetes.io/os=linux   51m

    NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/calico-kube-controllers   1/1     1            1           49m
    deployment.apps/coredns                   2/2     2            2           51m

    NAME                                                DESIRED   CURRENT   READY   AGE
    replicaset.apps/calico-kube-controllers-7bdbfc669   1         1         1       49m
    replicaset.apps/coredns-787d4945fb                  2         2         2       50m
    ```
- All our pod, deployment, replicas set are back.

<b>ETCD Successfully Restored.</b>