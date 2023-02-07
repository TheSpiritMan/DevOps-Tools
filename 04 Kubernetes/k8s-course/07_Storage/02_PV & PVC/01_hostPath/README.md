# <b>HostPath</b>
## <b>PV</b>
- Apply `pv.yaml`.
- Command:
    ```
    kubectl apply -f pv.yaml
    ```
- Check the `pv` reources.
- Command:
    ```
    kubectl get pv
    ```
- Output:
    ```
    NAME    CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
    my-pv   1000Mi     RWO            Recycle          Available           standard                4s
    ```
- We can see that it is in <b>Available</b> status, which means it can be claimed.


## <b>PVC</b>
- Apply, `pvc.yaml`.
- Command:
    ```
    kubectl apply -f pvc.yaml
    ```
- Check the `pvc` and `pv` reources.
- Command:
    ```
    kubectl get pvc,pv
    ```
- Output:
    ```
    NAME                           STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    persistentvolumeclaim/my-pvc   Bound    my-pv    1000Mi     RWO            standard       39s

    NAME                     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM            STORAGECLASS   REASON   AGE
    persistentvolume/my-pv   1000Mi     RWO            Recycle          Bound    default/my-pvc   standard                3m44s
    ```
- We can see that both `pv` and `pvc` is in <b>Bound</b> status.
- Our <b>PVC</b> was created for `500Mi`, but there was no matching <b>PV</b> so <b>PV</b> of available rsources was assigned.

## <b>Pod using PVC</b>
- Apply `pod.yaml`
- Command:
    ```
    kubectl apply -f pod.yaml
    ```
- Check the `pvc`,`pv` and `pod` reources.
- Command:
    ```
    kubectl get pvc,pv,pod
    ```
- Output:
    ```
    NAME                           STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
    persistentvolumeclaim/my-pvc   Bound    my-pv    1000Mi     RWO            standard       5m23s

    NAME                     CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM            STORAGECLASS   REASON   AGE
    persistentvolume/my-pv   1000Mi     RWO            Recycle          Bound    default/my-pvc   standard                8m28s

    NAME          READY   STATUS    RESTARTS   AGE
    pod/pvc-pod   1/1     Running   0          7s
    ```

- We can see that our pod is running. Now describe the pod `pvc-pod`.
- Command:
    ```
    kubectl describe pod pvc-pod
    ```
- We will get all the details about the pod.
- <b>Volumes</b> section of that pod:
    ```
    Volumes:
    pv1:
        Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
        ClaimName:  my-pvc
        ReadOnly:   false
    ```
- We can see that our has successfully used PVC named `my-pvc`.
- Also, in <b>Events</b> section, we can output:
    ```
    Events:
    Type    Reason     Age   From               Message
    ----    ------     ----  ----               -------
    Normal  Scheduled  90s   default-scheduler  Successfully assigned default/pvc-pod to knode1
    Normal  Pulling    89s   kubelet            Pulling image "tomcat"
    Normal  Pulled     87s   kubelet            Successfully pulled image "tomcat" in 2.737114306s (2.737129511s including waiting)
    Normal  Created    87s   kubelet            Created container tomcat-with-pvc
    Normal  Started    86s   kubelet            Started container tomcat-with-pvc
    ```
- We can see that it is scheduled to node `knode1`.
- Get a shell of `knode1`.
- Change directory to `/tmp`. We can see that `pvdata` folder is created from the Persistent Volume.
- All the logs will be stored in this `pvdata` folder inside `knode1`.