# <b>Deployment</b>

- Deployment create <b>ReplicaSet</b>, then <b>ReplicaSet</b> creates <b>Pods</b>.

# <b>Command:</b>
- Set new app image of `v2`
    ```
    kubectl set image deploy app-deploy app=lerndevops/samplepyapp:v2 --record=true
    ```
- Set new app image of `latest`
    ```
    kubectl set image deploy app-deploy app=lerndevops/samplepyapp:latest --record=true
    ```
- New ReplicaSet will be created each times with image is assigned

- Rollout history:
    ```
    kubectl rollout history deploy app-deploy
    ```
- <b>Output:</b>
    ```
    REVISION  CHANGE-CAUSE
    1         <none>
    2         kubectl set image deploy app-deploy app=lerndevops/samplepyapp:v2 --record=true
    3         kubectl set image deploy app-deploy app=lerndevops/samplepyapp:latest --record=true
    ```

- Rollback to old stable version. Command:
    ```
    kubectl rollout undo deploy app-deploy --to-revision=1
    ```
