# <b>Drain-Uncordon</b>

## <b>Drain</b>
- When doing something with node like switching Operating System or hardware upgrade, then we have to drain the node so that all the pods created using deployment in that node can be scheduled to other available nodes.
- Remember, it only scheduled pods created using deployment not other pod.
- <b>Command:</b>
    ```
    kubectl drain knode1 --ignore-daemonsets
    ```
   - `--ignore-daemonsets`: This flag will ignore DaemonSet like calico and kube-proxy.
  
- <b>Output:</b>
    ```
    node/knode1 already cordoned
    Warning: ignoring DaemonSet-managed Pods: kube-system/calico-node-hk4bw, kube-system/kube-proxy-n7qlw
    evicting pod kube-system/coredns-787d4945fb-ctm2z
    evicting pod kube-system/calico-kube-controllers-7bdbfc669-2mkqr
    pod/coredns-787d4945fb-ctm2z evicted
    pod/calico-kube-controllers-7bdbfc669-2mkqr evicted
    node/knode1 drained
    ```

- List all the nodes:
    ```
    kubectl get nodes
    ```
    <b>Output:</b>
    ```
    NAME      STATUS                     ROLES           AGE   VERSION
    kmaster   Ready                      control-plane   16d   v1.26.0
    knode1    Ready,SchedulingDisabled   <none>          16d   v1.26.0
    knode2    Ready                      <none>          16d   v1.26.0
    ```

- From above output, we can see that `knode1` is still in cluster but scheduling in that node is disabled.
- Now we do maintainance in that node `knode1`.

## <b>Uncordon</b>
- Once all the maintainance is done, we can now make node `knode1` available for scheduling, that is done using `uncordon` command.
- <b>Command:</b>
    ```
    kubectl uncordon knode1
    ```
- <b>Output:</b>
    ```
    node/knode1 uncordoned
    ```
- List all the nodes:
    ```
    kubectl get nodes
    ```
    <b>Output:</b>
    ```
    NAME      STATUS   ROLES           AGE   VERSION
    kmaster   Ready    control-plane   16d   v1.26.0
    knode1    Ready    <none>          16d   v1.26.0
    knode2    Ready    <none>          16d   v1.26.0
    ```

## <b>Cordon</b>
- `Cordon` command keeps running pods that are already ruuning in a node but will be unavailable for new pods.
- <b>Example:</b>
    - Create a deployment in `knode2`. Command:
        ```
        kubectl apply -f ex1-deploy-knode2.yaml
        ```
    - List all the pods:
        ```
        NAME                    READY   STATUS    RESTARTS   AGE   IP             NODE     NOMINATED NODE   READINESS GATES
        pods-557976d7cf-czd7d   1/1     Running   0          62s   12.12.69.201   knode2   <none>           <none>
        pods-557976d7cf-fklfd   1/1     Running   0          62s   12.12.69.239   knode2   <none>           <none>
        pods-557976d7cf-gb5tz   1/1     Running   0          62s   12.12.69.238   knode2   <none>           <none>
        pods-557976d7cf-k69zh   1/1     Running   0          62s   12.12.69.199   knode2   <none>           <none>
        pods-557976d7cf-l4lbv   1/1     Running   0          62s   12.12.69.227   knode2   <none>           <none>
        ```

    - We can see that all the pods are running in `knode2`.
    - Now lets cordon `knode2`. 
        ```
        kubectl cordon knode2
        ```
    - List all the nodes:
        ```
        kubectl get nodes
        ```
    - <b>Output:</b>
        ```
        NAME      STATUS                     ROLES           AGE   VERSION
        kmaster   Ready                      control-plane   16d   v1.26.0
        knode1    Ready                      <none>          16d   v1.26.0
        knode2    Ready,SchedulingDisabled   <none>          16d   v1.26.0
        ```
    
    - List all the pods:
        ```
        NAME                    READY   STATUS    RESTARTS   AGE     IP             NODE     NOMINATED NODE   READINESS GATES
        pods-557976d7cf-czd7d   1/1     Running   0          5m16s   12.12.69.201   knode2   <none>           <none>
        pods-557976d7cf-fklfd   1/1     Running   0          5m16s   12.12.69.239   knode2   <none>           <none>
        pods-557976d7cf-gb5tz   1/1     Running   0          5m16s   12.12.69.238   knode2   <none>           <none>
        pods-557976d7cf-k69zh   1/1     Running   0          5m16s   12.12.69.199   knode2   <none>           <none>
        pods-557976d7cf-l4lbv   1/1     Running   0          5m16s   12.12.69.227   knode2   <none>           <none>
        ```

    - From above output, we can see that all the pods are running fine. This means `cordon` keeps running the pods which are already running but itmakes `knode2` unavailable for scheduling of new pods.

## <b>Uncordon</b>
- We can now make node `knode2` available for scheduling, that is done using `uncordon` command.
- <b>Command:</b>
    ```
    kubectl uncordon knode2
    ```
- <b>Output:</b>
    ```
    node/knode2 uncordoned
    ```
- List all the nodes:
    ```
    kubectl get nodes
    ```
    <b>Output:</b>
    ```
    NAME      STATUS   ROLES           AGE   VERSION
    kmaster   Ready    control-plane   16d   v1.26.0
    knode1    Ready    <none>          16d   v1.26.0
    knode2    Ready    <none>          16d   v1.26.0
    ```
