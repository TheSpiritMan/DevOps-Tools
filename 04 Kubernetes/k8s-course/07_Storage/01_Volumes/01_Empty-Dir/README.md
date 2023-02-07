# <b>Empty Dir</b>
- It creates a new volume.
- It mounts a folder to volume.
- It shared the folder across a containers.

## <b>Example</b>
- Command: 
    ```
    kubectl apply -f empty-dir.yaml
    ```

- It will take some time to create all the containers.

## <b>Validate Volume Shared</b>
- Get shell of all the containers.
- <b>centos</b>
    - Command:
        ```
        kubectl exec -it empty-dir-vol -c centos -- bash
        ```
    - Run `cd /shared-1; ls; cat *`
    - Output:
        ``` 
        alpine.txt  centos.txt  ubuntu.txt
        Hello From Alpine
        Hello from centos
        Hello from Ubuntu
        ```
    
- <b>ubuntu</b>
    - Command:
        ```
        kubectl exec -it empty-dir-vol -c ubuntu -- bash
        ```
    - Run `cd /shared-2; ls; cat *`
    - Output:
        ``` 
        alpine.txt  centos.txt  ubuntu.txt
        Hello From Alpine
        Hello from centos
        Hello from Ubuntu
        ```

- <b>alpine</b>
    - Command:
        ```
        kubectl exec -it empty-dir-vol -c alpine -- sh
        ```
    - Run `cd /shared-3; ls; cat *`
    - Output:
        ``` 
        alpine.txt  centos.txt  ubuntu.txt
        Hello From Alpine
        Hello from centos
        Hello from Ubuntu
        ```

## <b>Notes:</b>
- Once deleting the pod, volumes will also be deleted.
- So volume cannot be used in another pod.
- If pod gets deleted due to some reason, all the logs will also be deleted.