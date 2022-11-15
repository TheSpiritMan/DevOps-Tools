# <b>Lab8: Docker Network</b>
- Docker takes care of networking aspects so that the containers can communicate with other containers ans also with the Docker Host.
- We can use <b>`ifconfig`</b> command in Linux and <b>`ipconfig`</b> command in Windows to see all the network adapter in System including the Docker Ethernet Adapter.

    <img src=../../Assets/03_Docker_Lab8-1.png>

- This is a <b>bridge</b> between the Docker Host and Linux Host.

## <b>Help Menu of Docker Network</b>
   <img src=../../Assets/03_Docker_Lab8-2.png>

## <b>Listing All the Docker Networks</b>
- The subcommand `ls` can be used to list all the Docker Networks.

    <img src=../../Assets/03_Docker_Lab8-3.png>

- There are 3 network driver. They are:
    - <b>bridge</b>
    - <b>host</b>
    - <b>null</b>

## <b>Inspecting a Docker Network</b>
- We can use <b>`inspect`</b> subcommand to see more details on the network associated with Docker.
- <b>Syntax:</b>
    ```
    docker network inspect <network_name>
    ```
- <b>Example: </b>

    <img src=../../Assets/03_Docker_Lab8-4.png>

- Now let's run a container from `ubuntu` image and see what happens when we inspect the network again.
- Command:
    ```
    docker run -it ubuntu:latest /bin/bash
    ```
- Once the container is running, open a new tab in a terminal and inspect the bridge network.

     <img src=../../Assets/03_Docker_Lab8-5.png>

- We can clearly see the container details while inspecting the network.


## <b>Creating Custom New Network</b>
- We can create our own network using `create` subcommand.
- Syntax:
    ```
    docker network create --driver <driver_name> <network_name>
    ```
- <b>Example:</b>
    ```
    docker network create --driver bridge custom_network
    ```

    <b>Output: </b>

    <img src=../../Assets/03_Docker_Lab8-6.png>

## <b>Using Custom Network in a Container</b>
- Since we have created a custom network, we can us it for a container of our choice.
- Create a new container assigning that network.
- The `--network` can be used to assign the network name.
- <b>Example: </b>

    <img src=../../Assets/03_Docker_Lab8-7.png>

- Now inspect the `custom_network` in another tab.
- <b>Output: </b>

    <img src=../../Assets/03_Docker_Lab8-8.png>

- We can clearly see the container details while inspecting the `custom_network`.

## <b>Remove Network</b>
- We can remove a network from our host machine which is no longer required.
- Stop all the running container and remove a network.
- The `rm` subcommand is used to remove the network.
- <b>Demo: </b>

    <img src=../../Assets/03_Docker_Lab8-9.png>


## Prune Network
- Removing all the network which is no longer used by any container.
- The subcommand `prune` is used.
- <b>Demo: </b>

    <img src=../../Assets/03_Docker_Lab8-10.png>
