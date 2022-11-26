# <b>Lab 10: Docker Stack</b>
- Creating multiple services on a `Docker Swarm` using CLI in a very time consuming tasks and dificult to manage all the services.
- `Docker Stack` uses YAML file like [Docker Compose](https://github.com/TheSpiritMan/DevOps-Tools/tree/main/03%20Docker/Lab7%20-%20Docker%20Compose).
- `Docker Stack` can only be used in `Docker Swarm`.
- `Docker Stack` comes with-in `Docker Engine`.
- `Docker Stack` uses pre-built images.
- `Docker Stack` accepts only compose file of version "3.0" or above.
- `Docker Stack` file is written same as `Docker Compose` file.
- Everything inside YAML file will be under a stack name.


## <b>Docker Swarm</b>
- Use the Cluster from previous Lab of [Docker Swarm](https://github.com/TheSpiritMan/DevOps-Tools/tree/main/03%20Docker/Lab9%20-%20Docker%20Swarm).

    <img src=../../Assets/03_Docker_Lab9-7.png>


## <b>Help Menu Of Docker Stack</b> 

<img src=../../Assets/03_Docker_Lab10-1.png>


## <b>Commands brief</b>
- All the commands are entered in `manager` node.
- To deploy a stack.

    <img src=../../Assets/03_Docker_Lab10-2.png>

    Syntax: `docker stack deploy --compose-file <docker-stack-yml file> <custom_stackname>`

    Example:    
    ```
    docker stack deploy --compose-file docker-stack.yml demostack
    ```

- To list stack:
    Command:
    ```
    docker stack ls
    ```

- To list stack services:

    Syntax: `docker stack services <custom_stackname>`

    Example:    
    ```
    docker stack services demostack
    ```

- To remove stack:
    Syntax: `docker stack rm <stackname>`
    Example:
    ```
    docker stack rm demostack
    ```