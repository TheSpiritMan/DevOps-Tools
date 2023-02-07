# <b>Metrics Server</b>
- To install `metric server`, run following command:
    ```
    kubectl apply -f metrics-component.yaml
    ```
- It will take some time to create mertics-server.

- <b>Remember</b>, if you use yaml file from Official Github page, then add `--kubelet-insecure-tls` in Deployment section under container's argument.

## Validate metrics server is working file
- Command:
    ```
    kubectl top nodes
    ```
- Output:
    ```
    NAME      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
    kmaster   467m         23%    1447Mi          38%       
    knode1    199m         9%     833Mi           45%       
    knode2    163m         8%     570Mi           66% 
    ```
    