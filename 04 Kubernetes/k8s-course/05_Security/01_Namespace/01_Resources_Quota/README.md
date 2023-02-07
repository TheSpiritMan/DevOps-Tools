# <b>Resource Quota</b>
- Every namespace can have resource quota.
- It is a resource limit for a namespace.
- `apiVersion`: v1
- `kind`: ResourceQuota
- `name`: resourcequotas
- `short name`: quota
- `namespace level`: true

## <b>Example1: Compute Power</b>
- Apply `ex1-test-compute.yaml` to the cluster. It will create namespace `test` and resource quota for that namespace named as `test-rq`.
- Command: 
    ```
    kubectl apply -f ex1-test-compute.yaml
    ```
- Now, describe the namespace `test` to get more details about the namespace. Command:
    ```
    kubectl describe namespace test
    ```
- Output:
    ```
    Name:         test
    Labels:       kubernetes.io/metadata.name=test
                  name=test
    Annotations:  <none>
    Status:       Active

    Resource Quotas
    Name:            test-rq
    Resource         Used  Hard
    --------         ---   ---
    limits.cpu       0     800m
    limits.memory    0     1Gi
    requests.cpu     0     500m
    requests.memory  0     512Mi

    No LimitRange resource.
    ```
- We can see that the compute power resources is assigned to `test` namespace.

## <b>Example2: Object Count</b>
- Apply `ex2-demo-objectCount.yaml` to the cluster. It will create namespace `demo` and resource quota that namespace named as `demo-rq`.
- Command: 
    ```
    kubectl apply -f ex2-demo-objectCount.yaml
    ```
- Now, describe the namespace `demo` to get more details about the namespace. Command:
    ```
    kubectl describe namespace demo
    ```
- Output:
    ```
   Name:         demo
    Labels:       kubernetes.io/metadata.name=demo
    Annotations:  <none>
    Status:       Active

    Resource Quotas
    Name:                   demo-rq
    Resource                Used  Hard
    --------                ---   ---
    count/deployment.apps   0     2
    count/replicasets.apps  0     2
    pods                    0     4
    replicationcontrollers  0     2
    services                0     5

    No LimitRange resource.
    ```
- We can see that the compute power resources is assigned to `demo` namespace.

## <b>Deployment</b>
- Apply `deploy-demo.yaml`.
- Command:
    ```
    kubectl apply -f deploy-demo.yaml
    ```
- Now, describe the namespace `demo` to get more details about the namespace. Command:
    ```
    kubectl describe namespace demo
    ```
- Output:
    ```
    Name:         demo
    Labels:       kubernetes.io/metadata.name=demo
    Annotations:  <none>
    Status:       Active

    Resource Quotas
    Name:                   demo-rq
    Resource                Used  Hard
    --------                ---   ---
    count/deployments.apps  1     2
    count/replicasets.apps  1     2
    pods                    4     4
    replicationcontrollers  0     2
    services                0     5

    No LimitRange resource.
    ```

- Now increase the number of replicas from 4 to 5, the new replicas will be not scheduled. It is because total no. of pods is 4 in Resource Quota.