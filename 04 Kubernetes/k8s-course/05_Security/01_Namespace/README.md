# <b>Namespace</b>
- <b>Namespace</b> is a Logical Division of Cluster.
- `apiVersion`: v1
- `kind`: Namespace
- `name`: namespaces
- `short name`: ns
- `namespace level`: false
- List all the namespaces:
    ```
    kubectl get ns
    ```
- Output:  
    ```
    NAME              STATUS   AGE
    default           Active   16d
    kube-node-lease   Active   16d
    kube-public       Active   16d
    kube-system       Active   16d
    ```
- There are 4 namespaces created during the initiation of Cluster.
- By default, every pods, deployment, repliaset will be created in `default` namespace.
- To create pods, deployment in different namespace, we have explicitly mentioned the name of namespace in manifest file(YAML files).



## <b>Create NameSpace</b>
- <b>Example 1:</b>
    - Command: 
        ```
        kubectl create ns ns1
        ```
    - Output:
        ```
        namespace/ns1 created
        ```
    - List all the namespaces:
        ```
        kubectl get ns
        ```
    - Output:  
        ```
        NAME              STATUS   AGE
        default           Active   16d
        kube-node-lease   Active   16d
        kube-public       Active   16d
        kube-system       Active   16d
        ns1               Active   62s
        ```
    - We can see, `ns1` namespace is created.

    - Describe namespace `ns1`.
        ```
        kubectl describe namespace ns1
        ```
    - Output:
        ```
        Name:         ns1
        Labels:       kubernetes.io/metadata.name=ns1
        Annotations:  <none>
        Status:       Active

        No resource quota.

        No LimitRange resource.
        ```
    - We can see that it is says, `No resource quota` which means no resource is assigned to this namespace `ns1`.
 


- <b>Example 2:</b>
    - Run the `ns2.yaml` and create `ns2` namespace.
    - Command:
        ```
        kubectl apply -f ns2.yaml
        ```
    - Describe namespace `ns2`.
    - Output:
        ```
        Name:         ns2
        Labels:       kubernetes.io/metadata.name=ns2
        Annotations:  <none>
        Status:       Active

        No resource quota.
        No LimitRange resource
        ```

## <b>Delete Namespace</b>:
- <b>Example 1</b>:
    - Command:
        ```
        kubectl delete ns ns1
        ```
    - Output:
        ```
        namespace "ns1" deleted
        ```

- <b>Example 2</b>:
    - Command:
        ```
        kubectl delete -f ns2.yaml
        ```
    - Output:
        ```
        namespace "ns2" deleted
        ```