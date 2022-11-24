# <b>Docker Swarm Service</b>
- Since we already have cluster ready from previous lab, let's create a service.
- In `Docker Swarm`, Services are used to create a container.

## <b>Help Menu of Docker Service</b>
<img src=../../../Assets/03_Docker_Lab9-11.png>


## <b>Example: Nginx</b>
- Let's create a service running a nginx server in our nodes.
- Go to `Manager` node. All the services are created in Manager node.
- `master1` is Manager node in our case.
- Firstly, pull nginx image. Command:
    ```
    docker pull nginx:latest
    ```
- While creating a service, images will be automatically downloaded if it is not available in local registry.

- Syntax:
    ```
    docker service create --name <service_name> -p <host_port>:<container_port> --replicas <num> <image_name>:<tag>
    ```

- Actual Command:
    ```
    docker service create --name nginx_web -p 80:80 --replicas 5 nginx:latest
    ```

    Output:

    <img src=../../../Assets/03_Docker_Lab9-12.png>

- Brief about above command:
    - `docker service create`: To create new service
    - `--name`: To assign the name for service
    - `nginx_web`: Custom Name for service
    - `-p`: To forward the port
    - `--replicas`: To create Number of Tasks 
    - `nginx:latest`: Is the image being used by the service

## <b>List all the services</b>
- Command: `docker service ls`

    Output:

    <img src=../../../Assets/03_Docker_Lab9-13.png>

## <b>List the running container</b>
- There are 2 types to list the services tasks/containers.
    - <b>First:</b>
        - We can use the docker command to list the container.
            Command:
            ```
            docker ps
            ```
        - The above command only shows the container running in the single machine. 
        - Output from `master1`:
            <img src=../../../Assets/03_Docker_Lab9-14.png>

        - Output from `worker1`:
            <img src=../../../Assets/03_Docker_Lab9-15.png>

        - Output from `worker2`:
            <img src=../../../Assets/03_Docker_Lab9-16.png>

        - Output from `worker3`:
            <img src=../../../Assets/03_Docker_Lab9-17.png>

        - Since we have created 5 replicas, all the replicas are distributed among all the nodes available in the Docker Swarm.

    - <b>Second:</b>
        - We can use service command to list the container.

            Syntax: `docker service ps <service_name>`

            Command:
                ```
                docker service ps nginx_web
                ``` 

            Output:

            <img src=../../../Assets/03_Docker_Lab9-18.png>

        - The above command must be run on <b>Manager Node</b> i.e `master1` for our case.


## <b>Inspect the Service</b>
- Syntax: `docker service inspect --pretty <service_name>`
- Command: 
    ```
    docker service inspect --pretty nginx_web
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab9-19.png>


## <b>Check the loadbalancer</b>
- Let's remove the container from `master1`.
- Syntax:
    ```
    docker rm <Container_ID> --force
    ```
    Output:

    <img src=../../../Assets/03_Docker_Lab9-20.png>

- As we forcefully removed the running container from the `Docker Swarm`. Now the total numbers of replicated tasks is decreasead to 4. But we have created service to run 5 replicas of the task. 
- So the `Docker Swarm` must create the new task to fulfill the total numbers of replica set. It might create the new task in any node.

- List all the tasks/containers.

    Output:
    <img src=../../../Assets/03_Docker_Lab9-21.png>

- As we can see that the replica number 4 was shutdown. So with same name new task is created in `master1` node.


## <b>Access the nginx service from Browser</b>
- Since we have forwarded all the task to port 80 of the host machine. we can easily access the nginx webpage fromthe IP address of the nodes,
- They are:
    - `192.168.57.6`: For `master1`
    - `192.168.57.3`: For `worker1`
    - `192.168.57.4`: For `worker2`
    - `192.168.57.5`: For `worker3`

- Visit all IP address on the browser. If everything works fine, then all the IP should display nginx home page as below;
    <img src=../../../Assets/03_Docker_Lab9-22.png>


## <b>Scale the Service</b>
- We can also scale the service to increase or decreade the numbers of task.
- Syntax: `docker service scale <service_name>=<REPLICAS_Num>`
- Command: 
    ```
    docker service scale nginx_web=10
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab9-23.png>

- List all the task:
    <img src=../../../Assets/03_Docker_Lab9-24.png>


## <b>Remove the service from Swarm</b>
- Once our task is completed, we can remove the service.
- Syntax: `docker service rm <service_name>`
- Command:
    ```
    docker service rm nginx_web
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab9-25.png>
